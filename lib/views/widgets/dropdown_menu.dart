import 'package:flutter/material.dart';
import 'package:phase_10_score_tracker/theme-provider.dart';
import 'package:phase_10_score_tracker/themes.dart';
import 'package:provider/provider.dart';

import '../../theme-provider.dart';

enum Options { RULES, THEMES, ABOUT }

class DropDownMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Options>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 16,
      offset: Offset(0, 64),
      icon: Icon(Icons.more_vert, color: Colors.white),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
        PopupMenuItem<Options>(
            value: Options.RULES,
            child: ListTile(
              title: Text("Game rules"),
              leading: Icon(Icons.rule),
            )),
        PopupMenuItem<Options>(
            value: Options.THEMES,
            child: ListTile(
              title: Text("Theme"),
              leading: Icon(Icons.dark_mode),
            )),
        PopupMenuItem<Options>(
            value: Options.ABOUT, child: ListTile(
            title: Text("About"),
        leading: Icon(Icons.info_outline),)),
      ],
      onSelected: (Options result) {
        switch (result) {
          case Options.RULES:
            {}
            break;

          case Options.THEMES:
            _showThemeBottomSheet(context);
            break;

          case Options.ABOUT:
            {}
            break;

          default:
            {
              //  TODO: error
            }
            break;
        }
      },
    );
  }

  void _showThemeBottomSheet(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(top: 12),
            child: DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              maxChildSize: 0.25,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                List<AppTheme> themes = AppThemes.getAllThemes();
                return ListView.separated(
                  controller: scrollController,
                  itemCount: themes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(themes[index].icon),
                      title: Text('${themes[index].name}'),
                      onTap: () {
                        themeProvider.setTheme(themes[index].name);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              },
            ),
          );
        });
  }
}
