import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:test_calculator/util/palette.dart';
import 'package:test_calculator/widget/StandarText.dart';

class ButtonColor extends StatelessWidget {
  final ScreenScaler scaler;
  final String label;
  final GestureTapCallback onPressed;
  final IconData icon;
  final String image;
  final Color color;
  final Color lableColor;
  final Color iconColor;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  const ButtonColor({Key key, @required this.scaler, @required this.label, @required this.color, @required this.onPressed, this.icon, this.image, this.fontWeight, this.lableColor, this.iconColor, this.width, this.height, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin?? scaler.getMarginLTRB(0, 0, 0, 2),
      width: width?? scaler.getWidth(71),
      height: height?? scaler.getWidth(10),
      child: RaisedButton(
        onPressed: onPressed,
        child: image!=null? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image!=null? Image.asset(image) : Container(),
            image!=null? SizedBox(width: 10,) : Container(),
            StandarText.labelCustom(label, scaler.getTextSize(11), fontWeight: fontWeight, color: lableColor)
          ],
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon!=null? Icon(icon, color: iconColor?? Palette.primary1, size: scaler.getTextSize(18),) : Container(),
            icon!=null? SizedBox(width: 10,) : Container(),
            StandarText.labelCustom(label, scaler.getTextSize(11), fontWeight: fontWeight, color: lableColor)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: color??Palette.primary1,
      ),
    );
  }
}