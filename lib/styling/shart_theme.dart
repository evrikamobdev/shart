import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shart/styling/shart_colors.dart';

AppBarTheme _appBarTheme = AppBarTheme(
  centerTitle: true,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  elevation: 0.0,
);

ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    splashFactory: NoSplash.splashFactory,
    // minimumSize: MaterialStateProperty.all(
    //   Size(double.infinity, 50),
    // ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 14),
    ),
  ),
);

OutlinedButtonThemeData _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    splashFactory: NoSplash.splashFactory,
    side: MaterialStateProperty.all(
      BorderSide(
        color: ShartColors.primaryColor,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 18),
    ),
  ),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
);

final ThemeData shartTheme = ThemeData(
  primarySwatch: ShartColors.themePrimaryColor,
  inputDecorationTheme: _inputDecorationTheme,
  appBarTheme: _appBarTheme,
  elevatedButtonTheme: _elevatedButtonThemeData,
  outlinedButtonTheme: _outlinedButtonThemeData,
  splashFactory: NoSplash.splashFactory,
  useMaterial3: false,
);
