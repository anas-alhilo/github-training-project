import 'package:flutter/material.dart';
import 'package:flutter1_project/database/prefs/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier {
  String language =
      SharedPrefController().getValue<String>(PrefKeys.language.name) ?? 'en';

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(lanCode: language);
    notifyListeners();
  }
}
