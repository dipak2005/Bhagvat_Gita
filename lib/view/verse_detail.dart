// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bhagvat_gita/controller/chapter_provider.dart';
import 'package:bhagvat_gita/model/verse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseDetail extends StatefulWidget {
  final Verse? verse;
  final int? index;
  final int? cindex;

  const VerseDetail({super.key, this.verse, this.index, this.cindex});

  @override
  State<VerseDetail> createState() => _VerseDetailState();
}

class _VerseDetailState extends State<VerseDetail> {
  @override
  void initState() {
    if (widget.verse == null) {
      print("null");
    } else {
      print("${widget.verse}");
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        title: Text(
            "Chapter ${Provider.of<Chapter>(context, listen: false).acList[widget.cindex ?? 0].chNumber}.${widget.verse?.verse}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                (widget.index == 0)
                    ? "${widget.verse?.en}"
                    : (widget.index == 1)
                        ? "${widget.verse?.guj}"
                        : (widget.index == 2)
                            ? "${widget.verse?.san}"
                            : "${widget.verse?.hi}",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              "TRANSLATION",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "ENGLISH:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${widget.verse?.en}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Text(
              "GUJARATI:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${widget.verse?.guj}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Text(
              "HINDI :",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${widget.verse?.hi}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Text(
              "SANSKRIT :",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${widget.verse?.san}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
