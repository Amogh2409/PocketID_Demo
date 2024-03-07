import 'package:flutter/material.dart';
import 'package:pocketid_demo/menu/about.dart';
import 'package:pocketid_demo/menu/help.dart';
import 'package:pocketid_demo/menu/myprofile.dart';
import 'package:pocketid_demo/menu/settings.dart';
import 'package:pocketid_demo/utils/imageUploader.dart';
import 'package:pocketid_demo/utils/themeChanger.dart';
import 'package:pocketid_demo/utils/users.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key, required this.email, required this.username});
  final String email;
  final String username;

  @override
  State<NavDrawer> createState() => NavDrawerState();
}

class NavDrawerState extends State<NavDrawer> {
  String themeNow = "dark";
  String profile = "empty";

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    Container(
                      color: Color.fromARGB(255, 55, 14, 201),
                    ),
                    Transform.translate(
                      offset: Offset(16, 20),
                      child: CircleAvatar(
                        radius: 58,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.rotate(
                              angle: math.pi / 0.299,
                              child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            Text(
                              "PocketID",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(250, 25),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(26, 0, 0, 0),
                                  blurRadius: 2.0,
                                  spreadRadius: -2.0),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(56, 255, 255, 255)),
                        child: Consumer<ThemeProvider>(
                          builder: (context, ThemeProvider, child) {
                            return GestureDetector(
                              onTap: (() {
                                var theme = ThemeProvider.currentTheme;
                                if (theme == "system" || theme == "light") {
                                  ThemeProvider.changeTheme("dark");
                                } else {
                                  ThemeProvider.changeTheme("light");
                                }
                              }),
                              child: (ThemeProvider.currentTheme == "light")
                                  ? Icon(Icons.sunny,
                                      size: 28, color: Colors.white)
                                  : Icon(
                                      Icons.nightlight_outlined,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.person_outline_rounded,
              size: 30,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyProfile()))
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              size: 30,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()))
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()))
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_rounded,
              size: 30,
            ),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Help()))
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: 30,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {UserManagement().logOut(context)},
          ),
        ],
      ),
    );
  }
}
