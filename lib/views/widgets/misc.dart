import 'package:flutter/material.dart';




Center buildEmptyCenterText(String text) {
  return Center(
      child: Opacity(
        opacity: 0.5,
        child: Text(text, textAlign: TextAlign.center),
      ));
}
