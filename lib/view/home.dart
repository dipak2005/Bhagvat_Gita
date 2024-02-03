// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:convert';
import 'dart:math';

import 'package:bhagvat_gita/controller/chapter_provider.dart';
import 'package:bhagvat_gita/view/chapter_detail.dart';
import 'package:bhagvat_gita/view/verse_detail.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/allchapter.dart';
import '../model/verse.dart';

class Home extends StatefulWidget {
  final Chapters? chapter;
  final List<Verse>? verse;
  final int? index;

  const Home({super.key, this.title, this.chapter, this.index, this.verse});

  final String? title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    //   // // ApiHelper().getApiEnd("chapters").then((value) {
    //   //   try {
    //   //     acList = chaptersFromJson(value);
    //   //     setState(() {});
    //   //   } catch (e, s) {
    //   //     print(e);
    //   //     print(s);
    //   //   }
    //   // });
    var gp = Provider.of<Chapter>(context, listen: false);
    gp.getValue();
    // .then((value) {
    // gp.acList = chaptersFromJson(value);
    // setState(() {});
    //  });

    super.initState();
  }

  @override
  // void didChangeDependencies() {
  //   var gp = Provider.of<Chapter>(context, listen: false);
  //   gp.getValue();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // var verse= Random().nextInt(Provider.of<Chapter>(context).vList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagvat Gita", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        actions: [
          Consumer<Chapter>(
              builder: (context, value, child) => IconButton(
                  onPressed: () {
                    value.changeTheme();
                  },
                  icon: Icon(value.isDark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined))),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).width / 1,
            margin: EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white60,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange,
                  offset: Offset(0.9, 0.9),
                )
              ],
            ),
            child: Stack(
              children: [
                Center(
                    child: Image.asset(
                  "assets/geeta.jpg",
                  fit: BoxFit.cover,
                )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "VERSE OF THE DAY",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                // Text("$verse",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
            child: Consumer<Chapter>(
              builder: (BuildContext context, value, Widget? child) {
                return (value.recentList.isNotEmpty)
                    ? ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          var vm = value.acList[index].chNumber;
                          // var vr = value.recentList[index];

                          var vr = value.recentList.last;
                          return Container(
                            margin: EdgeInsets.all(15),
                            width: MediaQuery.sizeOf(context).width / 3,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Last Read",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.3,
                                    ),
                                    Text(
                                      "Verse ${value.acList[index].chNumber}.${value.acList[index].verse?[index].verse ?? 0}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.02),
                                Text(
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    (value.value == 0)
                                        ? "${value.recentList.last.en}"
                                        : (value.value == 1
                                            ? "${value.recentList.last.guj}"
                                            : (value.value == 2)
                                                ? "${value.recentList.last.san}"
                                                : "${value.recentList.last.hi}")),
                                Align(
                                  alignment: Alignment(-0.9, 0),
                                  child: TextButton(
                                      onPressed: () {
                                        var verseindex = int.tryParse(value
                                                .acList[index]
                                                .verse?[index]
                                                .verse ??
                                            "");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VerseDetail(
                                                verse: vr,
                                                cindex: value
                                                    .acList[index].chNumber,
                                                index: verseindex,
                                              ),
                                            ));
                                      },
                                      child: Text(
                                        "CONTINUE READING",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          "Not Readed Recently...",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      );
              },
            ),
          ),
          Align(
            alignment: Alignment(-0.7, 0),
            child: Text(
              "Chapters",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          Consumer<Chapter>(
            builder: (BuildContext context, chapter, Widget? child) {
              if (chapter.acList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: chapter.acList.length,
                  itemBuilder: (context, index) {
                    var ch = chapter.acList[index];
                    // var vs = chapter.vList[index];
                    return ListTile(
                      onTap: () {
                        Provider.of<Chapter>(context, listen: false)
                            .chapterIndex = index;
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChapterDetail(
                              index: index,
                              chapters: ch,
                              verse: ch.verse,
                            );
                          },
                        ));
                      },
                      leading: CircleAvatar(
                        child: Text(
                          "${ch.id}",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w900),
                        ),
                        backgroundColor: Colors.orangeAccent,
                      ),
                      title: Text(
                        "${ch.name}",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.orange),
                      ),
                      subtitle: Text(
                        "${ch.verseCount} verse",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<Chapter>(context, listen: false)
                              .chapterIndex = index;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ChapterDetail(
                                index: index,
                                chapters: ch,
                                verse: ch.verse,
                              );
                            },
                          ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.orange,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
