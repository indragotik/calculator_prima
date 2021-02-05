import 'package:flutter/material.dart';
import 'package:test_calculator/util/constants.dart';

class StandarText {
  static label(judul, fontsize, [Color color]) {
    return Text(
      '$judul',
      textAlign: TextAlign.left,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: fonts,
          fontWeight: FontWeight.bold,
          color: color??Colors.black),
    );
  }

  static labelCustom(judul, fontsize, {Color color, FontWeight fontWeight, TextAlign textAlign, FontStyle fontStyle}) {
    return Text(
      '$judul',
      textAlign: textAlign??TextAlign.left,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: fonts,
          fontWeight: fontWeight??FontWeight.bold,
          color: color??Colors.black,
        fontStyle: fontStyle??FontStyle.normal
      ),
    );
  }

  static labelCenter(judul, fontsize, [Color color]) {
    return Text(
      '$judul',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fonts,
        fontWeight: FontWeight.bold,
        color: color??Colors.black
      ),
    );
  }
}
