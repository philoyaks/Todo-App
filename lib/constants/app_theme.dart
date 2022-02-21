import 'package:flutter/material.dart';

import 'app_constants.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: kprimaryColor,
    fontFamily: 'Helvetica',
    buttonTheme: const ButtonThemeData(buttonColor: kprimaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kprimaryColor)),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: kprimaryColor),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xfff5f5f5),
        filled: true,
        hintStyle: const TextStyle(
          color: Color(0xffa7a6b3),
          fontSize: 14,
        ),
        hoverColor: kprimaryColor,
        floatingLabelStyle: const TextStyle(fontSize: 16, color: Colors.red),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff5f5f5), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff5f5f5), width: 1),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 1))),
    appBarTheme: const AppBarTheme(backgroundColor: kprimaryColor),
    backgroundColor: Colors.white,
    unselectedWidgetColor: Colors.red,
    disabledColor: Colors.black,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontFamily: 'Circular Std',
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
      bodyText2: TextStyle(
        color: Color(0xff06051b),
        fontSize: 14,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      subtitle1: TextStyle(
        color: Color(0xff777777),
        fontSize: 18,
      ),
      subtitle2: TextStyle(
          color: Color(0xffa7a6b3),
          fontSize: 12,
          decoration: TextDecoration.lineThrough),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: kprimaryColor));


// const Color
