import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:smart_parking_lot/app.dart';
import 'package:smart_parking_lot/firebase_options.dart';
import 'package:smart_parking_lot/minimal_theme.dart';
import 'package:smart_parking_lot/provider_scope.dart';
import 'package:smart_parking_lot/providers/app_auth_provider.dart';
import 'package:smart_parking_lot/providers/theme_provider.dart';
import 'package:smart_parking_lot/theme/m3/m3_color.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Global.instance._initiailize();
  AppAuthProvider.instance;

  runApp(
    Phoenix(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('km')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const ProviderScope(
          child: MinimalTheme(
            child: App(),
          ),
        ),
      ),
    ),
  );
}
