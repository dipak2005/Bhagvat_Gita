import 'dart:convert';

import 'package:bhagvat_gita/model/apihelper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/allchapter.dart';
import '../model/verse.dart';

class Chapter extends ChangeNotifier {
  int chapterIndex = 0;
  List<Chapters> acList = [];
  List<Verse> vList = [];
  bool more = false;
  List<Verse> recentList = [];
  int value = 0;

  void changeIndex(int index) {
    chapterIndex = index;
    notifyListeners();
  }

  Future<void> getValue() async {
    // var data = await ApiHelper().getApiEnd("chapters");
    // acList = chaptersFromJson("chapters");
    // return data.;
    // notifyListeners();
    // ApiHelper().getApiEnd("chapters").then((value) {
    //   acList = chaptersFromJson(value);
    //   try {
    //     notifyListeners();
    //   } catch (e, s) {
    //     print(e);
    //     print(s);
    //   }
    // });
    var fileData =
        await rootBundle.loadString("lib/model/jsonutil/all_chapter.json");
    jsonDecode(fileData);
    acList = chaptersFromJson(fileData);
    notifyListeners();
  }

  // Future<void> getSlcOk(String url) async {
  //    var slOck =
  //        await rootBundle.loadString(url);
  //        jsonDecode(slOck);
  //      vList=  verseFromJson(slOck);
  //      notifyListeners();
  //
  //  }

  void recentAdd(Verse verse) {
    recentList.add(verse);
    notifyListeners();
  }

  void toGGelIndex(int? value) {
    this.value = value!;
    notifyListeners();
  }

  void readMore() {
    more = !more;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
