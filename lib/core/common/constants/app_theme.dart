import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/extensions/color_extension.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        fontFamily: 'Avenir',
        primarySwatch: AppColors.primary.toMaterialColor(),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: false,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary.withOpacity(0.2),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: AppColors.grey500, letterSpacing: 0.4),
          displayMedium: TextStyle(color: AppColors.grey500, letterSpacing: 0.4),
          bodyMedium: TextStyle(color: AppColors.grey500, letterSpacing: 0.4),
          titleMedium: TextStyle(color: AppColors.grey500, letterSpacing: 0.4),
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.background,
        canvasColor: AppColors.primary,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: AppColors.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          isDense: false,
          prefixIconColor: AppColors.grey50,
          labelStyle: const TextStyle(
            color: AppColors.grey50,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey50.withOpacity(0.3),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.grey50.withOpacity(0.3),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey50,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.grey50.withOpacity(0.3),
            ),
          ),
          //DISABLE  ------
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.grey50.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          //ERROR  ------
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
        ),
      );
}
