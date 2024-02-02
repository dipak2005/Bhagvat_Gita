// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bhagvat_gita/controller/chapter_provider.dart';
import 'package:bhagvat_gita/model/allchapter.dart';
import 'package:bhagvat_gita/model/verse.dart';
import 'package:bhagvat_gita/view/verse_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterDetail extends StatefulWidget {
  Chapters? chapters;
  List<Verse>? verse;
  int? index;
  int? cindex;

  ChapterDetail({super.key, this.verse, this.chapters, this.index,this.cindex});

  @override
  State<ChapterDetail> createState() => _ChapterDetailState();
}
String? versecount;
class _ChapterDetailState extends State<ChapterDetail> {
  List<String> item = [
    "English",
    "Gujarati",
    "Sanskrit",
    "Hindi",
  ];

  @override
  void initState() {
    // Provider.of<Chapter>(context, listen: false)
    //     .getSlcOk("${widget.chapters?.verse}");
    if (widget.verse == null) {
      print("0000000000000000");
    } else {
      print(widget.verse);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Chapters? argument =
    //     ModalRoute.of(context)?.settings.arguments as Chapters?;
    // widget.chapters = argument;

    super.didChangeDependencies();

    // Provider.of<SlOck>(context,listen: false).getsLcOk(widget.chapters.jsonPath)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Chapter ${widget.chapters?.id}",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              (Provider.of<Chapter>(context, listen: true).value == 0)
                  ? "${widget.chapters?.nameTranslation}"
                  : (Provider.of<Chapter>(context, listen: false).value == 1)
                      ? "${widget.chapters?.nameMeaning}"
                      : "${widget.chapters?.name}",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          Consumer<Chapter>(
            builder: (context, show, child) {
              return Container(
                height: (show.more == true)
                    ? MediaQuery.sizeOf(context).height / 1.8
                    : MediaQuery.sizeOf(context).height / 4.5,
                width: MediaQuery.sizeOf(context).width / 1.3,
                child: Column(
                  children: [
                    Text(
                      maxLines: (show.more == true) ? null : 5,
                      overflow:
                          (show.more == true) ? null : TextOverflow.ellipsis,
                      (show.value == 0)
                          ? "${widget.chapters?.chSummery}"
                          : "${widget.chapters?.chSummeryHindi}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1.1, 0),
                      child: Consumer<Chapter>(
                        builder: (context, show, child) {
                          return TextButton(
                              onPressed: () {
                                show.readMore();
                              },
                              child: show.more == false
                                  ? Text(
                                      "Read More >",
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  : Text(
                                      "Read Less >",
                                      style: TextStyle(color: Colors.orange),
                                    ));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Consumer<Chapter>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height / 18,
                child: ListView.builder(
                  clipBehavior: Clip.antiAlias,
                  itemCount: item.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var it = item[index];
                    return InkWell(
                      onTap: () {
                        value.toGGelIndex(index);
                      },

                      child: Container(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width / 5,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: value.value == index
                                ? Colors.orange
                                : Colors.white,
                            border: Border.all(
                                color: value.value == index
                                    ? Colors.transparent
                                    : Colors.black.withOpacity(0.3),
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          it,
                          style: TextStyle(
                              color: value.value == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        )),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Expanded(
            child: Consumer<Chapter>(
              builder: (context, show, child) {
                return ListView.builder(
                  itemCount: widget.verse?.length,
                  itemBuilder: (context, index) {
                    var sh = widget.verse?[index];

                    String stitle = "Verse";
                    if (show.value == 1) {
                      stitle = "શ્લોક";
                    } else if (show.value == 2) {
                      stitle = "श्लोकः";
                    } else if (show.value == 3) {
                      stitle = "श्लोक";
                    }

                   versecount=  sh?.verse;
                    return widget.verse!.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                              backgroundColor: Colors.white60,
                            ),
                          )
                        : Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  show.recentAdd(sh!);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return VerseDetail(
                                        verse: sh,
                                        index: show.value,
                                        cindex: show.chapterIndex,
                                      );
                                    },
                                  ));
                                },
                                title: Text(
                                  "$stitle ${sh?.verse}",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text(
                                  (show.value == 0)
                                      ? "${sh?.en}"
                                      : (show.value == 1)
                                          ? "${sh?.guj}"
                                          : (show.value == 2)
                                              ? "${sh?.san}"
                                              : "${sh?.hi}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 17),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      show.recentAdd(sh!);
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return VerseDetail(
                                            verse: sh,
                                            index: show.value,
                                          );
                                        },
                                      ));
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.orange,
                                    )),
                              ),
                              Divider(
                                color: Colors.orange,
                                thickness: 1,
                              )
                            ],
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
