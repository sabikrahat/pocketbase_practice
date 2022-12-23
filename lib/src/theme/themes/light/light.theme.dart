import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Brightness, SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../utils/constants/constants.dart';

SystemUiOverlayStyle lightUiConfig = const SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: kPrimaryColor,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  statusBarColor: kPrimaryColor,
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.nunito().fontFamily,
  colorScheme: const ColorScheme.light(),
  toggleableActiveColor: kPrimaryColor,
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: kPrimaryColor),
  primaryColor: kPrimaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 1.0,
  ),
  inputDecorationTheme: lightInputDecorationTheme,
  elevatedButtonTheme: lightElevatedButtonThemeData,
  outlinedButtonTheme: lightOutlinedButtonThemeData,
  appBarTheme: lightAppBarTheme,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: kPrimaryColor),
  cupertinoOverrideTheme: const CupertinoThemeData(primaryColor: kPrimaryColor),
);

AppBarTheme lightAppBarTheme = const AppBarTheme(
  elevation: 0.0,
  backgroundColor: kPrimaryColor,
  iconTheme: IconThemeData(color: white),
  actionsIconTheme: IconThemeData(color: white),
);

IconThemeData lightIconThemeData = const IconThemeData(color: kPrimaryColor);

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    gapPadding: 10,
    borderSide: const BorderSide(color: kPrimaryColor, width: 1.3),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    gapPadding: 10,
    borderSide: const BorderSide(color: kFieldBg, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    gapPadding: 10,
    borderSide: const BorderSide(color: kPrimaryColor, width: 1.3),
  ),
  floatingLabelStyle: const TextStyle(
    color: kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.red, width: 1.3),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.red, width: 1.3),
  ),
  errorMaxLines: 3,
  suffixIconColor: kPrimaryColor,
  prefixIconColor: kPrimaryColor,
  fillColor: kFieldBg,
  filled: true,
);

ElevatedButtonThemeData lightElevatedButtonThemeData = ElevatedButtonThemeData(
  style: OutlinedButton.styleFrom(
    minimumSize: const Size(220, 45),
    foregroundColor: Colors.white,
    backgroundColor: kPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    textStyle: const TextStyle(fontSize: 15.0),
  ),
);

OutlinedButtonThemeData lightOutlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    minimumSize: const Size(220, 45),
    foregroundColor: kPrimaryColor,
    backgroundColor: kFieldBg,
    textStyle: const TextStyle(fontSize: 15.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
  ),
);
