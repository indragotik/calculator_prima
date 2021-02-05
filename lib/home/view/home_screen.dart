import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:test_calculator/about/view/about_screen.dart';
import 'package:test_calculator/calculator/provider/calculator_provider.dart';
import 'package:test_calculator/calculator/view/calculator_screen.dart';
import 'package:test_calculator/home/provider/home_provider.dart';

class HomeScreen extends StatelessWidget {

  final List<Widget> _container = [
    new CalculatorScreen(),
    new AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, load, _) => _container[load.menuIndex],
      ),
      bottomNavigationBar: _buildMenuNavigation(context, scaler),
    );
  }

  Widget _buildMenuNavigation(BuildContext context, ScreenScaler scaler){
    return BottomAppBar(
      child: Container(
        height: scaler.getHeight(7),
        padding: scaler.getPadding(0, 0),
        decoration: BoxDecoration(
          // border: Border(top: BorderSide(color: Colors.black12)),
          color: Colors.white70
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                HomeProvider load = Provider.of<HomeProvider>(context, listen: false);
                load.menuIndex = 0;

                CalculatorProvider loadC = Provider.of<CalculatorProvider>(context, listen: false);
                loadC.clear();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.calculate, size: scaler.getTextSize(18), color: (Provider.of<HomeProvider>(context).menuIndex==0)? Colors.blue : Colors.grey,),
                  Text("Home", style: TextStyle(fontSize: scaler.getTextSize(10), color: (Provider.of<HomeProvider>(context).menuIndex==0)? Colors.blue : Colors.black), textAlign: TextAlign.center,)
                ],
              ),
            ),

            InkWell(
              onTap: () {
                HomeProvider load = Provider.of<HomeProvider>(context, listen: false);
                load.menuIndex = 1;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.person, size: scaler.getTextSize(18), color: (Provider.of<HomeProvider>(context).menuIndex==1)? Colors.blue : Colors.grey,),
                  Text("Profile", style: TextStyle(fontSize: scaler.getTextSize(10), color: (Provider.of<HomeProvider>(context).menuIndex==1)? Colors.blue : Colors.black), textAlign: TextAlign.center,)
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}