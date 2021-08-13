import 'package:flutter/material.dart';
import 'package:phase_10_score_tracker/database_helper.dart';
import 'package:phase_10_score_tracker/model/mode.dart';
import 'package:phase_10_score_tracker/views/widgets/misc.dart';

import 'widgets/sliver_header.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SliverAppBarSnapState createState() => _SliverAppBarSnapState();
}

class _SliverAppBarSnapState extends State<HomePage> {
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
          await DatabaseHelper.instance.addMode(Mode(name: "yalaaaaaa"));
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

  Card _buildCard(int index) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Text("Item $index"),
      ),
    );
  }

  void _snapAppbar() {
    final scrollDistance = maxHeight - minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset =
          _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 350), curve: Curves.easeIn));
    }
  }

  FutureBuilder<List<Mode>> _buildScrollView() {
    final appBar = SliverAppBar(
      pinned: true,
      stretch: true,
      collapsedHeight: 65,
      flexibleSpace: SliverHeader(
          maxHeight: maxHeight,
          minHeight: minHeight,
          headerText: "Scoreboards"),
      expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
    );
    final emptyList = SliverFillRemaining(
        hasScrollBody: false,
        child: buildEmptyCenterText("Tap + to created a new scoreboard"),
      );

    return FutureBuilder<List<Mode>>(
        future: DatabaseHelper.instance.getModes(),
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
            slivers: [appBar, sliverList],
          );
        });
  }

  SliverList _buildScoreboardsList(List<Mode> modesList) {
    return SliverList(
        delegate: SliverChildListDelegate(modesList.map((mode) {
      return Card(
        elevation: 4,
        margin: EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Text(mode.name),
        ),
      );
    }).toList()));
  }

}
