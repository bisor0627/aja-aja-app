import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeStampConverter implements JsonConverter<DateTime, Object?> {
  const TimeStampConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    if (json is DateTime) return json;

    throw StateError("");
  }

  static DateTime staticFromJson(Object? json) {
    return const TimeStampConverter().fromJson(json);
  }

  @override
  Object? toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }

  static Object? staticToJson(DateTime object) {
    return const TimeStampConverter().toJson(object);
  }
}
