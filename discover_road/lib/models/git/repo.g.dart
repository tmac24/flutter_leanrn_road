// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

repo _$repoFromJson(Map<String, dynamic> json) => repo(
      json['id'] as int,
      json['name'] as String,
      json['full_name'] as String,
      json['owner'] as String,
      json['parent'] as String,
      json['private'] as bool,
      json['description'] as String,
      json['fork'] as bool,
      json['language'] as String,
      json['forks_count'] as int,
      json['stargazers_count'] as int,
      json['size'] as int,
      json['default_branch'] as String,
      json['open_issues_count'] as int,
      json['pushed_at'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['subscribers_count'] as int,
      License.fromJson(json['license'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$repoToJson(repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'parent': instance.parent,
      'private': instance.private,
      'description': instance.description,
      'fork': instance.fork,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'size': instance.size,
      'default_branch': instance.defaultBranch,
      'open_issues_count': instance.openIssuesCount,
      'pushed_at': instance.pushedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'subscribers_count': instance.subscribersCount,
      'license': instance.license,
    };

License _$LicenseFromJson(Map<String, dynamic> json) => License(
      json['key'] as String,
      json['name'] as String,
      json['spdx_id'] as String,
      json['url'] as String,
      json['node_id'] as String,
    );

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'spdx_id': instance.spdxId,
      'url': instance.url,
      'node_id': instance.nodeId,
    };
