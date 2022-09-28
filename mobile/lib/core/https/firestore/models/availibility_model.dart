import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_parking_lot/core/https/firestore/models/base_firestore_model.dart';

part 'availibility_model.g.dart';

@CopyWith()
@JsonSerializable()
class AvailibilityModel extends BaseFirestoreModel {
  final List<String> free;
  final List<String> notFree;

  AvailibilityModel({
    required this.notFree,
    required this.free,
    required String? createdAt,
    required String? updatedAt,
    required String id,
  }) : super(createdAt, updatedAt, id);

  @override
  Map<String, dynamic> toJson() => _$AvailibilityModelToJson(this);
  factory AvailibilityModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] is int) json['id'] = json['id'].toString();
    return _$AvailibilityModelFromJson(json);
  }
}
