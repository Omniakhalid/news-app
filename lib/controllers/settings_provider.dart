import 'package:flutter/material.dart';
class SettingsProvider with ChangeNotifier{
  String locale;
  SettingsProvider(): locale = 'en';
  void changeLocale(String locale){
    this.locale = locale;
    notifyListeners();
  }
}