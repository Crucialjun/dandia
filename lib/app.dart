import 'package:dandia/core/routes.dart';
import 'package:dandia/core/themes/app_theme.dart';
import 'package:dandia/features/auth/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) => MaterialApp(
        onGenerateRoute: (settings) => Routes.generateRoute(settings),
          title: 'Dandia',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData(Brightness.light),
          darkTheme: AppTheme.themeData(Brightness.dark),
          home: child),
      child: const SignUpScreen(),
    );
  }
}
