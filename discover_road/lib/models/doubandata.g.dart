// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubandata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doubandata _$DoubandataFromJson(Map<String, dynamic> json) => Doubandata()
  ..count = json['count'] as num
  ..start = json['start'] as num
  ..total = json['total'] as num
  ..verify_users = json['verify_users'] as List<dynamic>;

Map<String, dynamic> _$DoubandataToJson(Doubandata instance) =>
    <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'total': instance.total,
      'verify_users': instance.verify_users,
    };
