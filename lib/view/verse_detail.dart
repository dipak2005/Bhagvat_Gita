// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bhagvat_gita/model/verse.dart';
import 'package:flutter/material.dart';

class VerseDetail extends StatefulWidget {
  final Verse? verse;
  final int? index;

  const VerseDetail({super.key, this.verse, this.index});

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
      appBar: AppBar(),
      body: Column(
        children: [
          Text((widget.index == 0)
              ? "${widget.verse?.en}"
              : (widget.index == 1)
                  ? "${widget.verse?.guj}"
                  : (widget.index == 2)
                      ? "${widget.verse?.san}"
                      : "${widget.verse?.hi}"),
        ],
      ),
    );
  }
}
