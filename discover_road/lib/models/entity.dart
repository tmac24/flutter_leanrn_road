import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@JsonSerializable()
class Entity extends Object {
  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'verify_users')
  List<Verify_users> verifyUsers;

  Entity(
    this.count,
    this.start,
    this.total,
    this.verifyUsers,
  );

  factory Entity.fromJson(Map<String, dynamic> srcJson) =>
      _$EntityFromJson(srcJson);
}

@JsonSerializable()
class Verify_users extends Object {
  @JsonKey(name: 'verify_roles')
  List<String> verifyRoles;

  @JsonKey(name: 'articles')
  List<dynamic> articles;

  @JsonKey(name: 'article_count')
  int articleCount;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'questions')
  List<dynamic> questions;

  @JsonKey(name: 'question_count')
  int questionCount;

  Verify_users(
    this.verifyRoles,
    this.articles,
    this.articleCount,
    this.user,
    this.questions,
    this.questionCount,
  );

  factory Verify_users.fromJson(Map<String, dynamic> srcJson) =>
      _$Verify_usersFromJson(srcJson);
}

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'reg_time')
  String regTime;

  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'verify_type')
  int verifyType;

  @JsonKey(name: 'abstract')
  String abstract;

  @JsonKey(name: 'uri')
  String uri;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'avatar_side_icon')
  String avatarSideIcon;

  @JsonKey(name: 'medal_groups')
  List<dynamic> medalGroups;

  @JsonKey(name: 'remark')
  String remark;

  @JsonKey(name: 'avatar_side_icon_id')
  String avatarSideIconId;

  @JsonKey(name: 'in_blacklist')
  bool inBlacklist;

  @JsonKey(name: 'followers_count')
  int followersCount;

  @JsonKey(name: 'is_club')
  bool isClub;

  @JsonKey(name: 'is_banned')
  bool isBanned;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'avatar')
  String avatar;

  User(
    this.regTime,
    this.followed,
    this.uid,
    this.name,
    this.url,
    this.verifyType,
    this.abstract,
    this.uri,
    this.id,
    this.avatarSideIcon,
    this.medalGroups,
    this.remark,
    this.avatarSideIconId,
    this.inBlacklist,
    this.followersCount,
    this.isClub,
    this.isBanned,
    this.type,
    this.kind,
    this.avatar,
  );

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);
}
