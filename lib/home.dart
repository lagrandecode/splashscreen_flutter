import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'next.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

// Use TickerProviderStateMixin if you have multiple AnimationControllers
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      })
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animController.stop();
      }
    });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Image.asset(
            'assets/images/splash.png', height: 130,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
