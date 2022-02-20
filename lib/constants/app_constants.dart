import 'package:get_it/get_it.dart';

import '../route.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

class PageName {
  static const String createOREditScreen = 'CreateOREditScreen';
  static const String homeScreen = 'Homescreen';
}
