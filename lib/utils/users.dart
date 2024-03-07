import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pocketid_demo/checkPin.dart';
import 'package:pocketid_demo/getUserData.dart';
import 'package:pocketid_demo/home.dart';
import 'package:pocketid_demo/login.dart';
import 'package:pocketid_demo/setPin.dart';

class UserManagement with ChangeNotifier {
  String email = "";
  String name = "";
  int page = 0;

  logOut(context) {}

  addNewUser(user, context) async {}

  updateData(data, context) async {}

  updateUserProfileData(fname, lname, dob, gender, context) async {}

  updateImage(doc, url, context) async {}

  deleteImage(doc) async {}
}
