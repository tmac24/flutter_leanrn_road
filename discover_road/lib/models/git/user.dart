import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class user extends Object {
  @JsonKey(name: 'login')
  String login;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'company')
  String company;

  @JsonKey(name: 'blog')
  String blog;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'hireable')
  bool hireable;

  @JsonKey(name: 'bio')
  String bio;

  @JsonKey(name: 'public_repos')
  int publicRepos;

  @JsonKey(name: 'followers')
  int followers;

  @JsonKey(name: 'following')
  int following;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'total_private_repos')
  int totalPrivateRepos;

  @JsonKey(name: 'owned_private_repos')
  int ownedPrivateRepos;

  user(
    this.login,
    this.avatarUrl,
    this.type,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.publicRepos,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
  );

  factory user.fromJson(Map<String, dynamic> srcJson) =>
      _$userFromJson(srcJson);

  Map<String, dynamic> toJson() => _$userToJson(this);
}
