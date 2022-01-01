import 'package:flutter/material.dart';
import 'package:gesture_to_voice/screens/components/languages.dart';

class DataService with ChangeNotifier {
  // Data
  String _wordsToDisplay = '';
  //Initialize language to English
  Language _language = allLanguages[0];

  // Choose language
  String _chooseLanguage = 'Choose Language';
  String get chooseLanguage => _chooseLanguage;
  // Speak
  String _speak = 'Speak';
  String get speak => _speak;

  // Try again
  String _tryAgain = 'Unclear gesture, please try again';
  String get tryAgain => _tryAgain;

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
    switch (language.languageName) {
      case 'English':
        _chooseLanguage = 'Choose Language';
        _speak = 'Speak';
        _tryAgain = 'Unclear gesture, please try again';
        break;
      case 'عربى':
        _chooseLanguage = 'اختر اللغة';
        _speak = 'يتكلم';
        _tryAgain = 'إيماءة غير واضحة ، يرجى المحاولة مرة أخرى';
        break;
      case 'čeština':
        _chooseLanguage = 'Vyber jazyk';
        _speak = 'Mluvit';
        _tryAgain = 'Nejasné gesto, zkuste to prosím znovu';
        break;
      case 'Dansk':
        _chooseLanguage = 'Vælg sprog';
        _speak = 'Tale';
        _tryAgain = 'Uklar bevægelse. Prøv venligst igen';
        break;
      case 'Nederlands':
        _chooseLanguage = 'Kies een taal';
        _speak = 'Spreken';
        _tryAgain = 'Onduidelijk gebaar, probeer het opnieuw';
        break;
      case 'Suomalainen':
        _chooseLanguage = 'Puhua';
        _speak = 'Spreken';
        _tryAgain = 'Epäselvä ele, yritä uudelleen';
        break;
      case 'Français':
        _chooseLanguage = 'Choisissez la langue';
        _speak = 'Parlez';
        _tryAgain = 'Geste peu clair, veuillez réessayer';
        break;
      case 'Deutsch':
        _chooseLanguage = 'Sprache wählen';
        _speak = 'Sprechen';
        _tryAgain = 'Unklare Geste, bitte versuche es noch einmal';
        break;
      case 'Ελληνικά':
        _chooseLanguage = 'Διάλεξε γλώσσα';
        _speak = 'Μιλώ';
        _tryAgain = 'Ασαφής χειρονομία, δοκιμάστε ξανά';
        break;
      case 'Italiano':
        _chooseLanguage = 'Scegli la lingua';
        _speak = 'Parlare';
        _tryAgain = 'Gesto poco chiaro, riprovare';
        break;
      case '日本':
        _chooseLanguage = '言語を選択';
        _speak = '話す';
        _tryAgain = 'ジェスチャーが不明瞭です。もう一度やり直してください';
        break;
      case 'Malaysia':
        _chooseLanguage = 'Pilih Bahasa';
        _speak = 'Cakap';
        _tryAgain = 'Gerak isyarat tidak jelas, sila cuba lagi';
        break;
      case 'Português':
        _chooseLanguage = 'Escolha o seu idioma';
        _speak = 'Falar';
        _tryAgain = 'Gesto pouco claro, por favor tente novamente';
        break;
      case 'русский':
        _chooseLanguage = 'Выберите язык';
        _speak = 'Разговаривать';
        _tryAgain = 'Нечеткий жест, попробуйте еще раз';
        break;
      case 'Español':
        _chooseLanguage = 'Elige lengua';
        _speak = 'Hablar';
        _tryAgain = 'Gesto poco claro, inténtalo de nuevo';
        break;
      case 'Svenska':
        _chooseLanguage = 'Välj språk';
        _speak = 'Tala';
        _tryAgain = 'Otydlig gest, försök igen';
        break;
      default:
        _chooseLanguage = 'Виберіть мову';
        _speak = 'Говоріть';
        _tryAgain = 'Незрозумілий жест, спробуйте ще раз';
        break;
    }
    notifyListeners();
  }
}
