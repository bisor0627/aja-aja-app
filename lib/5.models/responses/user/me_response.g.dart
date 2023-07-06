// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeResponse _$MeResponseFromJson(Map<String, dynamic> json) => MeResponse(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      introduce: json['introduce'] as String?,
      profileImage: json['profileImage'] as String,
      social: json['social'] as String,
      pushEnabled: json['pushEnabled'] as bool,
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
      updatedAt: const TimeStampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$MeResponseToJson(MeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'introduce': instance.introduce,
      'profileImage': instance.profileImage,
      'social': instance.social,
      'pushEnabled': instance.pushEnabled,
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
      'updatedAt': const TimeStampConverter().toJson(instance.updatedAt),
    };
