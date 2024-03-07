import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketid_demo/DocImagePage.dart';
import 'package:pocketid_demo/menu/about.dart';
import 'package:pocketid_demo/menu/myprofile.dart';
import 'package:pocketid_demo/menu/settings.dart';
import 'package:pocketid_demo/navDrawer.dart';
import 'package:pocketid_demo/utils/imageUploader.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
// import 'menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? _timer;
  late double _progress;
  final docList = [
    "empty",
    "aadhaar",
    "pan",
    "driving",
    "vaccine",
    "birth",
    "income"
  ];
  final imageList = [
    "assets/navback.png",
    "assets/img1.jpg",
  ];
  int _selectedIndex = 0;
  String firstname = "Loading...";
  String lastname = "Loading...";
  String email = "Loading...";
  String docName = "empty";

  getData() async {
    // var user = await FirebaseAuth.instance.currentUser;
    // var userData = await FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(user?.uid)
    //     .get();
    // setState(() {
    //   firstname = userData.data()!['fname'];
    //   lastname = userData.data()!['lname'];
    //   email = userData.data()!['email'];
    // });
  }

  Future<String> getDocInfo(document_name) async {
    // try {
    //   var user = await FirebaseAuth.instance.currentUser;
    //   var userData = await FirebaseFirestore.instance
    //       .collection("users")
    //       .doc(user?.uid)
    //       .get();
    //   docName = await userData.data()!["${document_name}"];
    //   return docName;
    // } catch (e) {
    //   docName = "empty";
    //   return docName;
    // }
    return "empty";
  }

  Future<String> getProfile() async {
    // String profile = "empty";
    // try {
    //   var user = await FirebaseAuth.instance.currentUser;
    //   var userData = await FirebaseFirestore.instance
    //       .collection("users")
    //       .doc(user?.uid)
    //       .get();

    //   profile = await userData.data()!['profile'];
    //   profile = profile;
    //   return profile;
    // } catch (e) {
    //   profile = "empty";
    //   return profile;
    // }
    return "empty";
  }

  void initState() {
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    setState(() {
      getData();
    });
    super.initState();
  }

  Container HeadingContainer({text, double? size}) {
    return Container(
        // color: Colors.white,
        height: 40,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 15.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${text}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size,
                      // color: Colors.black87,
                      fontFamily: "Poppins"),
                )
              ],
            ),
            (text == "Quick Links")
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 1, color: Color.fromARGB(83, 0, 0, 0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 55, 14, 201),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  )
                : (text != "What's New?")
                    ? Text(
                        "View All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 55, 14, 201),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    : Text(""),
          ],
        ));
  }

  Container QuickLinks({text, icon, Function? ontap}) {
    return Container(
      width: 147,
      height: 50,
      child: GestureDetector(
        onTap: (() => ontap!()),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: BorderRadius.circular(50)),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Color.fromARGB(31, 158, 158, 158),
                  child: Icon(
                    icon,
                    size: 20,
                    color: Color.fromARGB(101, 0, 0, 0),
                  )),
              SizedBox(
                width: 10,
              ),
              Text(text,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container ExtractedContainer({text, image, doc, isSaved}) {
    bool showDoc = false;
    return Container(
        // color: Colors.white,
        width: 320,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 280,
              height: 170,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DocImagePage(
                                  text: text,
                                  nameofDoc: "${doc}",
                                )));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset("$image"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("$text",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      letterSpacing: 0.8,
                                      fontFamily: "Poppins-Reg",
                                    )),
                                Text(
                                  "XXXX-XXXX-XXXX",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontFamily: "Lato-Reg"),
                                ),
                              ],
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      ChangeNotifierProvider<ImageManager>(
                        create: (context) => ImageManager(),
                        builder: (context, child) {
                          return Consumer<ImageManager>(
                            builder: (context, ImageManager, child) {
                              return FutureBuilder(
                                future: getDocInfo(doc),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text(
                                      "Save Now",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    );
                                  } else {
                                    if (snapshot.data == "empty") {
                                      return Container(
                                        height: 45,
                                        width: 219,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color:
                                              Color.fromARGB(255, 55, 14, 201),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Save Now",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: 45,
                                        width: 219,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 55, 14, 201))),
                                        child: Center(
                                          child: Text(
                                            "View Now",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 55, 14, 201),
                                                fontSize: 15),
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.black;
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      }
                      return Colors.white;
                    }),
                  )),
            ),
          ],
        ));
  }

  SizedBox ExtractedBox({text, image}) {
    return SizedBox(
      height: 200,
      width: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 185,
              width: 195,
              decoration: BoxDecoration(
                // color: Colors.grey,
                // color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(130, 158, 158, 158),
                    offset: const Offset(
                      1.0,
                      2.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 23,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 55, 14, 201),
                    child: Container(
                        height: 48,
                        width: 48,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset(
                          "${image}",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.8,
                        fontFamily: "Poppins-Reg",
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        foregroundColor: Color.fromARGB(255, 55, 14, 201),
        title: Row(
          children: [
            Transform.rotate(
                angle: math.pi / 0.299,
                child: Icon(Icons.account_balance_wallet_outlined)),
            SizedBox(
              width: 8,
            ),
            Text(
              "| PocketID",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      drawer: NavDrawer(
        username: firstname,
        email: email,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Hi,",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.black
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${firstname}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 55, 14, 201),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Welocome back to PocketID",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            ChangeNotifierProvider<ProfileModel>(
                              create: (context) => ProfileModel(),
                              builder: (context, child) {
                                return CircleAvatar(
                                  radius: 23,
                                  backgroundColor:
                                      Color.fromARGB(255, 55, 14, 201),
                                  child: Consumer<ProfileModel>(
                                    builder: (context, ProfileModel, child) {
                                      return Container(
                                        height: 37,
                                        width: 37,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: FutureBuilder(
                                          future: getProfile(),
                                          builder: ((context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else {
                                              if (snapshot.data == "empty") {
                                                return Container();
                                              } else {
                                                return Image.network(
                                                  "${snapshot.data}",
                                                  fit: BoxFit.cover,
                                                );
                                              }
                                            }
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                HeadingContainer(text: "What's New?", size: 15.0),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2.0,
                              blurRadius: 3.0,
                              color: Color.fromARGB(182, 158, 158, 158))
                        ]),
                    height: 200,
                    child: ListView(
                      children: [
                        CarouselSlider(
                            items: [
                              Container(
                                height: 250,
                                child: Image.asset(
                                  imageList[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                  imageList[1],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 200,
                              autoPlayCurve: Curves.elasticOut,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1800),
                              viewportFraction: 1,
                            ))
                      ],
                    ),
                  ),
                ),
                HeadingContainer(text: "Issued Documents", size: 15.0),
                Container(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ExtractedContainer(
                          text: "Aadhaar Card",
                          image: "assets/aadhaar.png",
                          doc: "aadhaar",
                          isSaved: 1),
                      ExtractedContainer(
                          text: "PAN Card",
                          image: "assets/pan.png",
                          doc: "pan",
                          isSaved: 2),
                      ExtractedContainer(
                          text: "Driving License",
                          image: "assets/others.png",
                          doc: "driving",
                          isSaved: 3),
                      ExtractedContainer(
                          text: "Covid Vaccine",
                          image: "assets/others.png",
                          doc: "vaccine",
                          isSaved: 4)
                    ],
                  ),
                ),
                HeadingContainer(text: "Other Documents", size: 15.0),
                Container(
                    // color: Colors.white,
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        ExtractedBox(
                            text: "Vehicle Registraion",
                            image: "assets/vregistration.jpg"),
                        ExtractedBox(
                            text: "Birth Ceritificate",
                            image: "assets/birthcertificate.png"),
                        ExtractedBox(
                            text: "Income Certificate",
                            image: "assets/income-certificate.jpg")
                      ],
                    )),
                HeadingContainer(text: "Quick Links", size: 18.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        QuickLinks(
                            text: "My Profile",
                            icon: Icons.person_add_alt_1_outlined,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyProfile()));
                            }),
                        SizedBox(
                          width: 25,
                        ),
                        QuickLinks(
                            text: "Forgit PIN",
                            icon: Icons.help_outline_rounded,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingsPage()));
                            }),
                        SizedBox(
                          width: 25,
                        ),
                        QuickLinks(
                            text: "About",
                            icon: Icons.info_outline_rounded,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const About()));
                            }),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DocContainer extends StatelessWidget {
  const DocContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            // Setting floatHeaderSlivers to true is required in order to float
            // the outer slivers over the inner scrollable.
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[];
            },
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Center(child: Text('Item $index')),
                  );
                })));
  }
}
