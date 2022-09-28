// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LayoutModelCWProxy {
  LayoutModel createdAt(String? createdAt);

  LayoutModel data(List<ParkModel> data);

  LayoutModel id(String id);

  LayoutModel name(String name);

  LayoutModel updatedAt(String? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LayoutModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LayoutModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LayoutModel call({
    String? createdAt,
    List<ParkModel>? data,
    String? id,
    String? name,
    String? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLayoutModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLayoutModel.copyWith.fieldName(...)`
class _$LayoutModelCWProxyImpl implements _$LayoutModelCWProxy {
  final LayoutModel _value;

  const _$LayoutModelCWProxyImpl(this._value);

  @override
  LayoutModel createdAt(String? createdAt) => this(createdAt: createdAt);

  @override
  LayoutModel data(List<ParkModel> data) => this(data: data);

  @override
  LayoutModel id(String id) => this(id: id);

  @override
  LayoutModel name(String name) => this(name: name);

  @override
  LayoutModel updatedAt(String? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LayoutModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LayoutModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LayoutModel call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return LayoutModel(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<ParkModel>,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as String?,
    );
  }
}

extension $LayoutModelCopyWith on LayoutModel {
  /// Returns a callable class that can be used as follows: `instanceOfLayoutModel.copyWith(...)` or like so:`instanceOfLayoutModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LayoutModelCWProxy get copyWith => _$LayoutModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutModel _$LayoutModelFromJson(Map<String, dynamic> json) => LayoutModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => ParkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$LayoutModelToJson(LayoutModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id': instance.id,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
