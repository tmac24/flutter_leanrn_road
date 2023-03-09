import 'package:json_annotation/json_annotation.dart';

part 'useman.g.dart';

@JsonSerializable()
class useman extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  useman(
    this.name,
    this.email,
  );

  factory useman.fromJson(Map<String, dynamic> srcJson) =>
      _$usemanFromJson(srcJson);
}
