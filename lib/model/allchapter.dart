// To parse this JSON data, do
//
//     final chapters = chaptersFromJson(jsonString);

import 'dart:convert';

import 'package:bhagvat_gita/model/verse.dart';
import 'package:flutter/animation.dart';

List<Chapters> chaptersFromJson(String str) =>
    List<Chapters>.from(json.decode(str).map((x) => Chapters.fromJson(x)));

String chaptersToJson(List<Chapters> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapters {
  int? chNumber;
  String? chSummery;
  String? chSummeryHindi;
  int? id;
  String? image;
  String? name;
  String? nameMeaning;
  String? nameTranslation;
  int? verseCount;
  List<Verse>? verse;

  Chapters({
    this.chNumber,
    this.chSummery,
    this.chSummeryHindi,
    this.id,
    this.image,
    this.name,
    this.nameMeaning,
    this.nameTranslation,
    this.verseCount,
    this.verse,
  });

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
      chNumber: json["chNumber"],
      chSummery: json["chSummery"],
      chSummeryHindi: json["chSummery_hindi"],
      id: json["id"],
      image: json["image"],
      name: json["name"],
      nameMeaning: json["nameMeaning"],
      nameTranslation: json["nameTranslation"],
      verseCount: json["verseCount"],
      verse: json["verse"] == null
          ? []
          : List<Verse>.from(json["verse"]!.map((x) => Verse.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "chNumber": chNumber,
        "chSummery": chSummery,
        "chSummery_hindi": chSummeryHindi,
        "id": id,
        "image": image,
        "name": name,
        "nameMeaning": nameMeaning,
        "nameTranslation": nameTranslation,
        "verseCount": verseCount,
        "verse": verse == null
            ? []
            : List<dynamic>.from(verse!.map((x) => x.toJson())),
      };
}
