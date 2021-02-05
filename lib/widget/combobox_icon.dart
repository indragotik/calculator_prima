import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:test_calculator/util/palette.dart';
import 'package:test_calculator/widget/StandarText.dart';

class ComboboxIcon extends StatefulWidget {
  final List<DataItem> data;
  final List<DropdownMenuItem<String>> dataCustom;
  final String value;
  final VoidCallback onTap;
  final ValueChanged<String> onChanged;
  final IconData iconData;
  final String title;
  final bool isBorder;
  final Widget iconRight;
  final bool isLable;
  final EdgeInsetsGeometry margin;

  ComboboxIcon({@required this.data, @required this.value, @required this.onChanged, this.onTap, this.iconData, this.title, this.isBorder = false, this.dataCustom, this.iconRight, this.isLable = false, this.margin});

  @override
  _ComboboxIconState createState() => _ComboboxIconState();
}

class _ComboboxIconState extends State<ComboboxIcon> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Container(
      margin: widget.margin?? scaler.getMarginLTRB(0, 0, 0, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.isLable? StandarText.labelCustom(widget.title, scaler.getTextSize(10), fontWeight: FontWeight.normal) : Container(),
          widget.isLable? SizedBox(height: 5,) : Container(),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: widget.isBorder? Border.all(color: Palette.primary2, width: 2) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: (widget.iconData!=null)? scaler.getPaddingLTRB(5, 0, 0, 0) : scaler.getPaddingLTRB(2, 0, 0, 0),
                  // margin: (widget.iconData!=null)? EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0) : scaler.getMarginLTRB(2.7, 1, 2.7, 0),
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    icon: widget.iconRight??null,
                    items: widget.dataCustom?? widget.data.map(
                      (data) {
                        return DropdownMenuItem(
                          value: data.id,
                          child: Text(data.name),
                        );
                      },
                    ).toList(),
                    value: widget.value,
                    onTap: widget.onTap,
                    onChanged: (value) => widget.onChanged(value),
                    hint: widget.title!=null? StandarText.labelCustom(widget.title, scaler.getTextSize(10), fontWeight: FontWeight.normal) : null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                (widget.iconData!=null)? Container(
                  // margin: EdgeInsets.only(top: 10, left: 18.0),
                  width: 40,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                    )
                  ),
                  child: Icon(
                    widget.iconData,
                    color: Palette.primary2,
                    size: 20.0,
                  ),
                ) : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataItem {
  DataItem({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
    id: json["id"],
    name: json["name"],
  );
}
