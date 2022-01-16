import 'package:flutter/material.dart';
import 'package:phase_10_score_tracker/shared-preferences.dart';
import 'package:phase_10_score_tracker/theme-provider.dart';
import 'package:phase_10_score_tracker/views/home.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  return runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(
          themeName: PreferenceUtils.getString(PrefsKeys.appTheme)),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getSelectedTheme.themeData,
        home: HomePage(title: 'Scoreboards'),
      );
    });
  }
}
