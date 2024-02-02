// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(child: Image.asset("assets/cloud.png")),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/student.png")),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Text("Bhagavat Gita - Simplified",
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Text(
            "Read the Gita anytime where ever you wish",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.01,
                width: MediaQuery.sizeOf(context).width * 0.05,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.cyan.shade100,
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.cyan.shade100,
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.cyan.shade100,
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Home");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    CupertinoIcons.arrow_right_circle_fill,
                    color: Colors.blue,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
