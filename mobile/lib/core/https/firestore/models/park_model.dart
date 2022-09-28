import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_parking_lot/core/https/firestore/models/base_firestore_model.dart';

part 'park_model.g.dart';

@CopyWith()
@JsonSerializable()
class ParkModel extends BaseFirestoreModel {
  final List<String> lots;
  final String name;

  ParkModel({
    required this.lots,
    required this.name,
    required String? createdAt,
    required String? updatedAt,
    required String id,
  }) : super(createdAt, updatedAt, id);

  @override
  Map<String, dynamic> toJson() => _$ParkModelToJson(this);
  factory ParkModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) json['id'] = json['name'].toString();
    return _$ParkModelFromJson(json);
  }
}
