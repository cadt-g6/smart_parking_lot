// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availibility_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AvailibilityModelCWProxy {
  AvailibilityModel createdAt(String? createdAt);

  AvailibilityModel free(List<String> free);

  AvailibilityModel id(String id);

  AvailibilityModel notFree(List<String> notFree);

  AvailibilityModel updatedAt(String? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AvailibilityModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AvailibilityModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AvailibilityModel call({
    String? createdAt,
    List<String>? free,
    String? id,
    List<String>? notFree,
    String? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAvailibilityModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAvailibilityModel.copyWith.fieldName(...)`
class _$AvailibilityModelCWProxyImpl implements _$AvailibilityModelCWProxy {
  final AvailibilityModel _value;

  const _$AvailibilityModelCWProxyImpl(this._value);

  @override
  AvailibilityModel createdAt(String? createdAt) => this(createdAt: createdAt);

  @override
  AvailibilityModel free(List<String> free) => this(free: free);

  @override
  AvailibilityModel id(String id) => this(id: id);

  @override
  AvailibilityModel notFree(List<String> notFree) => this(notFree: notFree);

  @override
  AvailibilityModel updatedAt(String? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AvailibilityModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AvailibilityModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AvailibilityModel call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? free = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? notFree = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return AvailibilityModel(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      free: free == const $CopyWithPlaceholder() || free == null
          ? _value.free
          // ignore: cast_nullable_to_non_nullable
          : free as List<String>,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      notFree: notFree == const $CopyWithPlaceholder() || notFree == null
          ? _value.notFree
          // ignore: cast_nullable_to_non_nullable
          : notFree as List<String>,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as String?,
    );
  }
}

extension $AvailibilityModelCopyWith on AvailibilityModel {
  /// Returns a callable class that can be used as follows: `instanceOfAvailibilityModel.copyWith(...)` or like so:`instanceOfAvailibilityModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AvailibilityModelCWProxy get copyWith =>
      _$AvailibilityModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailibilityModel _$AvailibilityModelFromJson(Map<String, dynamic> json) =>
    AvailibilityModel(
      notFree:
          (json['not_free'] as List<dynamic>).map((e) => e as String).toList(),
      free: (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$AvailibilityModelToJson(AvailibilityModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id': instance.id,
      'free': instance.free,
      'not_free': instance.notFree,
    };
