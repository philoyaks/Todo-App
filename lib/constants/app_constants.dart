import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../route.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}

class PageName {
  static const String createTaskScreen = 'createTaskScreen';
  static const String editTaskScreen = 'editTaskScreen';

  static const String homeScreen = 'Homescreen';
}

//Color Constants in App
const Color kContainerBorderColorOrange = Color(0xffecb200);
const Color kContainerBackgroundColorOrange = Color(0xfffff8e6);
const Color kContainerBorderColorGreen = Color(0xff00901f);
const Color kContainerBackgroundColorGreen = Color(0xffeefff4);

const Color kprimaryColor = Color(0xff742ddd);

const Color kTextHintTextColor = Color(0xffa7a6b3);
const Color kTextGreyColor = Color(0xff777777);
