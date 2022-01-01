import 'package:flutter/material.dart';
import 'package:gesture_to_voice/screens/components/languages.dart';

class DataService with ChangeNotifier {
  // Data
  String _wordsToDisplay = '';
  //Initialize language to English
  late Language _language;

  // Words getter and setter
  String get wordsToDisplay => _wordsToDisplay;

  void setWordsToDisplay(String words) {
    _wordsToDisplay = words;
    notifyListeners();
  }

  // Language getter and setter
  Language get currentLanguage => _language;

  void setLanguage(Language language) {
    _language = language;
    notifyListeners();
  }
}
