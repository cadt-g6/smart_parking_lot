import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smart_parking_lot/core/base/base_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/palettes/core_palette.dart';
import 'package:smart_parking_lot/core/storages/local_storages/theme_mode_storage.dart';
import 'package:smart_parking_lot/theme/theme_config.dart';

class ThemeProvider extends BaseViewModel with WidgetsBindingObserver {
  ThemeMode themeMode = ThemeMode.system;

  ColorScheme? lightDynamic;
  ColorScheme? darkDynamic;

  static final ThemeProvider instance = ThemeProvider._();
  ThemeProvider._() {
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> initialize() async {
    CorePalette? result = await DynamicColorPlugin.getCorePalette();
    lightDynamic ??= result?.toColorScheme();
    darkDynamic ??= result?.toColorScheme(brightness: Brightness.dark);
    themeMode = await ThemeModeStorage().readEnum() ?? themeMode;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ThemeData get lightTheme {
    if (themeMode == ThemeMode.system) {
      return ThemeConfig(false, lightDynamic).themeData;
    } else {
      return ThemeConfig(false, null).themeData;
    }
  }

  ThemeData get darkTheme {
    if (themeMode == ThemeMode.system) {
      return ThemeConfig(true, darkDynamic).themeData;
    } else {
      return ThemeConfig(true, null).themeData;
    }
  }

  bool isDarkMode() {
    if (themeMode == ThemeMode.system) {
      Brightness? brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleThemeMode() {
    themeMode = isDarkMode() ? ThemeMode.light : ThemeMode.dark;
    ThemeModeStorage().writeEnum(themeMode);
    notifyListeners();
  }
}
