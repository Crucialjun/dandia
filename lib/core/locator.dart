import 'package:dandia/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:dandia/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:dandia/services/navigation_service/navigation_service.dart';
import 'package:dandia/services/network_service/i_network_service.dart';
import 'package:dandia/services/network_service/network_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<INavigationService>(() => NavigationService());
  locator.registerLazySingleton<INetworkService>(() => NetworkService());
  locator.registerLazySingleton<IDialogAndSheetService>(
      () => DialogAndSheetService());
}
