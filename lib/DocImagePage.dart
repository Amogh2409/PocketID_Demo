import 'dart:ui';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocketid_demo/utils/imageUploader.dart';
import 'package:pocketid_demo/utils/users.dart';
import 'package:provider/provider.dart';

String url = "empty";

class DocImagePage extends StatefulWidget {
  const DocImagePage({super.key, required this.nameofDoc, required this.text});
  final String nameofDoc;
  final String text;

  @override
  State<DocImagePage> createState() => _DocImagePageState();
}

class _DocImagePageState extends State<DocImagePage> {
  Future<String> getDocUrl() async {
    // try {
    //   var user = FirebaseAuth.instance.currentUser;
    //   var userData = await FirebaseFirestore.instance
    //       .collection("users")
    //       .doc(user?.uid)
    //       .get();
    //   url = userData.data()?['${widget.nameofDoc}'];
    //   url = url;
    //   print("Image URL = ${url}");
    //   return url;
    // } catch (e) {
    //   print("Error = ${e}");
    //   url = "empty";
    //   return url;
    // }
    return url;
  }

  @override
  void initState() {
    setState(() {
      print("pagerefresh");
    });
    // getDocUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageManager>(
      create: (context) => ImageManager(),
      builder: (context, child) {
        return Container(
          // color: Colors.white,
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Color.fromARGB(255, 55, 14, 201),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "${widget.text}",
                  style: TextStyle(
                    fontSize: 22,
                    // color: Color.fromARGB(255, 55, 14, 201),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: 725,
                  // color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(71, 158, 158, 158),
                                offset: const Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 20.0,
                                spreadRadius: 3.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Image.asset(
                                      "assets/others.png",
                                      scale: 1,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              103, 104, 103, 103),
                                          offset: const Offset(
                                            2.0,
                                            1.0,
                                          ),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    ),
                                    // color: Colors.red,
                                    height: 210,
                                    width: 350,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Consumer<ImageManager>(
                                        builder:
                                            (context, ImageManager, child) {
                                          return FutureBuilder(
                                            future: getDocUrl(),
                                            builder: ((context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                if (snapshot.data == "empty") {
                                                  return Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Add Document",
                                                          style: TextStyle(
                                                              fontSize: 17),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(Icons
                                                            .add_box_outlined)
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          "${snapshot.data},");
                                                }
                                              }
                                            }),
                                          );
                                        },
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 60,
                                // color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Document updated?",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Consumer<ImageManager>(
                                        builder:
                                            ((context, ImageManager, child) {
                                          return GestureDetector(
                                            onTap: () {
                                              ImageManager.pickImageCamera(
                                                  widget.nameofDoc, context);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 55, 14, 201),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      Consumer<ImageManager>(
                                        builder:
                                            (context, ImageManager, child) {
                                          return GestureDetector(
                                            onTap: (() {
                                              ImageManager.pickImageGallery(
                                                widget.nameofDoc,
                                                context,
                                              );
                                            }),
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 55, 14, 201),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Icons.photo_rounded,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Consumer<ImageManager>(
                                        builder: (context, value, child) {
                                          return GestureDetector(
                                            onTap: (() {
                                              setState(() {
                                                print("Deleting");
                                                UserManagement().deleteImage(
                                                    widget.nameofDoc);
                                              });
                                            }),
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 55, 14, 201),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Icons.delete_rounded,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 90,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Note:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 55, 14, 201)),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Once the document is added the image",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 75, 75, 75)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "can be downloaded. Click on",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 75, 75, 75)),
                                    ),
                                    Text(
                                      " Add a document",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "and Get Started!",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 75, 75, 75)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(53, 159, 153, 190)),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 55, 14, 201),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Download PDF",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Color.fromARGB(255, 55, 14, 201),
                                  width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Tell your friends & family about PocketID",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 55, 14, 201),
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
