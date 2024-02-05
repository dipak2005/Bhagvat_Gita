// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bhagvat_gita/controller/chapter_provider.dart';
import 'package:bhagvat_gita/view/chapter_detail.dart';
import 'package:bhagvat_gita/view/home.dart';
import 'package:bhagvat_gita/view/splash.dart';
import 'package:bhagvat_gita/view/splash1.dart';
import 'package:bhagvat_gita/view/verse_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Bhagvat_Gita());
}

class Bhagvat_Gita extends StatefulWidget {
  const Bhagvat_Gita({super.key});

  @override
  State<Bhagvat_Gita> createState() => _Bhagvat_GitaState();
}

class _Bhagvat_GitaState extends State<Bhagvat_Gita> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Chapter(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: "Bhagvat Gita",
        debugShowCheckedModeBanner: false,
        checkerboardOffscreenLayers: true,
        themeAnimationCurve: Curves.linear,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: Provider.of<Chapter>(
          context,
        ).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: "/",
        routes: {
          "/": (context) => Splash(),
          "Splash1": (context) => Splash1(),
          "Home": (context) => Home(),
          "ChapterDetail": (context) => ChapterDetail(),
          "VerseDetail": (context) => VerseDetail(),
        },
      ),
    );
  }
}
