// To parse this JSON data, do
//
//     final radioSquare = radioSquareFromJson(jsonString);

// JSON转模型 https://app.quicktype.io （Null Safety,Make all properties optional都要勾选）

import 'dart:convert';

RadioSquare radioSquareFromJson(String str) =>
    RadioSquare.fromJson(json.decode(str));

String radioSquareToJson(RadioSquare data) => json.encode(data.toJson());

class RadioSquare {
  int ret;
  dynamic msg;
  Data data;

  RadioSquare({
    required this.ret,
    required this.msg,
    required this.data,
  });

  factory RadioSquare.fromJson(Map<String, dynamic> json) => RadioSquare(
        ret: json["ret"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ret": ret,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  List<RadioSquareResult> radioSquareResults;
  List<Radio> localRadios;
  List<Radio> topRadios;
  List<Category> categories;
  String location;

  Data({
    required this.radioSquareResults,
    required this.localRadios,
    required this.topRadios,
    required this.categories,
    required this.location,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        radioSquareResults: List<RadioSquareResult>.from(
            json["radioSquareResults"]
                .map((x) => RadioSquareResult.fromJson(x))),
        localRadios:
            List<Radio>.from(json["localRadios"].map((x) => Radio.fromJson(x))),
        topRadios:
            List<Radio>.from(json["topRadios"].map((x) => Radio.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "radioSquareResults":
            List<dynamic>.from(radioSquareResults.map((x) => x.toJson())),
        "localRadios": List<dynamic>.from(localRadios.map((x) => x.toJson())),
        "topRadios": List<dynamic>.from(topRadios.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "location": location,
      };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Radio {
  int id;
  String name;
  String coverSmall;
  String coverLarge;
  int programScheduleId;
  int programId;
  String programName;
  int playCount;
  PlayUrl playUrl;
  int fmUid;
  int categoryId;
  int provinceCode;
  int cityCode;
  int start;
  int? end;
  dynamic favorite;
  String fm;
  bool publish;

  Radio({
    required this.id,
    required this.name,
    required this.coverSmall,
    required this.coverLarge,
    required this.programScheduleId,
    required this.programId,
    required this.programName,
    required this.playCount,
    required this.playUrl,
    required this.fmUid,
    required this.categoryId,
    required this.provinceCode,
    required this.cityCode,
    required this.start,
    this.end,
    required this.favorite,
    required this.fm,
    required this.publish,
  });

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
        id: json["id"],
        name: json["name"],
        coverSmall: json["coverSmall"],
        coverLarge: json["coverLarge"],
        programScheduleId: json["programScheduleId"] ?? 0,
        programId: json["programId"] ?? 0,
        programName: json["programName"] ?? '',
        playCount: json["playCount"],
        playUrl: PlayUrl.fromJson(json["playUrl"]),
        fmUid: json["fmUid"] ?? 0,
        categoryId: json["categoryId"],
        provinceCode: json["provinceCode"] ?? 0,
        cityCode: json["cityCode"] ?? 0,
        start: json["start"] ?? 0,
        end: json["end"],
        favorite: json["favorite"],
        fm: json["fm"],
        publish: json["publish"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coverSmall": coverSmall,
        "coverLarge": coverLarge,
        "programScheduleId": programScheduleId,
        "programId": programId,
        "programName": programName,
        "playCount": playCount,
        "playUrl": playUrl.toJson(),
        "fmUid": fmUid,
        "categoryId": categoryId,
        "provinceCode": provinceCode,
        "cityCode": cityCode,
        "start": start,
        "end": end,
        "favorite": favorite,
        "fm": fm,
        "publish": publish,
      };
}

class PlayUrl {
  String aac24;
  String ts24;
  String aac64;
  String ts64;

  PlayUrl({
    required this.aac24,
    required this.ts24,
    required this.aac64,
    required this.ts64,
  });

  factory PlayUrl.fromJson(Map<String, dynamic> json) => PlayUrl(
        aac24: json["aac24"],
        ts24: json["ts24"],
        aac64: json["aac64"],
        ts64: json["ts64"],
      );

  Map<String, dynamic> toJson() => {
        "aac24": aac24,
        "ts24": ts24,
        "aac64": aac64,
        "ts64": ts64,
      };
}

class RadioSquareResult {
  int id;
  String title;
  String uri;
  String icon;

  RadioSquareResult({
    required this.id,
    required this.title,
    required this.uri,
    required this.icon,
  });

  factory RadioSquareResult.fromJson(Map<String, dynamic> json) =>
      RadioSquareResult(
        id: json["id"],
        title: json["title"],
        uri: json["uri"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "uri": uri,
        "icon": icon,
      };
}

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String? greeting;
  List<String>? instructions;

  Welcome({
    this.greeting,
    this.instructions,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        greeting: json["greeting"],
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x)),
      };
}
