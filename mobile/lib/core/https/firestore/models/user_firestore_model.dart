import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_parking_lot/core/https/firestore/models/base_firestore_model.dart';

part 'user_firestore_model.g.dart';

@CopyWith()
@JsonSerializable()
class UserFirestoreModel extends BaseFirestoreModel {
  UserFirestoreModel({
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.login,
    required this.profileUrl,
    required String createdAt,
    required String updatedAt,
    required String id,
  }) : super(createdAt, updatedAt, id);

  final String? firstName;
  final String? lastName;
  final String? dob;
  final String? profileUrl;
  final List<String>? login;

  String? get displayName {
    if (firstName == null && lastName == null) return null;
    return [
      firstName ?? "",
      lastName ?? "",
    ].join(" ").trim();
  }

  String? get username {
    final logins = login?.where((e) => e != id);
    if (logins?.isNotEmpty == true) return logins?.join(" | ");
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$UserFirestoreModelToJson(this);
  factory UserFirestoreModel.fromJson(Map<String, dynamic> json) => _$UserFirestoreModelFromJson(json);
}
