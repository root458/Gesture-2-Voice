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
// Available languages
// [ko-KR, mr-IN, ru-RU, zh-TW, hu-HU, th-TH, ur-PK, nb-NO, da-DK, tr-TR, 
// et-EE, bs, sw, pt-PT, vi-VN, en-US, sv-SE, ar, su-ID, bn-BD, gu-IN, kn-IN,
// el-GR, hi-IN, fi-FI, km-KH, bn-IN, fr-FR, uk-UA, en-AU, nl-NL, fr-CA, sr,
// pt-BR, ml-IN, si-LK, de-DE, ku, cs-CZ, pl-PL, sk-SK, fil-PH, it-IT, ne-NP,
// ms-MY, hr, en-NG, zh-CN, es-ES, cy, ta-IN, ja-JP, sq, yue-HK, en-IN, es-US,
// jv-ID, la, id-ID, te-IN, ro-RO, ca, en-GB]
