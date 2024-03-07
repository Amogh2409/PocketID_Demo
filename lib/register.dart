import 'package:flutter/material.dart';
import 'package:pocketid_demo/checkPin.dart';
import 'dart:math' as math;
import 'package:pocketid_demo/login.dart';
import 'package:pocketid_demo/utils/reusable.dart';
import 'package:pocketid_demo/utils/users.dart';
import 'package:pocketid_demo/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void checkLogin() async {
    // var user = await FirebaseAuth.instance.currentUser;
    // if (user?.email != null) {
    //   print(user?.email);
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const CheckPin()));
    // }
  }

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 55, 14, 201),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Transform.rotate(
                angle: math.pi / 0.2999,
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.white,
                  size: 90,
                ),
              ),
              Text(
                "PocketID",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Container(
                          height: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 40,
                              ),
                              reusableTextField("Email", Icons.person, false,
                                  _emailTextController),
                              const SizedBox(
                                height: 15,
                              ),
                              reusableTextField("Password", Icons.lock, true,
                                  _passwordTextController),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                  height: 35,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey[700]),
                                  )),
                              Container(
                                width: 160,
                                height: 43,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 55, 14, 201),
                                    borderRadius: BorderRadius.circular(50)),
                                child: ElevatedButton(
                                  child: Center(
                                      child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  )),
                                  onPressed: () async {
                                    // try {
                                    //   await FirebaseAuth.instance
                                    //       .createUserWithEmailAndPassword(
                                    //           email: _emailTextController.text,
                                    //           password:
                                    //               _passwordTextController.text)
                                    //       .then((signedInUser) {
                                    //     UserManagement().addNewUser(
                                    //         signedInUser.user, context);
                                    //   });
                                    // } on FirebaseAuthException catch (error) {
                                    //   final snackBar = SnackBar(
                                    //     content: Text(
                                    //       "${error.message},",
                                    //       style:
                                    //           TextStyle(color: Colors.black87),
                                    //     ),
                                    //     backgroundColor: Colors.white,
                                    //     behavior: SnackBarBehavior.floating,
                                    //     action: SnackBarAction(
                                    //       label: "Dismiss",
                                    //       textColor:
                                    //           Color.fromARGB(255, 55, 14, 201),
                                    //       onPressed: () {},
                                    //     ),
                                    //   );
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(snackBar);
                                    // }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(),
                                        ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 55, 14, 201),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    },
                                    child: const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 55, 14, 201),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
