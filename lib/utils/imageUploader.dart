import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:pocketid_demo/utils/users.dart';

class ImageManager with ChangeNotifier {
  var url;
  var _pickedImage;
  @override
  void addImage(text, File file, context) async {
    // try {
    //   var uid = user!.uid;

    //   print("UID = ${uid}");

    //   final ref = await FirebaseStorage.instance
    //       .ref()
    //       .child("${uid}")
    //       .child("${text}" + ".jpg");
    //   EasyLoading.show(status: "Uploading...");
    //   await ref.putFile(file).then((p0) => print("PO = ${p0}"));
    //   url = await ref.getDownloadURL();
    //   await UserManagement().updateImage(text, url, context);
    //   notifyListeners();

    //   ;
    //   print("URL = ${url}");
    // } catch (e) {
    //   print("Error = ${e}");
    // }
  }

  void pickImageCamera(text, context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    _pickedImage = pickedImageFile;
    print(_pickedImage);

    addImage(text, _pickedImage, context);
  }

  void pickImageGallery(text, context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    _pickedImage = pickedImageFile;
    addImage(text, _pickedImage, context);
  }
}
