import 'package:json_annotation/json_annotation.dart';

part 'xmlyradio.g.dart';

@JsonSerializable()
class xmlyradio extends Object {
  @JsonKey(name: 'radioSquareResults')
  List<RadioSquareResults> radioSquareResults;

  @JsonKey(name: 'localRadios')
  List<LocalRadios> localRadios;

  @JsonKey(name: 'topRadios')
  List<TopRadios> topRadios;

  @JsonKey(name: 'categories')
  List<Categories> categories;

  @JsonKey(name: 'location')
  String location;

  xmlyradio(
    this.radioSquareResults,
    this.localRadios,
    this.topRadios,
    this.categories,
    this.location,
  );

  factory xmlyradio.fromJson(Map<String, dynamic> srcJson) =>
      _$xmlyradioFromJson(srcJson);

  Map<String, dynamic> toJson() => _$xmlyradioToJson(this);
}

@JsonSerializable()
class RadioSquareResults extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'uri')
  String uri;

  @JsonKey(name: 'icon')
  String icon;

  RadioSquareResults(
    this.id,
    this.title,
    this.uri,
    this.icon,
  );

  factory RadioSquareResults.fromJson(Map<String, dynamic> srcJson) =>
      _$RadioSquareResultsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RadioSquareResultsToJson(this);
}

@JsonSerializable()
class LocalRadios extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'coverSmall')
  String coverSmall;

  @JsonKey(name: 'coverLarge')
  String coverLarge;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'playUrl')
  PlayUrl playUrl;

  @JsonKey(name: 'fmUid')
  int fmUid;

  @JsonKey(name: 'categoryId')
  int categoryId;

  @JsonKey(name: 'provinceCode')
  int provinceCode;

  @JsonKey(name: 'cityCode')
  int cityCode;

  @JsonKey(name: 'fm')
  String fm;

  @JsonKey(name: 'publish')
  bool publish;

  LocalRadios(
    this.id,
    this.name,
    this.coverSmall,
    this.coverLarge,
    this.playCount,
    this.playUrl,
    this.fmUid,
    this.categoryId,
    this.provinceCode,
    this.cityCode,
    this.fm,
    this.publish,
  );

  factory LocalRadios.fromJson(Map<String, dynamic> srcJson) =>
      _$LocalRadiosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocalRadiosToJson(this);
}

@JsonSerializable()
class PlayUrl extends Object {
  @JsonKey(name: 'aac24')
  String aac24;

  @JsonKey(name: 'ts24')
  String ts24;

  @JsonKey(name: 'aac64')
  String aac64;

  @JsonKey(name: 'ts64')
  String ts64;

  PlayUrl(
    this.aac24,
    this.ts24,
    this.aac64,
    this.ts64,
  );

  factory PlayUrl.fromJson(Map<String, dynamic> srcJson) =>
      _$PlayUrlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlayUrlToJson(this);
}

@JsonSerializable()
class TopRadios extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'coverSmall')
  String coverSmall;

  @JsonKey(name: 'coverLarge')
  String coverLarge;

  @JsonKey(name: 'programScheduleId')
  int programScheduleId;

  @JsonKey(name: 'programId')
  int programId;

  @JsonKey(name: 'programName')
  String programName;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'playUrl')
  PlayUrl playUrl;

  @JsonKey(name: 'fmUid')
  int fmUid;

  @JsonKey(name: 'categoryId')
  int categoryId;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'end')
  int end;

  @JsonKey(name: 'fm')
  String fm;

  @JsonKey(name: 'publish')
  bool publish;

  TopRadios(
    this.id,
    this.name,
    this.coverSmall,
    this.coverLarge,
    this.programScheduleId,
    this.programId,
    this.programName,
    this.playCount,
    this.playUrl,
    this.fmUid,
    this.categoryId,
    this.start,
    this.end,
    this.fm,
    this.publish,
  );

  factory TopRadios.fromJson(Map<String, dynamic> srcJson) =>
      _$TopRadiosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopRadiosToJson(this);
}

@JsonSerializable()
class Categories extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  Categories(
    this.id,
    this.name,
  );

  factory Categories.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
