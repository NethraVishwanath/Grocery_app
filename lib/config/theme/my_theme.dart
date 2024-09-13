import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static ThemeData getThemeData({required bool isLight}) {
    return ThemeData(
      useMaterial3: true,
      // Primary color (app bar, tabs, etc.)
      colorScheme: ColorScheme(
        brightness: isLight ? Brightness.light : Brightness.dark,
        primary: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
        onPrimary: isLight ? LightThemeColors.onprimaryColor : DarkThemeColors.onprimaryColor,
        secondary: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
        onSecondary: isLight ? LightThemeColors.onaccentColor : DarkThemeColors.onaccentColor,
        surface: isLight ? LightThemeColors.surface : DarkThemeColors.surface,
        onSurface: isLight ? LightThemeColors.onsurface : DarkThemeColors.onsurface,
        background: isLight ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor,
        onBackground: isLight ? LightThemeColors.onbackground : DarkThemeColors.onbackground,
        error: isLight ? LightThemeColors.error : DarkThemeColors.error,
        onError: isLight ? LightThemeColors.onerror : DarkThemeColors.onerror,
        // Add other ColorScheme properties if needed
      ),
      canvasColor: isLight ? LightThemeColors.canvasColor : DarkThemeColors.canvasColor,
      cardColor: isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,
      dividerColor: isLight ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor,
      scaffoldBackgroundColor: isLight ? LightThemeColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor,
      hintColor: isLight ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor,

      // Progress bar theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
      ),

      // AppBar theme
      appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),

      // ElevatedButton theme
      elevatedButtonTheme: MyStyles.getElevatedButtonTheme(isLightTheme: isLight),

      // Text theme
      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),

      // Chip theme
      chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

      // Icon theme
      iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
    );
  }

  /// Update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static void changeTheme() {
    // Check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();
    // Store the new theme mode on shared preferences
    MySharedPref.setThemeIsLight(!isLightTheme);
    // Let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// Check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
