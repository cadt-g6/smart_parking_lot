import 'package:flutter/material.dart';
import 'package:smart_parking_lot/core/storages/base_object_storages/enum_storage.dart';

class ThemeModeStorage extends EnumStorage<ThemeMode> {
  @override
  List<ThemeMode> get values => ThemeMode.values;
}
