/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCaGen {
  const $AssetsCaGen();

  /// File path: assets/ca/lets-encrypt-r3.pem
  String get letsEncryptR3 => 'assets/ca/lets-encrypt-r3.pem';

  /// List of all assets
  List<String> get values => [letsEncryptR3];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Barlow-Bold.ttf
  String get barlowBold => 'assets/fonts/Barlow-Bold.ttf';

  /// File path: assets/fonts/Barlow-Light.ttf
  String get barlowLight => 'assets/fonts/Barlow-Light.ttf';

  /// File path: assets/fonts/Barlow-Medium.ttf
  String get barlowMedium => 'assets/fonts/Barlow-Medium.ttf';

  /// File path: assets/fonts/Barlow-Regular.ttf
  String get barlowRegular => 'assets/fonts/Barlow-Regular.ttf';

  /// File path: assets/fonts/Barlow-SemiBold.ttf
  String get barlowSemiBold => 'assets/fonts/Barlow-SemiBold.ttf';

  /// List of all assets
  List<String> get values =>
      [barlowBold, barlowLight, barlowMedium, barlowRegular, barlowSemiBold];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bannerbase.png
  AssetGenImage get bannerbase =>
      const AssetGenImage('assets/images/bannerbase.png');

  /// File path: assets/images/bannerr.png
  AssetGenImage get bannerr => const AssetGenImage('assets/images/bannerr.png');

  /// File path: assets/images/bannerrigt.png
  AssetGenImage get bannerrigt =>
      const AssetGenImage('assets/images/bannerrigt.png');

  /// File path: assets/images/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.png');

  /// File path: assets/images/bgbanner.png
  AssetGenImage get bgbanner =>
      const AssetGenImage('assets/images/bgbanner.png');

  /// File path: assets/images/calendertime.png
  AssetGenImage get calendertime =>
      const AssetGenImage('assets/images/calendertime.png');

  /// File path: assets/images/cam.png
  AssetGenImage get cam => const AssetGenImage('assets/images/cam.png');

  /// File path: assets/images/carpenter.png
  AssetGenImage get carpenter =>
      const AssetGenImage('assets/images/carpenter.png');

  /// File path: assets/images/catanddog.png
  AssetGenImage get catanddog =>
      const AssetGenImage('assets/images/catanddog.png');

  /// File path: assets/images/cautions.png
  AssetGenImage get cautions =>
      const AssetGenImage('assets/images/cautions.png');

  /// File path: assets/images/construction.png
  AssetGenImage get construction =>
      const AssetGenImage('assets/images/construction.png');

  /// File path: assets/images/dog.png
  AssetGenImage get dog => const AssetGenImage('assets/images/dog.png');

  /// File path: assets/images/driver.png
  AssetGenImage get driver => const AssetGenImage('assets/images/driver.png');

  /// File path: assets/images/electrition.png
  AssetGenImage get electrition =>
      const AssetGenImage('assets/images/electrition.png');

  /// File path: assets/images/electritionexpert.png
  AssetGenImage get electritionexpert =>
      const AssetGenImage('assets/images/electritionexpert.png');

  /// File path: assets/images/iconnn.png
  AssetGenImage get iconnn => const AssetGenImage('assets/images/iconnn.png');

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/login.png
  AssetGenImage get login => const AssetGenImage('assets/images/login.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/painter.png
  AssetGenImage get painter => const AssetGenImage('assets/images/painter.png');

  /// File path: assets/images/per.png
  AssetGenImage get per => const AssetGenImage('assets/images/per.png');

  /// File path: assets/images/personn.png
  AssetGenImage get personn => const AssetGenImage('assets/images/personn.png');

  /// File path: assets/images/star.png
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bannerbase,
        bannerr,
        bannerrigt,
        bg,
        bgbanner,
        calendertime,
        cam,
        carpenter,
        catanddog,
        cautions,
        construction,
        dog,
        driver,
        electrition,
        electritionexpert,
        iconnn,
        img,
        login,
        logo,
        painter,
        per,
        personn,
        star
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/imagelist.json
  String get imagelist => 'assets/json/imagelist.json';

  /// List of all assets
  List<String> get values => [imagelist];
}

class Assets {
  Assets._();

  static const $AssetsCaGen ca = $AssetsCaGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
