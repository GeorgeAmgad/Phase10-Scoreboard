import 'package:flutter/material.dart';
import 'package:phase_10_score_tracker/views/home.dart';
import 'package:phase_10_score_tracker/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(ChangeNotifierProvider(
      create: (BuildContext context) =>
          ThemeProvider(themeName: prefs.getString("theme")),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.getTheme,
        home: HomePage(title: 'Scoreboards'),
      );
    });
  }
}
