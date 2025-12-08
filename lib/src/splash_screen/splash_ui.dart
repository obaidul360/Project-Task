import 'package:flutter/material.dart';

import '../task_one/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashFounction() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      splashFounction();
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginUiScreen(),
      ), //TapBarViewPage()), //LoginPage()),
    );
  }

  @override
  void initState() {
    splashFounction();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/scale_up_logo.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
