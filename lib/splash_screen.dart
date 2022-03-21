


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showPlatform = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.png", height: 130,),
            SizedBox(height: 30,),
            showPlatform == Platform.isIOS ? CupertinoActivityIndicator(
              radius: 15,
            ) : CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),

    );
  }
}
