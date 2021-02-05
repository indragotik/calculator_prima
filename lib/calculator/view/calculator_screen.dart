import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:test_calculator/calculator/provider/calculator_provider.dart';
import 'package:test_calculator/util/constants.dart';
import 'package:test_calculator/util/palette.dart';
import 'package:test_calculator/widget/StandarText.dart';
import 'package:test_calculator/widget/button_color.dart';
import 'package:test_calculator/widget/combobox_icon.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: StandarText.label("Calculator", scaler.getTextSize(12), Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: scaler.getMarginLTRB(3, 2, 3, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<CalculatorProvider>(
                      builder: (context, load, _) => Container(
                        width: scaler.getWidth(30),
                        margin: scaler.getMarginLTRB(0, 1, 1, 0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                          return TextFormField(
                            controller: load.angka1,
                            validator: (value) {
                              int len = value.length;
                              if (len == 0) {
                                return "Angka ke 1 tidak boleh kosong";
                              }
                              return null;
                            },
                            // onChanged: (val) => load.angka1 = int.parse(val),
                            style: TextStyle(color: Colors.black54),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '0',
                              labelText: 'Angka1',
                              labelStyle: TextStyle(color: Colors.black54, fontSize: scaler.getTextSize(10), fontFamily: fonts, fontWeight: FontWeight.bold),
                              fillColor: Colors.black54,
                              errorStyle: TextStyle(color: Palette.primary2),
                              contentPadding: scaler.getPaddingLTRB(3, 0, 0, 0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Palette.primary2,
                                  width: 2.0
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Palette.primary2,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Palette.error,
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ),

                    Consumer<CalculatorProvider>(
                      builder: (context, load, _) => Container(
                        width: scaler.getWidth(12),
                        child: ComboboxIcon(
                          title: "plh",
                          iconRight: Container(),
                          margin: scaler.getMarginLTRB(0, 1, 1, 0),
                          isBorder: true,
                          data: [],
                          dataCustom: load.listOperator.map((data) {
                            // print("nilai : ${data.nilai}");
                            return DropdownMenuItem(
                              // value: data.nilai,
                              value: data,
                              child: StandarText.labelCustom(data, scaler.getTextSize(10), color: Colors.black54, textAlign: TextAlign.center),
                            );
                          }).toList(),
                          value: load.selectOperator,
                          onChanged: (val) => load.selectOperator = val
                        ),
                      ),
                    ),

                    Consumer<CalculatorProvider>(
                      builder: (context, load, _) => Container(
                        width: scaler.getWidth(30),
                        margin: scaler.getMarginLTRB(0, 1, 1, 0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                          return TextFormField(
                            controller: load.angka2,
                            validator: (value) {
                              int len = value.length;
                              if (len == 0) {
                                return "Angka ke 2 tidak boleh kosong";
                              }
                              return null;
                            },
                            // onChanged: (val) => load.angka2 = int.parse(val),
                            style: TextStyle(color: Colors.black54),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '0',
                              labelText: 'Angka2',
                              labelStyle: TextStyle(color: Colors.black54, fontSize: scaler.getTextSize(10), fontFamily: fonts, fontWeight: FontWeight.bold),
                              fillColor: Colors.black54,
                              errorStyle: TextStyle(color: Palette.primary2),
                              contentPadding: scaler.getPaddingLTRB(3, 0, 0, 0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Palette.primary2,
                                  width: 2.0
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Palette.primary2,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Palette.error,
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ),
                  ],
                ),
              ),

              Consumer<CalculatorProvider>(
                builder: (context, load, _) => Container(
                  margin: scaler.getMarginLTRB(0, 2, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonColor(
                        scaler: scaler, 
                        width: scaler.getWidth(20),
                        height: scaler.getWidth(7),
                        margin: scaler.getMarginLTRB(0, 0, 0, 1),
                        label: "Clear",
                        fontWeight: FontWeight.normal,
                        lableColor: Colors.white,
                        color: Palette.primary2,
                        onPressed: () => load.clear()
                      ),
                      SizedBox(width: 20,),
                      ButtonColor(
                        scaler: scaler, 
                        width: scaler.getWidth(20),
                        height: scaler.getWidth(7),
                        margin: scaler.getMarginLTRB(0, 0, 0, 1),
                        label: "Hitung",
                        fontWeight: FontWeight.normal,
                        lableColor: Colors.white,
                        color: Palette.primary2,
                        onPressed: () => load.hitung()
                      ),
                    ],
                  ),
                )
              ),

              Consumer<CalculatorProvider>(
                builder: (context, load, _) => Center(
                  child: Container(
                    width: scaler.getWidth(73),
                    margin: scaler.getMarginLTRB(0, 1, 0, 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Palette.primary2, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: scaler.getPaddingLTRB(3, 1, 2, 1),
                    child: StandarText.labelCustom(load.hasil!=""? load.hasil : "Hasil", scaler.getTextSize(10), color: Colors.black54),
                  ),
                )
              ),

              Divider(color: Colors.black45,),

              StandarText.label("List Angka Prima", scaler.getTextSize(12)),

              Consumer<CalculatorProvider>(
                builder: (context, load, _) =>Container(
                  margin: scaler.getMarginLTRB(0, 1, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: load.listPrima.map<Widget>((prima) => 
                      StandarText.labelCustom(prima+" angka Prima", scaler.getTextSize(11), fontWeight: FontWeight.normal)
                    ).toList(),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}