import 'package:flutter/material.dart';
import 'package:pocketid_demo/checkPin.dart';
import 'package:pocketid_demo/home.dart';
import 'package:pocketid_demo/setPin.dart';

String CorrectPin = "";
final snackBar = SnackBar(
  content: Text("Error"),
  backgroundColor: Colors.green,
  behavior: SnackBarBehavior.floating,
  action: SnackBarAction(
    label: "Dismiss",
    textColor: Colors.white,
    onPressed: () {},
  ),
);

class CheckPin extends StatefulWidget {
  const CheckPin({super.key});

  @override
  State<CheckPin> createState() => _CheckPinState();
}

class _CheckPinState extends State<CheckPin> {
  void checkMpinStatus() async {
    // var user = await FirebaseAuth.instance.currentUser;
    // var userData = await FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(user?.uid)
    //     .get();
    // setState(() {
    //   CorrectPin = userData.data()!['mpin'];
    // });
    // print(CorrectPin);
  }

  @override
  void initState() {
    super.initState();
    checkMpinStatus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 55, 14, 201)),
        child: OtpScreen(),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.white),
  );

  int pinIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // buildExitButton(),
          Expanded(
            child: Container(
              alignment: Alignment(0, 0.5),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildSecurityText(),
                  SizedBox(
                    height: 40,
                  ),
                  buildPinRow(),
                ],
              ),
            ),
          ),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KeyboardNumber(
                    n: 1,
                    OnPressed: () {
                      pinIndexSetup("1");
                    },
                  ),
                  KeyboardNumber(
                    n: 2,
                    OnPressed: () {
                      pinIndexSetup("2");
                    },
                  ),
                  KeyboardNumber(
                    n: 3,
                    OnPressed: () {
                      pinIndexSetup("3");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KeyboardNumber(
                    n: 4,
                    OnPressed: () {
                      pinIndexSetup("4");
                    },
                  ),
                  KeyboardNumber(
                    n: 5,
                    OnPressed: () {
                      pinIndexSetup("5");
                    },
                  ),
                  KeyboardNumber(
                    n: 6,
                    OnPressed: () {
                      pinIndexSetup("6");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KeyboardNumber(
                    n: 7,
                    OnPressed: () {
                      pinIndexSetup("7");
                    },
                  ),
                  KeyboardNumber(
                    n: 8,
                    OnPressed: () {
                      pinIndexSetup("8");
                    },
                  ),
                  KeyboardNumber(
                    n: 9,
                    OnPressed: () {
                      pinIndexSetup("9");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    child: MaterialButton(
                      onPressed: null,
                      child: SizedBox(),
                    ),
                  ),
                  KeyboardNumber(
                    n: 0,
                    OnPressed: () {
                      pinIndexSetup("0");
                    },
                  ),
                  Container(
                    width: 60,
                    child: MaterialButton(
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      onPressed: () {
                        clearPin();
                      },
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) {
      print(strPin);
      if (strPin.toString() == CorrectPin.toString()) {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (context, animation, animationtime, child) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.elasticOut);
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center,
                  );
                },
                pageBuilder: ((context, animation, animationtime) {
                  return MyHomePage();
                })));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinNumber(
          textEditingController: pinOneController,
          outlineInputBorder: outlineInputBorder,
        ),
        PinNumber(
          textEditingController: pinTwoController,
          outlineInputBorder: outlineInputBorder,
        ),
        PinNumber(
          textEditingController: pinThreeController,
          outlineInputBorder: outlineInputBorder,
        ),
        PinNumber(
          textEditingController: pinFourController,
          outlineInputBorder: outlineInputBorder,
        ),
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Enter Security PIN",
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class PinNumber extends StatelessWidget {
  const PinNumber(
      {super.key,
      required this.textEditingController,
      required this.outlineInputBorder});

  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            border: outlineInputBorder,
            filled: true,
            fillColor: Color.fromARGB(51, 255, 255, 255)),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  const KeyboardNumber({super.key, required this.n, required this.OnPressed});

  final int n;
  final Function() OnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.blueAccent.withOpacity(0.1)),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8),
        onPressed: OnPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        height: 90,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
