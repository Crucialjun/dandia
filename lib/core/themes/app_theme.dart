import 'package:dandia/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData(Brightness brightness) => ThemeData(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: brightness,
      
    ),
    useMaterial3: true,
    

  );
}
