import 'package:flutter/material.dart';
import 'package:phase_10_score_tracker/theme.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

enum Options { rules, themes, about }

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
            value: Options.rules,
            child: ListTile(
              title: Text("Game rules"),
              leading: Icon(Icons.rule),
            )),
        PopupMenuItem<Options>(
            value: Options.themes,
            child: ListTile(
              title: Text("Theme"),
              leading: Icon(Icons.dark_mode),
            )),
        PopupMenuItem<Options>(
            value: Options.about, child: ListTile(
            title: Text("About"),
        leading: Icon(Icons.info_outline),)),
      ],
      onSelected: (Options result) {
        switch (result) {
          case Options.rules:
            {}
            break;

          case Options.themes:
            _showThemeBottomSheet(context);
            break;

          case Options.about:
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
          List<String> entries = themeProvider.themeNames;
          List<IconData> icons = themeProvider.themeIcons;
          return Container(
            margin: EdgeInsets.only(top: 12),
            child: DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              maxChildSize: 0.25,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ListView.separated(
                  controller: scrollController,
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(icons[index]),
                      title: Text('${entries[index]}'),
                      onTap: () {
                        try {
                          themeProvider.setTheme(entries[index]);
                        } catch (e) {
                          print("something happened!");
                        }
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
