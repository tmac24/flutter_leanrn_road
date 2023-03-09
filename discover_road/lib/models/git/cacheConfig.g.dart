// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cacheConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

cacheConfig _$cacheConfigFromJson(Map<String, dynamic> json) => cacheConfig(
      json['enable'] as bool,
      json['maxAge'] as int,
      json['maxCount'] as int,
    );

Map<String, dynamic> _$cacheConfigToJson(cacheConfig instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'maxAge': instance.maxAge,
      'maxCount': instance.maxCount,
    };
