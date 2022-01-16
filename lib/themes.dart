import 'package:flutter/material.dart';

class AppTheme {

  IconData icon;
  ThemeData themeData;
  String name;

  AppTheme({required this.icon, required this.themeData, required this.name});

  factory AppTheme.fromName(String? themeName){

    if (themeName == AppThemes.light.name) {
      return AppThemes.light;
    }

    if (themeName == AppThemes.dark.name) {
      return AppThemes.dark;
    }

    if(themeName == AppThemes.phase10.name) {
      return AppThemes.phase10;
    }

    // initial theme
    else {
      return AppThemes.phase10;
    }

  }
}

class AppThemes {
  static final AppTheme light = AppTheme(
    name: 'Light',
    icon: Icons.brightness_5,
    themeData: ThemeData.light(),
  );

  static final AppTheme phase10 = AppTheme(
    name: 'Phase 10',
    icon: Icons.api,
    themeData: ThemeData.light().copyWith(
        colorScheme:
        ThemeData.light().colorScheme.copyWith(primary: Colors.green)),
  );

  static final AppTheme dark = AppTheme(
    name: 'Dark',
    icon: Icons.brightness_2_rounded,
    themeData: ThemeData.dark().copyWith(
        colorScheme:
        ThemeData.dark().colorScheme.copyWith(primary: Colors.amber)),
  );

  static List<AppTheme> getAllThemes() {
    List<AppTheme> themes = [];
    themes.add(light);
    themes.add(dark);
    themes.add(phase10);
    return themes;
  }
}
