import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_parking_lot/core/constants/config_constant.dart';
import 'package:smart_parking_lot/core/extensions/color_scheme_extension.dart';
import 'package:smart_parking_lot/theme/m3/m3_color.dart';
import 'package:smart_parking_lot/theme/theme_constant.dart';

class ThemeConfig {
  final bool isDarkMode;
  final ColorScheme? colorScheme;

  ThemeConfig(
    this.isDarkMode,
    this.colorScheme,
  );

  factory ThemeConfig.light() {
    return ThemeConfig.fromDarkMode(false);
  }

  factory ThemeConfig.dark() {
    return ThemeConfig.fromDarkMode(true);
  }

  ThemeConfig.fromDarkMode(this.isDarkMode) : colorScheme = null;

  ColorScheme get _light => M3Color.colorScheme(Brightness.light);
  ColorScheme get _dark => M3Color.colorScheme(Brightness.dark);

  ThemeData get themeData {
    ColorScheme colorScheme = this.colorScheme ?? (isDarkMode ? _dark : _light);
    TextTheme textTheme = buildTextTheme().apply(
      bodyColor: colorScheme.onBackground,
      displayColor: colorScheme.onSurface,
      decorationColor: colorScheme.onSurface,
    );

    ThemeData themeData = ThemeData(
      // platform: TargetPlatform.android,
      useMaterial3: true,
      applyElevationOverlayColor: true,
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      colorScheme: colorScheme,
      canvasColor: colorScheme.readOnly.surface2,
      toggleableActiveColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.readOnly.surface2,
        centerTitle: false,
        elevation: 0.0,
        foregroundColor: colorScheme.onSurface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        enableFeedback: true,
        elevation: 2.0,
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        extendedPadding: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2 + 4),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurface.withOpacity(0.75),
        labelStyle: textTheme.labelLarge,
        unselectedLabelStyle: textTheme.labelLarge,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF323232),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: _light.background),
        actionTextColor: _dark.primary,
        shape: RoundedRectangleBorder(
          borderRadius: ConfigConstant.circlarRadius1,
        ),
      ),
      // splashColor: ThemeConstant.splashColor,
      indicatorColor: colorScheme.onPrimary,
      textTheme: textTheme,
      textButtonTheme: buildTextButtonStyle(colorScheme),
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
    );

    themeData = themeData.copyWith(
      cardTheme: CardTheme(
        clipBehavior: Clip.hardEdge,
        elevation: 0.0,
        margin: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2),
        color: colorScheme.readOnly.surface1,
        shape: RoundedRectangleBorder(
          borderRadius: ConfigConstant.circlarRadius2,
          side: BorderSide(
            color: themeData.dividerColor,
          ),
        ),
      ),
    );

    return withDefault(themeData);
  }

  static ThemeData withDefault(ThemeData themeData) {
    return themeData.copyWith(
      // selection toolbars
      cardColor: themeData.colorScheme.readOnly.surface5,
      splashFactory: buildSplash(themeData.platform),
    );
  }

  // InkSparkle.splashFactory,
  // InkRipple.splashFactory,
  // InkSplash.splashFactory,
  // NoSplash.splashFactory
  static InteractiveInkFeatureFactory buildSplash(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return InkSparkle.splashFactory;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return NoSplash.splashFactory;
    }
  }

  static bool isApple(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  TextButtonThemeData buildTextButtonStyle(ColorScheme colorScheme) {
    return const TextButtonThemeData(
        // style: TextButton.styleFrom(
        //   onSurface: colorScheme.onSurface,
        //   primary: colorScheme.primary,
        //   backgroundColor: colorScheme.background,
        // ).copyWith(
        //   padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: ConfigConstant.margin1)),
        //   overlayColor: MaterialStateProperty.all(ThemeConstant.splashColor),
        // backgroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.isNotEmpty) {
        //       switch (states.last) {
        //         case MaterialState.hovered:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.focused:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.pressed:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.dragged:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.selected:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.scrolledUnder:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.disabled:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //         case MaterialState.error:
        //           return colorScheme.onPrimary.withOpacity(0.1);
        //       }
        //     }
        //     return colorScheme.primary;
        //   },
        // ),
        // ),
        );
  }

  TextTheme buildTextTheme() {
    return GoogleFonts.getTextTheme(
      ThemeConstant.defaultFontFamily,
      ThemeConstant.defaultTextTheme,
    );
  }
}
