import 'package:flutter/material.dart';
import 'package:pocketid_demo/utils/reusable.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Settings", context),
    );
  }
}
