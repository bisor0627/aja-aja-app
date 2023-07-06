// sign in request model
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable(includeIfNull: false)
class SignInRequest extends Equatable {
  final String email;
  final String password;
  final String firebaseToken;
  const SignInRequest({
    required this.email,
    required this.password,
    required this.firebaseToken,
  });

  SignInRequest copyWith({
    String? email,
    String? password,
    String? firebaseToken,
  }) {
    return SignInRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      firebaseToken: firebaseToken ?? this.firebaseToken,
    );
  }

  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);

  @override
  List<Object> get props => [email, password, firebaseToken];
}
