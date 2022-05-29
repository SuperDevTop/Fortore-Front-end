import 'package:flutter/cupertino.dart';
import 'package:fortore/utils/SharedPref.dart';

class LanguageChangeNotifierProvider with ChangeNotifier{
  SharedPref sharedPref = SharedPref();
  Locale? _locale;

  set locale(Locale value) {
    _locale = value;
  }

 Locale? get getLocate {
    return _locale;
  }


  void changeLocale(String code) async {
    _locale = Locale(code);
    sharedPref.saveSingleString("lang", code);
    notifyListeners();
  }
}