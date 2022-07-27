import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  static const double multiplicand = 0.01323;

  double get smallValue => height * multiplicand * 1;
  double get mediumValue => height * multiplicand * 2;
  double get largeValue => height * multiplicand * 3;
  double get largeXValue => height * multiplicand * 4;
  double get largeXXValue => height * multiplicand * 5;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionOnlyTop on BuildContext {
  EdgeInsets get paddingOnlyTopSmall => EdgeInsets.only(top: smallValue);
  EdgeInsets get paddingOnlyTopMedium => EdgeInsets.only(top: mediumValue);
  EdgeInsets get paddingOnlyTopLarge => EdgeInsets.only(top: largeValue);
  EdgeInsets get paddingOnlyTopLargeX => EdgeInsets.only(top: largeXValue);
  EdgeInsets get paddingOnlyTopLargeXX => EdgeInsets.only(top: largeXXValue);
}

extension PaddingExtensionOnlyBottom on BuildContext {
  EdgeInsets get paddingOnlyBottomSmall => EdgeInsets.only(bottom: smallValue);
  EdgeInsets get paddingOnlyBottomMedium => EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get paddingOnlyBottomLarge => EdgeInsets.only(bottom: largeValue);
  EdgeInsets get paddingOnlyBottomLargeX => EdgeInsets.only(bottom: largeXValue);
  EdgeInsets get paddingOnlyBottomLargeXX => EdgeInsets.only(bottom: largeXXValue);
}

extension PaddingExtensionOnlyLeft on BuildContext {
  EdgeInsets get paddingOnlyLeftSmallX => EdgeInsets.only(left: smallValue * 3 / 4);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingSmallHorizontal => EdgeInsets.symmetric(horizontal: smallValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingLargeHorizontal => EdgeInsets.symmetric(horizontal: largeValue);
  EdgeInsets get paddingLargeXHorizontal => EdgeInsets.symmetric(horizontal: largeXValue);

  EdgeInsets get paddingLargeXXHorizontal => EdgeInsets.symmetric(horizontal: largeXXValue);

  EdgeInsets get paddingSmallVertical => EdgeInsets.symmetric(vertical: smallValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingLargeVertical => EdgeInsets.symmetric(vertical: largeValue);
  EdgeInsets get paddingLargeXVertical => EdgeInsets.symmetric(vertical: largeXValue);

  EdgeInsets get paddingLargeXXVertical => EdgeInsets.symmetric(vertical: largeXXValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
