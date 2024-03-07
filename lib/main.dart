import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:pocketid_demo/checkPin.dart';
import 'package:pocketid_demo/register.dart';
import 'package:pocketid_demo/utils/themeChanger.dart';
import 'package:provider/provider.dart';
import 'login.dart';

// COLOR THEME
//Colorsdarkest - Color.fromARGB(255, 34, 45, 50)
//Colorsdark -  Color.fromARGB(255, 55, 71, 79)
//Colorsblue -  Color.fromARGB(255, 55, 14, 201)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: "PocketID",
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: ThemeData.dark(),
          darkTheme: ThemeData.light(),
          home: const SplashScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: const Duration(seconds: 3),
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
                return const Register();
              })));
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 55, 14, 201),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 80,
              ),
              Text(
                "PocketID",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromARGB(82, 158, 158, 158),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 6,
                ),
              )
            ],
          ),
        ));
  }
}
