import 'package:flutter/material.dart';
import 'package:phase_10_score_tracker/shared-preferences.dart';
import 'package:phase_10_score_tracker/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late AppTheme _selectedTheme;

  ThemeProvider({String? themeName}) {
    _selectedTheme = AppTheme.fromName(themeName);
  }

  Future<void> setTheme(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedTheme = AppTheme.fromName(themeName);
    notifyListeners();
    prefs.setString(PrefsKeys.appTheme, themeName);
  }

  AppTheme get getSelectedTheme => _selectedTheme;
}


