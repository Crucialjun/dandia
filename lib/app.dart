import 'package:dandia/core/constants/hive_box_names.dart';
import 'package:dandia/core/constants/hive_storage_keys.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/core/models/app_user_model.dart';
import 'package:dandia/core/routes.dart';
import 'package:dandia/core/themes/app_theme.dart';
import 'package:dandia/features/auth/presentation/sign_in/bloc/signin_bloc.dart';
import 'package:dandia/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dandia/features/home/presentation/bloc/home_bloc.dart';
import 'package:dandia/features/home/presentation/home_view.dart';
import 'package:dandia/services/firebase_auth_service/i_firebase_auth_service.dart';
import 'package:dandia/services/local_storage_service/i_local_storage_service.dart';

import 'package:dandia/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authService = locator<IFirebaseAuthService>();
    final localStorage = locator<ILocalStorageService>();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) => MaterialApp(
          onGenerateRoute: (settings) => Routes.generateRoute(settings),
          navigatorKey: NavigationService.navigatorKey,
          scaffoldMessengerKey: NavigationService.snackbarKey,
          title: 'Dandia',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData(Brightness.light),
          darkTheme: AppTheme.themeData(Brightness.dark),
          home: child),
      child: BlocProvider(
          create: (context) => SigninBloc(),
          child: FutureBuilder<bool>(
            future: authService.currentUserLoginStatus.call(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Logger().i("The snapshot data is  ${snapshot.data}");
                if (snapshot.data == false) {
                  return const SignInView();
                } else {
                  return FutureBuilder(
                    future: localStorage.read(
                        boxName: HiveBoxNames.userBox,
                        key: HiveStorageKeys.userProfile),
                    builder: (context, snapshot) {
                      Logger().i("The snapshot data  2 is  ${snapshot.data}");
                      if (snapshot.hasData) {
                        return BlocProvider(
                          create: (context) => HomeBloc(),
                          child: HomeView(
                            user: snapshot.data as AppUserModel,
                          ),
                        );
                      } else {
                        return const SignInView();
                      }
                    },
                  );
                }
              } else {
                return const SignInView();
              }
            },
          )),
    );
  }
}
