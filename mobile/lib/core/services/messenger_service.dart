import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_lot/app.dart';
import 'package:smart_parking_lot/theme/m3/m3_color.dart';

class MessengerService {
  MessengerService._();
  static final MessengerService instance = MessengerService._();

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? scaffoldFeatureController;
  BuildContext? get _context => App.navigatorKey.currentContext;
  ScaffoldMessengerState? get _state {
    if (_context != null) {
      return ScaffoldMessenger.maybeOf(_context!);
    }
    return null;
  }

  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>? showMaterialBanner(String message) {
    return _state?.showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              MaterialLocalizations.of(_context!).okButtonLabel,
            ),
          ),
        ],
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(
    String message, {
    bool success = true,
    SnackBarAction Function(Color? foreground)? action,
    bool showAction = true,
  }) {
    clearSnackBars();
    Color? foreground = success ? null : M3Color.of(_context!).onError;
    Color? background = success ? null : M3Color.of(_context!).error;
    return _state?.showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: foreground)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: background,
        dismissDirection: DismissDirection.horizontal,
        action: showAction
            ? action != null
                ? action(foreground)
                : SnackBarAction(
                    label: MaterialLocalizations.of(_context!).okButtonLabel,
                    textColor: foreground,
                    onPressed: () {},
                  )
            : null,
      ),
    );
  }

  void clearSnackBars() {
    return _state?.clearSnackBars();
  }

  void hideCurrentMaterialBanner() {
    return _state?.hideCurrentMaterialBanner();
  }

  Future<T?> showLoading<T>({
    required Future<T?> Function() future,
    required BuildContext context,
    required String? debugSource,
  }) async {
    if (debugSource != null) {
      if (kDebugMode) print("LOADING $debugSource");
    }

    Completer<T?> completer = Completer();
    future().then((value) => completer.complete(value));

    if (!kIsWeb && Platform.isIOS) {
      return showCupertinoDialog<T>(
        context: context,
        builder: (context) => _loadingBuilder<T>(context, completer),
        barrierDismissible: false,
      );
    } else {
      return showDialog<T>(
        context: context,
        builder: (context) => _loadingBuilder<T>(context, completer),
        barrierDismissible: false,
      );
    }
  }

  void showLoadingStream({required Stream<double> stream}) {
    if (_context == null) return;
    if (!kIsWeb && Platform.isIOS) {
      showCupertinoDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (context) {
          return buildLoadingStream(stream);
        },
      );
    } else {
      showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (context) {
          return buildLoadingStream(stream);
        },
      );
    }
  }

  StreamBuilder<double> buildLoadingStream(Stream<double> stream) {
    return StreamBuilder<double>(
      stream: stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == 1.0) Navigator.of(context).pop();
        return CircularProgressIndicator.adaptive(
          value: data != null ? min(1, data) : null,
        );
      },
    );
  }

  Widget _loadingBuilder<T>(BuildContext context, Completer<T?> future) {
    return FutureBuilder<T?>(
      future: future.future.then((value) {
        Navigator.of(context).pop(value);
        return value;
      }),
      builder: (context, snapshot) {
        return AlertDialog(
          content: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: const [
              CircularProgressIndicator.adaptive(),
            ],
          ),
        );
      },
    );
  }
}
