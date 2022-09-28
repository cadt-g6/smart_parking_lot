import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_lot/app_builder.dart';
import 'package:smart_parking_lot/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking_lot/views/home/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: "App");

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
      navigatorKey: navigatorKey,
      themeMode: provider.themeMode,
      theme: provider.lightTheme,
      darkTheme: provider.darkTheme,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) => AppBuilder(child: child),
      initialRoute: "/home",
      routes: {
        '/home': (context) => const HomeView(),
      },
    );
  }
}
