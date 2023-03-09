import 'package:json_annotation/json_annotation.dart';

part 'cacheConfig.g.dart';

@JsonSerializable()
class cacheConfig extends Object {
  @JsonKey(name: 'enable')
  bool enable;

  @JsonKey(name: 'maxAge')
  int maxAge;

  @JsonKey(name: 'maxCount')
  int maxCount;

  cacheConfig(
    this.enable,
    this.maxAge,
    this.maxCount,
  );

  factory cacheConfig.fromJson(Map<String, dynamic> srcJson) =>
      _$cacheConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$cacheConfigToJson(this);
}
