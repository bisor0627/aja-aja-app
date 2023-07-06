import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class DataResponse<T> {
  @JsonKey(name: 'success')
  final bool isSuccess;
  final List<T?> data;

  DataResponse({
    required this.isSuccess,
    required this.data,
  });

  // Interesting bits here → ----------------------------------- ↓ ↓
  factory DataResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataResponseFromJson<T>(json, fromJsonT);

  // And here → ------------- ↓ ↓
  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$DataResponseToJson<T>(this, toJsonT);
}
