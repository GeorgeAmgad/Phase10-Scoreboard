import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor/moor.dart' as moor;
import 'package:phase_10_score_tracker/database/database.dart';
import 'package:phase_10_score_tracker/model/scoreboard.dart';
import 'package:phase_10_score_tracker/views/widgets/misc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/sliver_header.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SliverAppBarSnapState createState() => _SliverAppBarSnapState();
}

class _SliverAppBarSnapState extends State<HomePage> {
  final dao = AppDatabase().scoreboardsDao;

  final _controller = ScrollController();

  double get maxHeight => 226 + MediaQuery.of(context).padding.top;

  double get minHeight => kToolbarHeight + MediaQuery.of(context).padding.top;

  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // await DatabaseHelper.instance.addMode(Mode(name: "modern"));
          // await ScoreboardCL.addScoreboard(
          //     Scoreboard(title: "board 5", mode: Mode(id: 2, name: 'twist')));

          await dao.insertBoard(ScoreboardsCompanion(
              modeId: moor.Value(2),
              title: moor.Value("Midnight game"),
              creationDate: moor.Value(DateTime.now())));

          setState(() {
            isEmpty = !isEmpty;
          });
        },
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (_) {
          _snapAppbar();
          return false;
        },
        child: _buildScrollView(),
      ),
    );
  }

  // Card _buildCard(int index) {
  //   return Card(
  //     elevation: 4,
  //     margin: EdgeInsets.only(left: 12, right: 12, top: 12),
  //     child: Container(
  //       margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
  //       child: Text("Item $index"),
  //     ),
  //   );
  // }

  void _snapAppbar() {
    final scrollDistance = maxHeight - minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset =
          _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 350), curve: Curves.easeIn));
    }
  }

  StreamBuilder<List<ScoreboardWithMode>> _buildScrollView() {
    final appBar = SliverAppBar(
      pinned: true,
      stretch: true,
      collapsedHeight: 65,
      flexibleSpace:
          // FlexibleSpaceBar(
          //   title: Text("Scoreboards"),
          // ),

          SliverHeader(
              maxHeight: maxHeight,
              minHeight: minHeight,
              headerText: "Scoreboards"),
      expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
    );
    final emptyList = SliverFillRemaining(
      hasScrollBody: false,
      child: buildEmptyCenterText("Tap + to created a new scoreboard"),
    );

    return StreamBuilder<List<ScoreboardWithMode>>(
        stream: dao.scoreboardsWithMode(),
        builder: (context, snapshot) {
          Widget sliverList;
          if (!snapshot.hasData) {
            sliverList = SliverToBoxAdapter(
              child: Center(
                heightFactor: 16,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            sliverList = snapshot.data!.isEmpty
                ? emptyList
                : _buildScoreboardsList(snapshot.data!);
          }

          return CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            slivers: [
              appBar,
              sliverList
            ],
          );
        });
  }

  SliverList _buildScoreboardsList(List<ScoreboardWithMode> boardList) {
    return SliverList(
        delegate: SliverChildListDelegate(boardList.map((entry) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Theme.of(context).canvasColor,
            icon: Icons.delete,
            onTap: () => dao.deleteBoard(entry.scoreboard),
          )
        ],
        child: Card(
          elevation: 2,
          child: ListTile(
            contentPadding: EdgeInsets.only(top: 8, left: 18, right: 18, bottom: 9),
            title: Text(
              entry.scoreboard.title,
              style: GoogleFonts.pangolin(
                  fontSize: 26,
                  letterSpacing: 0.5
              ),
            ),
            isThreeLine: true,
            subtitle: Text(
                "Mode: ${entry.mode.name}\nRound: ${entry.scoreboard.round}",
            style: TextStyle(fontSize: 15),),
            trailing: Text(_parseDate(entry.scoreboard.creationDate)),
          ),
        ),
      );
    }).toList()));
  }
}

String _parseDate(DateTime dateTime) {
  var array = dateTime.toString().split('-');
  // extract the day and remove the trailing time
  var day = array[2].split(' ')[0];
  // extract month
  var month = array[1];
  return "$day/$month";
}
