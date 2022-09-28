// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'park_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ParkModelCWProxy {
  ParkModel createdAt(String? createdAt);

  ParkModel id(String id);

  ParkModel lots(List<String> lots);

  ParkModel name(String name);

  ParkModel updatedAt(String? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ParkModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ParkModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ParkModel call({
    String? createdAt,
    String? id,
    List<String>? lots,
    String? name,
    String? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfParkModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfParkModel.copyWith.fieldName(...)`
class _$ParkModelCWProxyImpl implements _$ParkModelCWProxy {
  final ParkModel _value;

  const _$ParkModelCWProxyImpl(this._value);

  @override
  ParkModel createdAt(String? createdAt) => this(createdAt: createdAt);

  @override
  ParkModel id(String id) => this(id: id);

  @override
  ParkModel lots(List<String> lots) => this(lots: lots);

  @override
  ParkModel name(String name) => this(name: name);

  @override
  ParkModel updatedAt(String? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ParkModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ParkModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ParkModel call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? lots = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return ParkModel(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      lots: lots == const $CopyWithPlaceholder() || lots == null
          ? _value.lots
          // ignore: cast_nullable_to_non_nullable
          : lots as List<String>,
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

extension $ParkModelCopyWith on ParkModel {
  /// Returns a callable class that can be used as follows: `instanceOfParkModel.copyWith(...)` or like so:`instanceOfParkModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ParkModelCWProxy get copyWith => _$ParkModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkModel _$ParkModelFromJson(Map<String, dynamic> json) => ParkModel(
      lots: (json['lots'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ParkModelToJson(ParkModel instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id': instance.id,
      'lots': instance.lots,
      'name': instance.name,
    };
