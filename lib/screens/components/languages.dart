class Language {
  String assetPath;
  String translationCode;
  String ttsCode;
  String languageName;
  Language(
      {required this.translationCode,
      required this.ttsCode,
      required this.languageName,
      required this.assetPath});
}

// Language code for translation and TTS

List<Language> allLanguages = [
  Language(
      translationCode: 'en',
      assetPath: 'assets/flags/GB.png',
      ttsCode: 'en-GB',
      languageName: 'English'),
  Language(
      translationCode: 'ar',
      assetPath: 'assets/flags/AR.png',
      ttsCode: 'ar',
      languageName: 'عربى'),
  Language(
      translationCode: 'cs',
      assetPath: 'assets/flags/CZ.png',
      ttsCode: 'cs-CZ',
      languageName: 'čeština'),
  Language(
      translationCode: 'da',
      assetPath: 'assets/flags/DK.png',
      ttsCode: 'da-DK',
      languageName: 'Dansk'),
  Language(
      translationCode: 'nl',
      assetPath: 'assets/flags/NL.png',
      ttsCode: 'nl-NL',
      languageName: 'Nederlands'),
  Language(
      translationCode: 'fi',
      assetPath: 'assets/flags/FI.png',
      ttsCode: 'fi-FI',
      languageName: 'Suomalainen'),
  Language(
      translationCode: 'fr',
      assetPath: 'assets/flags/FR.png',
      ttsCode: 'fr-FR',
      languageName: 'Français'),
  Language(
      translationCode: 'de',
      assetPath: 'assets/flags/DE.png',
      ttsCode: 'de-DE',
      languageName: 'Deutsch'),
  Language(
      translationCode: 'el',
      assetPath: 'assets/flags/GR.png',
      ttsCode: 'el-GR',
      languageName: 'Ελληνικά'),
  Language(
      translationCode: 'it',
      assetPath: 'assets/flags/IT.png',
      ttsCode: 'it-IT',
      languageName: 'Italiano'),
  Language(
      translationCode: 'ja',
      assetPath: 'assets/flags/JP.png',
      ttsCode: 'ja-JP',
      languageName: '日本'),
  Language(
      translationCode: 'ms',
      assetPath: 'assets/flags/MY.png',
      ttsCode: 'ms-MY',
      languageName: 'Malaysia'),
  Language(
      translationCode: 'pt',
      assetPath: 'assets/flags/PT.png',
      ttsCode: 'pt-PT',
      languageName: 'Português'),
  Language(
      translationCode: 'ru',
      assetPath: 'assets/flags/RU.png',
      ttsCode: 'ru-RU',
      languageName: 'русский'),
  Language(
      translationCode: 'es',
      assetPath: 'assets/flags/ES.png',
      ttsCode: 'es-SE',
      languageName: 'Español'),
  Language(
      translationCode: 'sv',
      assetPath: 'assets/flags/SE.png',
      ttsCode: 'sv-SE',
      languageName: 'Svenska'),
  Language(
      translationCode: 'uk',
      assetPath: 'assets/flags/UA.png',
      ttsCode: 'uk-UA',
      languageName: 'український')
];
