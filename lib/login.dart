import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pocketid_demo/checkPin.dart';
import 'package:pocketid_demo/home.dart';
import 'setPin.dart';
import 'dart:math' as math;
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'utils/reusable.dart';
import 'register.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool isrunning = false;

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        // width: double.infinity,
        color: Color.fromARGB(255, 55, 14, 201),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
              Column(
                children: [
                  Column(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                reusableTextField("Email", Icons.person, false,
                                    _emailTextController),
                                SizedBox(
                                  height: 15,
                                ),
                                reusableTextField(
                                    "Password",
                                    Icons.lock_rounded,
                                    true,
                                    _passwordTextController),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                    height: 35,
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[700]),
                                    )),
                                Container(
                                  width: 160,
                                  height: 43,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: ElevatedButton(
                                    child: Center(
                                        child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    )),
                                    onPressed: () async {
                                      // try {
                                      //   await FirebaseAuth.instance
                                      //       .signInWithEmailAndPassword(
                                      //           email:
                                      //               _emailTextController.text,
                                      //           password:
                                      //               _passwordTextController
                                      //                   .text)
                                      //       .then((value) {
                                      //     Navigator.pushReplacement(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder: ((context) =>
                                      //                 const CheckPin())));
                                      //   });
                                      // } on FirebaseAuthException catch (error) {
                                      //   print(error.message);
                                      //   final snackBar = SnackBar(
                                      //     content: Text(
                                      //       "${error.message},",
                                      //       style: TextStyle(
                                      //           color: Colors.black87),
                                      //     ),
                                      //     backgroundColor: Colors.white,
                                      //     behavior: SnackBarBehavior.floating,
                                      //     action: SnackBarAction(
                                      //       label: "Dismiss",
                                      //       textColor: Color.fromARGB(
                                      //           255, 55, 14, 201),
                                      //       onPressed: () {},
                                      //     ),
                                      //   );

                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(snackBar);
                                      // }
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
                                                    const Register()));
                                      },
                                      child: const Text(
                                        "SIGNUP",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 55, 14, 201),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
