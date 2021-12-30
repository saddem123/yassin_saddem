import 'package:flutter/material.dart';
import 'package:yassin_saddem/utils/hex_color.dart';

const Map<int, Color> _primaryColor = {
  50: Color.fromRGBO(25, 88, 96, .1),
  100: Color.fromRGBO(25, 88, 96, .2),
  200: Color.fromRGBO(25, 88, 96, .3),
  300: Color.fromRGBO(25, 88, 96, .4),
  400: Color.fromRGBO(25, 88, 96, .5),
  500: Color.fromRGBO(25, 88, 96, .6),
  600: Color.fromRGBO(25, 88, 96, .7),
  700: Color.fromRGBO(25, 88, 96, .8),
  800: Color.fromRGBO(25, 88, 96, .9),
  900: Color.fromRGBO(25, 88, 96, 1)
};
const MaterialColor primaryColor = MaterialColor(0xFF195860, _primaryColor);

final blueTextColor = HexColor("19295C");
final greyTextColor = HexColor("B8BAC3");
final blueShadowColor = HexColor("8291B4");
final backgroundGreyColor = HexColor("707070");
final primaryColorShadow = HexColor("134147");
final textFieldBackgroundColor = HexColor("F2F4F7");
