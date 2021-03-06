import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

export 'custom_shapes.dart';
export 'text_styles.dart';

const errorColor = Color(0xfff7943c);

const FlexSchemeColor _darkScheme = FlexSchemeColor(
  primary: Color(0xffff4f00),
  //Color(0xff54cc0e),
  primaryContainer: Color(0xffff2400),
  secondary: Color(0xffce7100),
  secondaryContainer: Color(0xff975300),
  tertiary: Color(0xff696969),
  tertiaryContainer: Color(0xff534b4f),
  error: Color(0xff09b342),
  errorContainer: Color(0xff078c34),
);

const FlexSchemeColor _lightScheme = FlexSchemeColor(
  primary: Color(0xffd2691e),
  primaryContainer: Color(0xffcc5500),
  secondary: Color(0xffff8800),
  secondaryContainer: Color(0xffff4f00),
  tertiary: Color(0xffc6c3b5),
  tertiaryContainer: Color(0xffa0a0a4),
  error: Color(0xfff7943c),
  errorContainer: Color(0xffff7518),
);

const TextTheme _textTheme = TextTheme(
  // displayLarge: TextStyle(
  //   color: Color(0xff696969),
  //   fontSize: 53,
  // ),
  // displayMedium: TextStyle(
  //   color: Color(0xff696969),
  //   fontSize: 41,
  // ),
  // displaySmall: TextStyle(
  //   color: Color(0xff696969),
  //   fontSize: 36,
  // ),
  labelMedium: TextStyle(
    color: Color(0xfffc2847),
    fontSize: 14,
    fontFamily: 'KingthingPetrock',
  ),
  titleMedium: TextStyle(
    color: Color(0xff696969),
    fontSize: 18,
    fontFamily: 'KingthingPetrock',
  ),
  bodyMedium: TextStyle(
    color: Colors.black,
    //color: Color(0xffbdbdbd),
    fontSize: 20,
    fontFamily: 'KingthingPetrock',
  ),
);

final ThemeData lightMainTheme = FlexThemeData.light(
  colors: _lightScheme,
  lightIsWhite: true,
  appBarStyle: FlexAppBarStyle.background,
  appBarElevation: 0.5,
  appBarOpacity: 0.97,
  transparentStatusBar: true,
  textTheme: _textTheme,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);

final ThemeData darkMainTheme = FlexThemeData.dark(
  colors: _darkScheme,
  darkIsTrueBlack: true,
  appBarBackground: const Color(0xfffc9d11),
  appBarStyle: FlexAppBarStyle.background,
  appBarElevation: 0.5,
  appBarOpacity: 0.97,
  transparentStatusBar: true,
  textTheme: _textTheme,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);
