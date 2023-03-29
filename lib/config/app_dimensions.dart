import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  AppDimensions._internal();

  /// Samsung S21 Ultra viewport size
  static const Size designSize = Size(428, 916);

  /// Extremely large text   `96.sp`
  static final headline1 = 96.sp;

  /// Very, very large text    `60.sp`
  static final headline2 = 60.sp;

  /// Very large text    `48.sp`
  static final headline3 = 48.sp;

  ///Large text    `34.sp`
  static final headline4 = 34.sp;

  /// Used for the primary text in app bars and dialogs    `24.sp`
  static final headline5 = 24.sp;

  /// Used for the primary text in lists    `20.sp`
  static final headline6 = 20.sp;

  /// Used for emphasizing text that would otherwise be [bodyText2]        `16.sp`
  static final bodyText1 = 16.sp;

  /// The default text style for [Material]        `14.sp`
  static final bodyText2 = 14.sp;

  /// Used for auxiliary text associated with images      `12.sp`
  static final caption = 12.sp;

  /// The smallest style     `10.sp`
  static final overline = 10.sp;

  /// Default screen margins, according to Android Design guidelines `16`
  static final horizontalMargin = 16.w;

  /// Same as [horizontalMargin] `16`
  static final verticalMargin = 16.h;

  /// Height-Space between two panes in a layout        `24.w`
  static final heightSpacer = 24.h;

  /// Width-Space between two panes in a layout        `24.w`
  static final widthSpacer = 24.w;
}
