import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: kprimaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: kprimaryColor),
    backgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
      subtitle1: TextStyle(
        color: Color(0xff777777),
        fontSize: 18,
      ),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: kprimaryColor));

const Color kContainerBorderColorOrange = Color(0xffecb200);
const Color kContainerBackgroundColorOrange = Color(0xfffff8e6);
const Color kContainerBorderColorGreen = Color(0xff00901f);
const Color kContainerBackgroundColorGreen = Color(0xffeefff4);

const Color kprimaryColor = Color(0xff742ddd);

const Color kTextHintTextColor = Color(0xffa7a6b3);
const Color kTextGreyColor = Color(0xff777777);
// const Color

Widget CicularContainer() => Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xffecb200),
          width: 1,
        ),
        color: Color(0xfffff8e6),
      ),
    );

Widget Ciculargreen() => Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xff00901f),
          width: 1,
        ),
        color: Color(0xffeefff4),
      ),
    );
