import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_parking_lot/theme/theme_constant.dart';

class M3Color {
  /// Use `M3Color.of(context)` instead of `Theme.of(context).colorScheme`
  static ColorScheme of(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static ColorScheme? darkScheme;
  static ColorScheme? lightScheme;

  static ColorScheme colorScheme(Brightness brightness) {
    return brightness == Brightness.dark ? darkScheme! : lightScheme!;
  }

  static Future<void> initialize() async {
    darkScheme = await M3Color.getScheme(true, ThemeConstant.seedColor);
    lightScheme = await M3Color.getScheme(false, ThemeConstant.seedColor);
  }

  static Brightness keyboardAppearance(BuildContext context) {
    return Theme.of(context).colorScheme.brightness;
  }

  static ColorScheme darkSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark);
  }

  static ColorScheme lightSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light);
  }

  static Future<ColorScheme> getScheme(bool isDarkMode, Color color) async {
    return compute(isDarkMode ? darkSchemeFromSeed : lightSchemeFromSeed, color);
  }

  static SystemUiOverlayStyle systemOverlayStyleFromBg(Color color) {
    Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    return brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
  }
}
