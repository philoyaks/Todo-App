import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/pages/create_task_screen.dart';
import 'package:todoapp/pages/edit_task_screen.dart';
import 'package:todoapp/pages/home_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  bool goback() {
    _navigationKey.currentState?.pop();
    return true;
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageName.createTaskScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CreateTaskScreen(),
      );
    case PageName.editTaskScreen:
      var result = settings.arguments as List;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EditTaskScreen(
          task: result[0],
        ),
      );
    case PageName.homeScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeScreen(),
      );

    ///Default
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
