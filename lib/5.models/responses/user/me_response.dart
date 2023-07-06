// me info response

import 'package:json_annotation/json_annotation.dart';

import '../../../index.dart';

part 'me_response.g.dart';

@JsonSerializable()
@TimeStampConverter()
class MeResponse {
  final String id;
  final String email;
  final String name;
  final String? introduce;
  final String profileImage;
  final String social;
  final bool pushEnabled;

  final DateTime createdAt;
  final DateTime updatedAt;
  MeResponse({
    required this.id,
    required this.email,
    required this.name,
    this.introduce,
    required this.profileImage,
    required this.social,
    required this.pushEnabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) => _$MeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MeResponseToJson(this);
}
