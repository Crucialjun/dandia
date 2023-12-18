import 'package:dandia/app.dart';
import 'package:dandia/locator.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}
