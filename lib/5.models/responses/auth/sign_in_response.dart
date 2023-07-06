import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse extends Equatable {
  final String accessToken;
  const SignInResponse({
    required this.accessToken,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  SignInResponse copyWith({
    String? accessToken,
  }) {
    return SignInResponse(
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  List<Object> get props => [accessToken];
}
