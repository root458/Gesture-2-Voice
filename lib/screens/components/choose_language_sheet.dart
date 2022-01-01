import 'package:flutter/material.dart';
import 'package:gesture_to_voice/constants.dart';
import 'package:gesture_to_voice/screens/components/languages.dart';
import 'package:gesture_to_voice/services/data_service.dart';
import 'package:provider/provider.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    // DataService
    final DataService _dataService = Provider.of<DataService>(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.5,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            color: kWhite,
            child: ListView.builder(
                itemCount: allLanguages.length + 1,
                controller: scrollController,
                itemBuilder: (context, index) {
                  Language language;
                  if (index == 0) {
                    language = Language(
                        translationCode: '',
                        ttsCode: '',
                        languageName: 'Choose Language',
                        assetPath: '');
                  } else {
                    language = allLanguages[index - 1];
                  }

                  return _returnTextTile(language, _dataService);
                }),
          ),
        );
      },
    );
  }

  Widget _returnTextTile(Language language, DataService dataService) {
    if (language.languageName == 'Choose Language') {
      return ListTile(
        title: Text(
          dataService.chooseLanguage,
          style: const TextStyle(
              fontFamily: 'SFBold', fontSize: 25.0, color: kMain),
        ),
      );
    } else {
      return ListTile(
          trailing:
              dataService.currentLanguage.languageName == language.languageName
                  ? const Icon(
                      Icons.check_circle_sharp,
                      color: kMain,
                    )
                  : const Icon(
                      Icons.check_circle_sharp,
                      color: kWhite,
                    ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(language.assetPath),
          ),
          onTap: () {
            dataService.setLanguage(language);
          },
          title: Text(language.languageName,
              style: const TextStyle(fontFamily: 'SFBold', fontSize: 20.0)));
    }
  }
}
