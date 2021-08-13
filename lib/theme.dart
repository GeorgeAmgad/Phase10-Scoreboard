import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;

  // TODO: implement selected theme
  ThemeData light = ThemeData.light().copyWith(primaryColor: Colors.green);
  ThemeData dark = ThemeData.dark().copyWith(primaryColor: Colors.blueGrey);

  final List<String> themeNames = <String>['Light', 'Dark', 'Test'];
  final List<IconData> themeIcons = <IconData>[
    Icons.brightness_5,
    Icons.brightness_2_rounded,
    Icons.card_giftcard
  ];

  ThemeProvider({String? themeName}) {
    if (themeName != null) {
      _selectedTheme = themeFactory(themeName);
    } else {
      // initial theme
      _selectedTheme = light;
    }
  }

  // Future<void> swapTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (_selectedTheme == dark) {
  //     _selectedTheme = light;
  //     prefs.setBool("isDark", false);
  //   } else {
  //     _selectedTheme = dark;
  //     prefs.setBool("isDark", true);
  //   }
  //   notifyListeners();
  // }

  ThemeData themeFactory(String themeName) {
    switch (themeName) {
      case 'Light':
        return light;
      case 'Dark':
        return dark;
      default:
        // TODO: throw error
        return ThemeData.light();
    }
  }

  Future<void> setTheme(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedTheme = themeFactory(themeName);
    notifyListeners();
    prefs.setString("theme", themeName);
  }

  ThemeData get getTheme => _selectedTheme;
}
