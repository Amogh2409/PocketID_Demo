import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketid_demo/utils/reusable.dart';
import 'package:pocketid_demo/utils/users.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String firstname = "";
  String lastname = "";
  String profileUrl = "empty";
  String dob = "24-04-2003";
  String email = "";
  String gender = "Male";

  Container builtContainer(title, info) {
    return Container(
      height: 68,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${title}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Row(
              children: [
                Text(
                  "${info}",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getData() async {
    // try {
    //   var user = await FirebaseAuth.instance.currentUser;
    //   var userData = await FirebaseFirestore.instance
    //       .collection("users")
    //       .doc(user?.uid)
    //       .get();
    //   setState(() {
    //     firstname = userData.data()!['fname'];
    //     lastname = userData.data()!['lname'];
    //     dob = userData.data()!['dob'];
    //     gender = userData.data()!['gender'];
    //     email = userData.data()!['email'];
    //     profileUrl = userData.data()!['profile'];
    //   });
    //   profileUrl = profileUrl;
    // } catch (e) {
    //   profileUrl = "empty";
    // }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (BuildContext context) => ProfileModel(),
      child: Scaffold(
        appBar: appBar("My Profile", context),
        body: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Color.fromARGB(255, 55, 14, 201),
                height: 165,
                width: double.infinity,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -70),
              child: Column(
                children: [
                  Consumer<ProfileModel>(
                    builder: ((context, ProfileModel, child) {
                      return GestureDetector(
                        onTap: () {
                          ProfileModel.pickImageCamera(context);
                        },
                        child: CircleAvatar(
                          radius: 68,
                          backgroundColor: Colors.grey[300],
                          child: Container(
                            height: 120,
                            width: 120,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              // border: Border.all(color: Colors.grey, width: 5)
                            ),
                            child: FutureBuilder(
                              future: futureFunction(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  if (snapshot.data == "empty") {
                                    return Icon(Icons.add_a_photo);
                                  } else {
                                    return CachedNetworkImage(
                                      placeholder: (context, profile) =>
                                          CircularProgressIndicator(),
                                      imageUrl: "${profileUrl}",
                                      fit: BoxFit.cover,
                                    );
                                  }
                                }
                              }),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${firstname} ${lastname}",
                        style: TextStyle(
                            fontSize: 23,
                            letterSpacing: 0.5,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Container(
                      height: 205,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(103, 104, 103, 103),
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
                            )
                          ]),
                      child: Column(
                        children: [
                          builtContainer("DOB", "${dob}"),
                          Container(
                            color: Colors.grey,
                            height: 0.2,
                          ),
                          builtContainer("Gender", "${gender}"),
                          Container(
                            color: Colors.grey,
                            height: 0.2,
                          ),
                          builtContainer("Email", "${email}"),
                          Container(
                            color: Colors.grey,
                            height: 0.2,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileModel with ChangeNotifier {
  String url = "empty";
  var _pickedImage;
  void pickImageCamera(context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    _pickedImage = pickedImageFile;
    // try {
    //   var user = await FirebaseAuth.instance.currentUser;
    //   var uid = user!.uid;
    //   final ref = await FirebaseStorage.instance
    //       .ref()
    //       .child("${uid}")
    //       .child("${uid}" + ".jpg");
    //   EasyLoading.show(status: "Uploading...");
    //   await ref.putFile(_pickedImage).then((p0) => print("PO = ${p0}"));
    //   url = await ref.getDownloadURL();
    //   UserManagement().updateImage("profile", url, context);
    //   notifyListeners();
    //   print("URL = ${url}");
    // } catch (e) {
    //   print("Error = ${e}");
    // }
  }
}

Future<String> futureFunction() async {
  String url = "empty";
  // try {
  //   var user = FirebaseAuth.instance.currentUser;
  //   var userData = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user?.uid)
  //       .get();
  //   url = await userData.data()!['profile'];
  //   url = url;
  //   return url;
  // } catch (e) {
  //   url = "empty";
  //   return url;
  // }
  return url;
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.5,
      h,
      w,
      h - 70,
    );
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
