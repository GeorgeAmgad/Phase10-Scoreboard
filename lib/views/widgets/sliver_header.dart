import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dropdown_menu.dart';

class SliverHeader extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  final String headerText;

  const SliverHeader(
      {Key? key,
      required this.maxHeight,
      required this.minHeight,
      required this.headerText})
      : super(key: key);

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(fit: StackFit.expand, children: [
          // _buildImage(),
          _buildGradient(animation),
          _buildTitle(context, animation, headerText),
        ]);
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Container _buildTitle(
      BuildContext context, Animation<double> animation, String text) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 52, left: 18),
              child: Text(
                text,
                style: GoogleFonts.caveat(
                    fontSize:
                        Tween<double>(begin: 22, end: 68).evaluate(animation),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            )),
        Align(
          alignment: AlignmentTween(
                  begin: Alignment.bottomRight, end: Alignment.bottomRight)
              .evaluate(animation),
          child: Container(
            margin: EdgeInsets.only(bottom: 7, right: 6),
            child: DropDownMenu(),
          ),
        )
      ],
    ));
  }

  Container _buildGradient(Animation<double> animation) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorTween(begin: Colors.black26, end: Colors.black12)
                .evaluate(animation)!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
