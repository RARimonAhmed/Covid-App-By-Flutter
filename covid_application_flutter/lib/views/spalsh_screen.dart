import 'dart:async';

import 'package:covid_application_flutter/views/wolrd_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this)
    ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), (() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => const WorldStatesScreen()),
        ),
      );
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animationController,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * .80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 2,
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  child: const Center(
                    child: Image(
                      image: AssetImage('images/virus_rem.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: animationController.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid - 19\nTracker Application',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            // Image(
            //   image: AssetImage('images/virus.jpg'),
            // ),
          ],
        ),
      ),
    );
  }
}
