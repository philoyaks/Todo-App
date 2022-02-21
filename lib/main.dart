import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_theme.dart';
import 'package:todoapp/pages/home_screen.dart';
import 'package:todoapp/route.dart';
import 'package:device_preview/device_preview.dart';

import 'constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await initHiveForFlutter();

  runApp(const MyApp());

  // DevicePreview(
  //   enabled: true,
  //   builder: (context) => const MyApp(),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigationService>().navigationKey,
        home: BlocProvider(
          create: (context) => TodoBloc()..add(TodoGetAllTaskEvent()),
          child: const HomeScreen(),
        ));
  }
}
