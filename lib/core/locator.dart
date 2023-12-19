import 'package:dandia/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:dandia/features/auth/data/data_sources/remote_data_source/i_auth_remote_data_source.dart';
import 'package:dandia/features/auth/data/repository/auth_repository.dart';
import 'package:dandia/features/auth/data/repository/i_auth_repository.dart';
import 'package:dandia/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:dandia/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dandia/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:dandia/services/firebase_auth_service/i_firebase_auth_service.dart';
import 'package:dandia/services/firebase_database_service/firebase_database_service.dart';
import 'package:dandia/services/firebase_database_service/i_firebase_database_service.dart';
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
  locator
      .registerLazySingleton<IFirebaseAuthService>(() => FirebaseAuthService());
  locator.registerLazySingleton<IFirebaseDatabaseService>(
      () => FirebaseDatabaseService());
  locator.registerLazySingleton<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource());
  locator.registerLazySingleton<IAUthRepository>(() => AuthRepository());
}
