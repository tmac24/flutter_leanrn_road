import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends Object {
  @JsonKey(name: 'user')
  String user;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'theme')
  int theme;

  @JsonKey(name: 'cache')
  String cache;

  @JsonKey(name: 'lastLogin')
  String lastLogin;

  @JsonKey(name: 'locale')
  String locale;

  Profile(
    this.user,
    this.token,
    this.theme,
    this.cache,
    this.lastLogin,
    this.locale,
  );

  factory Profile.fromJson(Map<String, dynamic> srcJson) =>
      _$ProfileFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
