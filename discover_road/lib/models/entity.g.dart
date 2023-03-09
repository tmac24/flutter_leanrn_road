// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      json['count'] as int,
      json['start'] as int,
      json['total'] as int,
      (json['verify_users'] as List<dynamic>)
          .map((e) => Verify_users.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'total': instance.total,
      'verify_users': instance.verifyUsers,
    };

Verify_users _$Verify_usersFromJson(Map<String, dynamic> json) => Verify_users(
      (json['verify_roles'] as List<dynamic>).map((e) => e as String).toList(),
      json['articles'] as List<dynamic>,
      json['article_count'] as int,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['questions'] as List<dynamic>,
      json['question_count'] as int,
    );

Map<String, dynamic> _$Verify_usersToJson(Verify_users instance) =>
    <String, dynamic>{
      'verify_roles': instance.verifyRoles,
      'articles': instance.articles,
      'article_count': instance.articleCount,
      'user': instance.user,
      'questions': instance.questions,
      'question_count': instance.questionCount,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['reg_time'] as String,
      json['followed'] as bool,
      json['uid'] as String,
      json['name'] as String,
      json['url'] as String,
      json['verify_type'] as int,
      json['abstract'] as String,
      json['uri'] as String,
      json['id'] as String,
      json['avatar_side_icon'] as String,
      json['medal_groups'] as List<dynamic>,
      json['remark'] as String,
      json['avatar_side_icon_id'] as String,
      json['in_blacklist'] as bool,
      json['followers_count'] as int,
      json['is_club'] as bool,
      json['is_banned'] as bool,
      json['type'] as String,
      json['kind'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'reg_time': instance.regTime,
      'followed': instance.followed,
      'uid': instance.uid,
      'name': instance.name,
      'url': instance.url,
      'verify_type': instance.verifyType,
      'abstract': instance.abstract,
      'uri': instance.uri,
      'id': instance.id,
      'avatar_side_icon': instance.avatarSideIcon,
      'medal_groups': instance.medalGroups,
      'remark': instance.remark,
      'avatar_side_icon_id': instance.avatarSideIconId,
      'in_blacklist': instance.inBlacklist,
      'followers_count': instance.followersCount,
      'is_club': instance.isClub,
      'is_banned': instance.isBanned,
      'type': instance.type,
      'kind': instance.kind,
      'avatar': instance.avatar,
    };
