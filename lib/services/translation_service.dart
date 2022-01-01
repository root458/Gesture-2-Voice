import 'package:translator/translator.dart';

class TranslationService {
  static Future<String> translateMessage(
      {required String message,
      required String fromLanguageCode,
      required String tOLanguageCode}) async {
    final translation = await GoogleTranslator()
        .translate(message, from: fromLanguageCode, to: tOLanguageCode);

    return translation.text;
  }
}
