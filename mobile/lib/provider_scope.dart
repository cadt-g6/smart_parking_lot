import 'package:flutter/material.dart';
import 'package:smart_parking_lot/providers/app_auth_provider.dart';
import 'package:smart_parking_lot/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProviderScope extends StatelessWidget {
  const ProviderScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ThemeProvider>(
          create: (context) => ThemeProvider.instance,
        ),
        ListenableProvider<AppAuthProvider>(
          create: (context) => AppAuthProvider.instance,
        ),
      ],
      child: child,
    );
  }
}
