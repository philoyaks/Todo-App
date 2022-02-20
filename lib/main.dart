import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_theme.dart';
import 'package:todoapp/pages/home_screen.dart';
import 'package:todoapp/route.dart';
import 'package:device_preview/device_preview.dart';

import 'constants/app_constants.dart';

void main() {
  setupLocator();
  // runApp(const MyApp());

  DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        title: 'Flutter Demo',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigationService>().navigationKey,
        home: const HomeScreen());
  }
}
