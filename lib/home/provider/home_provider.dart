import 'package:flutter/widgets.dart';

class HomeProvider with ChangeNotifier {
  int _menuIndex = 0;

  int get menuIndex => _menuIndex;

  set menuIndex(int val) {
    _menuIndex = val;
    notifyListeners();
  }
}