import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pocketid_demo/setPin.dart';
import 'package:pocketid_demo/utils/reusable.dart';
import 'package:pocketid_demo/utils/users.dart';

class GetUserData extends StatefulWidget {
  const GetUserData({super.key});

  @override
  State<GetUserData> createState() => _GetUserDataState();
}

class _GetUserDataState extends State<GetUserData> {
  TextEditingController _fnameTextController = TextEditingController();
  TextEditingController _lnameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          children: [
            reusableTextField(
                "First Name", Icons.person, false, _fnameTextController),
            reusableTextField(
                "Last Name", Icons.person, false, _lnameTextController),
            GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => GetDob(
                              fname: _fnameTextController.text,
                              lname: _lnameTextController.text))));
                }),
                child: Text("Next"))
          ],
        )),
      ),
    );
  }
}

class GetDob extends StatelessWidget {
  const GetDob({super.key, required this.fname, required this.lname});
  final String fname;
  final String lname;

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateTextController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          children: [
            reusableTextField("DOB", Icons.person, false, _dateTextController),
            GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => GetGender(
                                fname: fname,
                                lname: lname,
                                date: _dateTextController.text,
                              ))));
                }),
                child: Text("Next"))
          ],
        )),
      ),
    );
  }
}

class GetGender extends StatelessWidget {
  const GetGender(
      {super.key,
      required this.fname,
      required this.lname,
      required this.date});
  final String fname;
  final String lname;
  final String date;

  @override
  Widget build(BuildContext context) {
    TextEditingController _genderTextController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          children: [
            reusableTextField(
                "Gender", Icons.person, false, _genderTextController),
            GestureDetector(
                onTap: (() {
                  UserManagement().updateUserProfileData(
                      fname, lname, date, _genderTextController.text, context);
                }),
                child: Text("Next"))
          ],
        )),
      ),
    );
  }
}
