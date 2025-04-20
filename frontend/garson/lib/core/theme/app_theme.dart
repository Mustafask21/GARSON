import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryColor,
    
    // Appbar teması
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textWhite),
      titleTextStyle: TextStyle(
        color: AppColors.textWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    
    // Buton teması
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPurple,
        foregroundColor: AppColors.textWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
    ),
    
    // Input decoration teması
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.textGray.withOpacity(0.5)),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      hintStyle: TextStyle(
        color: AppColors.textGray.withOpacity(0.7),
      ),
    ),
    
    // Text teması
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textWhite,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.textWhite,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: AppColors.textWhite,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textWhite,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textWhite,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.textGray,
        fontSize: 12,
      ),
    ),
  );
} 