import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:dandia/services/navigation_service/navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<INavigationService>(() => NavigationService());
}
