import 'package:dandia/app.dart';
import 'package:dandia/core/locator.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}
