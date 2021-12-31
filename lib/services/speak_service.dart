import 'package:flutter_tts/flutter_tts.dart';

class SpeakService {
  final FlutterTts _flutterTts = FlutterTts();

  Future speak({String words = '', String langej = ''}) async {
    // await _flutterTts.isLanguageInstalled('sw').then((value) => print(value));
    // await _flutterTts.getLanguages.then((value) => print(value));
    await _flutterTts.setLanguage(langej);
    await _flutterTts.setPitch(1);
    await _flutterTts.speak(words);
  }
}
