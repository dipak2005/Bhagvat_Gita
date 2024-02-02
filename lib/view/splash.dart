// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "Splash1");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            width: MediaQuery.sizeOf(context).width / 1,
            child: Center(
              child: Image.asset("assets/geeta.png"),
            ),
          ),
          Text(
            "BHAGAVAT GITA",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Text(
            "Gujarati & Sanskrit",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            "Hindi & English",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
