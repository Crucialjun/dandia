import 'package:dandia/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dandia',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(Brightness.light),
        darkTheme: AppTheme.themeData(Brightness.dark),
        home: const Scaffold(
          body: Center(child: Text("Dandia")),
        ));
  }
}
