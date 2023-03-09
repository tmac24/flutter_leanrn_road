import 'package:json_annotation/json_annotation.dart';

part 'useman.g.dart';

@JsonSerializable()
class Useman extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  Useman(
    this.name,
    this.email,
  );

  factory Useman.fromJson(Map<String, dynamic> srcJson) =>
      _$UsemanFromJson(srcJson);
}
