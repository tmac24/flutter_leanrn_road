import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class repo extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'owner')
  String owner;

  @JsonKey(name: 'parent')
  String parent;

  @JsonKey(name: 'private')
  bool private;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'fork')
  bool fork;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'forks_count')
  int forksCount;

  @JsonKey(name: 'stargazers_count')
  int stargazersCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'default_branch')
  String defaultBranch;

  @JsonKey(name: 'open_issues_count')
  int openIssuesCount;

  @JsonKey(name: 'pushed_at')
  String pushedAt;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'subscribers_count')
  int subscribersCount;

  @JsonKey(name: 'license')
  License license;

  repo(
    this.id,
    this.name,
    this.fullName,
    this.owner,
    this.parent,
    this.private,
    this.description,
    this.fork,
    this.language,
    this.forksCount,
    this.stargazersCount,
    this.size,
    this.defaultBranch,
    this.openIssuesCount,
    this.pushedAt,
    this.createdAt,
    this.updatedAt,
    this.subscribersCount,
    this.license,
  );

  factory repo.fromJson(Map<String, dynamic> srcJson) =>
      _$repoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$repoToJson(this);
}

@JsonSerializable()
class License extends Object {
  @JsonKey(name: 'key')
  String key;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'spdx_id')
  String spdxId;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'node_id')
  String nodeId;

  License(
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  );

  factory License.fromJson(Map<String, dynamic> srcJson) =>
      _$LicenseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}
