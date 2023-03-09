// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xmlyradio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Xmlyradio _$XmlyradioFromJson(Map<String, dynamic> json) => Xmlyradio(
      (json['radioSquareResults'] as List<dynamic>)
          .map((e) => RadioSquareResults.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['localRadios'] as List<dynamic>)
          .map((e) => LocalRadios.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['topRadios'] as List<dynamic>)
          .map((e) => TopRadios.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['location'] as String,
    );

Map<String, dynamic> _$XmlyradioToJson(Xmlyradio instance) => <String, dynamic>{
      'radioSquareResults': instance.radioSquareResults,
      'localRadios': instance.localRadios,
      'topRadios': instance.topRadios,
      'categories': instance.categories,
      'location': instance.location,
    };

RadioSquareResults _$RadioSquareResultsFromJson(Map<String, dynamic> json) =>
    RadioSquareResults(
      json['id'] as int,
      json['title'] as String,
      json['uri'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$RadioSquareResultsToJson(RadioSquareResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'uri': instance.uri,
      'icon': instance.icon,
    };

LocalRadios _$LocalRadiosFromJson(Map<String, dynamic> json) => LocalRadios(
      json['id'] as int,
      json['name'] as String,
      json['coverSmall'] as String,
      json['coverLarge'] as String,
      json['playCount'] as int,
      PlayUrl.fromJson(json['playUrl'] as Map<String, dynamic>),
      json['fmUid'] as int,
      json['categoryId'] as int,
      json['provinceCode'] as int,
      json['cityCode'] as int,
      json['fm'] as String,
      json['publish'] as bool,
    );

Map<String, dynamic> _$LocalRadiosToJson(LocalRadios instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverSmall': instance.coverSmall,
      'coverLarge': instance.coverLarge,
      'playCount': instance.playCount,
      'playUrl': instance.playUrl,
      'fmUid': instance.fmUid,
      'categoryId': instance.categoryId,
      'provinceCode': instance.provinceCode,
      'cityCode': instance.cityCode,
      'fm': instance.fm,
      'publish': instance.publish,
    };

PlayUrl _$PlayUrlFromJson(Map<String, dynamic> json) => PlayUrl(
      json['aac24'] as String,
      json['ts24'] as String,
      json['aac64'] as String,
      json['ts64'] as String,
    );

Map<String, dynamic> _$PlayUrlToJson(PlayUrl instance) => <String, dynamic>{
      'aac24': instance.aac24,
      'ts24': instance.ts24,
      'aac64': instance.aac64,
      'ts64': instance.ts64,
    };

TopRadios _$TopRadiosFromJson(Map<String, dynamic> json) => TopRadios(
      json['id'] as int,
      json['name'] as String,
      json['coverSmall'] as String,
      json['coverLarge'] as String,
      json['programScheduleId'] as int,
      json['programId'] as int,
      json['programName'] as String,
      json['playCount'] as int,
      PlayUrl.fromJson(json['playUrl'] as Map<String, dynamic>),
      json['fmUid'] as int,
      json['categoryId'] as int,
      json['start'] as int,
      json['end'] as int,
      json['fm'] as String,
      json['publish'] as bool,
    );

Map<String, dynamic> _$TopRadiosToJson(TopRadios instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverSmall': instance.coverSmall,
      'coverLarge': instance.coverLarge,
      'programScheduleId': instance.programScheduleId,
      'programId': instance.programId,
      'programName': instance.programName,
      'playCount': instance.playCount,
      'playUrl': instance.playUrl,
      'fmUid': instance.fmUid,
      'categoryId': instance.categoryId,
      'start': instance.start,
      'end': instance.end,
      'fm': instance.fm,
      'publish': instance.publish,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
