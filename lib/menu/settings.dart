import 'package:flutter/material.dart';
import 'package:pocketid_demo/utils/reusable.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Container settingsContainer(IconData icon, title, Color color, Color color2) {
    return Container(
      height: 75,
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
                color: color2, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 19),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 55, 14, 201),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("General app and account settings"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            settingsContainer(Icons.lock_outline, "Change PIN", Colors.green,
                Color.fromARGB(40, 76, 175, 79)),
            settingsContainer(Icons.password, "Change Password", Colors.orange,
                Color.fromARGB(66, 255, 153, 0))
          ],
        ),
      ),
    );
  }
}
