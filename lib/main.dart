import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_calculator/calculator/provider/calculator_provider.dart';
import 'package:test_calculator/home/provider/home_provider.dart';
import 'package:test_calculator/home/view/home_screen.dart';
import 'package:test_calculator/util/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildStatelessWidget>[
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
        ChangeNotifierProvider<CalculatorProvider>(create: (context) => CalculatorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: titleApp,
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: HomeScreen(),
      ),
    );
  }
}