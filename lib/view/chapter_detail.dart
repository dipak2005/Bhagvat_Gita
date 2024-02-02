// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bhagvat_gita/controller/chapter_provider.dart';
import 'package:bhagvat_gita/model/allchapter.dart';
import 'package:bhagvat_gita/model/verse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterDetail extends StatefulWidget {
  Chapters? chapters;
  List<Verse>? verse;
  int? index;

  ChapterDetail({super.key, this.verse, this.chapters, this.index});

  @override
  State<ChapterDetail> createState() => _ChapterDetailState();
}

class _ChapterDetailState extends State<ChapterDetail> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                (Provider.of<Chapter>(context, listen: true).value == 1)
                    ? "${widget.chapters?.nameTranslation}"
                    : (Provider.of<Chapter>(context, listen: false).value == 2)
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
                        (show.value == 1)
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
            CupertinoSegmentedControl(
                // thumbColor: Colors.orange,
                // backgroundColor: Colors.orange,
                borderColor: Colors.orange,
                pressedColor: Colors.orange,
                children: {
                  1: Text(
                    " English ",
                  ),
                  2: Text(" Gujarati "),
                  3: Text(" Hindi "),
                  4: Text(" Sanskrit "),
                },
                onValueChanged: (value) {
                  Provider.of<Chapter>(context, listen: false)
                      .toGGelIndex(value);
                }),
            Consumer<Chapter>(
              builder: (context, show, child) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height / 0.9,
                  child: ListView.builder(
                    itemCount: widget.verse?.length,
                    itemBuilder: (context, index) {
                      var sh = widget.verse?[index];
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
                                     Navigator.pushNamed(context, "VerseDetail",arguments: sh);
                                   },
                                  title: Text(
                                    "verse ${sh?.verse}",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                    (show.value == 1)
                                        ? "${sh?.en}"
                                        : (show.value == 2)
                                            ? "${sh?.guj}"
                                            : (show.value == 3)
                                                ? "${sh?.hi}"
                                                : "${sh?.san}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
