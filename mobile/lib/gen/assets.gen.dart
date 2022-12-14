/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/appstore.png
  AssetGenImage get appstore => const AssetGenImage('assets/logo/appstore.png');

  /// File path: assets/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logo/logo.png');

  /// File path: assets/logo/playstore.png
  AssetGenImage get playstore =>
      const AssetGenImage('assets/logo/playstore.png');
}

class $AssetsLotGen {
  const $AssetsLotGen();

  /// File path: assets/lot/car.png
  AssetGenImage get car => const AssetGenImage('assets/lot/car.png');

  /// File path: assets/lot/car2.png
  AssetGenImage get car2 => const AssetGenImage('assets/lot/car2.png');

  /// File path: assets/lot/car3.png
  AssetGenImage get car3 => const AssetGenImage('assets/lot/car3.png');

  /// File path: assets/lot/car4.png
  AssetGenImage get car4 => const AssetGenImage('assets/lot/car4.png');
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/km.json
  String get km => 'assets/translations/km.json';
}

class Assets {
  Assets._();

  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsLotGen lot = $AssetsLotGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
