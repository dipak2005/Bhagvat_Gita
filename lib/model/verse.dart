// To parse this JSON data, do
//
//     final verse = verseFromJson(jsonString);

import 'dart:convert';

List<Verse> verseFromJson(String str) =>
    List<Verse>.from(json.decode(str).map((x) => Verse.fromJson(x)));

String verseToJson(List<Verse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Verse {
  String? verse;
  String? san;
  String? en;
  String? guj;
  String? hi;

  Verse({
    this.verse,
    this.san,
    this.en,
    this.guj,
    this.hi,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        verse: json["verse"],
        san: json["san"],
        en: json["en"],
        guj: json["guj"],
        hi: json["hi"],
      );

  Map<String, dynamic> toJson() => {
        "verse": verse,
        "san": san,
        "en": en,
        "guj": guj,
        "hi": hi,
      };
}
