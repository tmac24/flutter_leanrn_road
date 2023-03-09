// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

user _$userFromJson(Map<String, dynamic> json) => user(
      json['login'] as String,
      json['avatar_url'] as String,
      json['type'] as String,
      json['name'] as String,
      json['company'] as String,
      json['blog'] as String,
      json['location'] as String,
      json['email'] as String,
      json['hireable'] as bool,
      json['bio'] as String,
      json['public_repos'] as int,
      json['followers'] as int,
      json['following'] as int,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['total_private_repos'] as int,
      json['owned_private_repos'] as int,
    );

Map<String, dynamic> _$userToJson(user instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'type': instance.type,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'bio': instance.bio,
      'public_repos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'total_private_repos': instance.totalPrivateRepos,
      'owned_private_repos': instance.ownedPrivateRepos,
    };
