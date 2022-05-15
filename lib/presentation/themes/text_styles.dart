import 'package:flutter/material.dart';

class ThemeFonts {
  static const TextStyle _generalDeclarativeStyle = TextStyle(
    color: Color(0xffbdbdbd),
    fontSize: 26,
    fontFamily: 'MarriageAnt',
  );

  static const TextStyle _generalExpositiveStyle = TextStyle(
    color: Color(0xffbdbdbd),
    fontSize: 14,
    fontFamily: 'KingthingPetrock',
  );

  static const TextStyle _generalNominativeStyle = TextStyle(
    color: Color(0xffbdbdbd),
    fontSize: 14,
    fontFamily: 'Pacifico',
  );

  static const TextStyle _generalDescriptiveStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: 'BadScript',
  );

  static TextStyle get generalDeclarativeStyle => _generalDeclarativeStyle;
  static TextStyle get generalNominativeStyle => _generalNominativeStyle;
  static TextStyle get generalExpositiveStyle => _generalExpositiveStyle;
  static TextStyle get generalDescriptiveStyle => _generalDescriptiveStyle;
}
