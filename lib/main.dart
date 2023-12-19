import 'package:dandia/app.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/core/models/app_user_model.dart';
import 'package:dandia/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();

  Hive.registerAdapter(AppUserModelAdapter());
  runApp(const MyApp());
}
