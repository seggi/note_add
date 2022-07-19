import 'package:flutter/material.dart';

class NavigationPath extends ChangeNotifier {
  String _screenPath = '/';

  String get screenPath => _screenPath;

  void changeScreen(String screenPath) {
    print("::::");
    _screenPath = screenPath;
    notifyListeners();
  }
}
