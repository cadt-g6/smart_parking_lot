import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_parking_lot/core/https/firestore/models/base_firestore_model.dart';
import 'package:smart_parking_lot/core/https/firestore/models/park_model.dart';

part 'layout_model.g.dart';

@CopyWith()
@JsonSerializable()
class LayoutModel extends BaseFirestoreModel {
  final List<ParkModel> data;
  final String name;

  LayoutModel({
    required this.data,
    required this.name,
    required String? createdAt,
    required String? updatedAt,
    required String id,
  }) : super(createdAt, updatedAt, id);

  @override
  Map<String, dynamic> toJson() => _$LayoutModelToJson(this);
  factory LayoutModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] is int) json['id'] = json['id'].toString();
    return _$LayoutModelFromJson(json);
  }
}
