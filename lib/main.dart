import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_theme.dart';
import 'package:todoapp/pages/home_screen.dart';
import 'package:todoapp/route.dart';

import 'constants/app_constants.dart';
import 'data/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await initHiveForFlutter();

  runApp(BlocProvider(
    create: (context) => TodoBloc(Repository()),
    child: const MyApp(),
  ));
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
        home: const HomeScreen());
  }
}
