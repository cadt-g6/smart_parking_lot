import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_lot/providers/theme_provider.dart';
import 'package:smart_parking_lot/theme/theme_config.dart';
import 'package:provider/provider.dart';

class MinimalTheme extends StatelessWidget {
  const MinimalTheme({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
      home: child,
      themeMode: provider.themeMode,
      theme: buildThemeData(provider.lightTheme.colorScheme, false),
      darkTheme: buildThemeData(provider.darkTheme.colorScheme, true),
    );
  }

  ThemeData buildThemeData(ColorScheme colors, bool isDarkMode) {
    ThemeConfig maxThemeConfig = isDarkMode ? ThemeConfig.dark() : ThemeConfig.light();
    return ThemeConfig.withDefault(ThemeData(
      useMaterial3: true,
      dialogBackgroundColor: colors.background,
      backgroundColor: colors.background,
      primaryColor: colors.primary,
      colorScheme: colors,
      toggleableActiveColor: colors.primary,
      textTheme: maxThemeConfig.buildTextTheme(),
      cupertinoOverrideTheme: const CupertinoThemeData(textTheme: CupertinoTextThemeData()),
    ));
  }
}
