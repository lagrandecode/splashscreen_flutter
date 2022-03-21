import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/home.dart';
import 'package:splashscreen/home_ios.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showPlatform = true;

  //initialising the state of the app. the time for splash screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      showPlatform == Platform.isIOS? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomeIOS())) : Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.png", height: 130,),
            const SizedBox(height: 30,),
            showPlatform == Platform.isIOS ? const CupertinoActivityIndicator(
              radius: 15,
            ) : const CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
