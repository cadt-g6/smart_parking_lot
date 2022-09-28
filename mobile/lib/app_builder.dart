import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle overlay = const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlay,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
