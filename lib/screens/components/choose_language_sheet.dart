import 'package:flutter/material.dart';
import 'package:gesture_to_voice/constants.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage(
      {Key? key, required this.context, required this.languages})
      : super(key: key);

  final BuildContext context;
  final List languages;

  @override
  Widget build(BuildContext context) {

    
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
                itemCount: languages.length + 1,
                controller: scrollController,
                itemBuilder: (context, index) {
                  String text;
                  if (index == 0) {
                    text = 'Choose Language';
                  } else {
                    text = languages[index - 1];
                  }

                  return _returnTextTile(text);
                }),
          ),
        );
      },
    );
  }
}

Widget _returnTextTile(String text) {
  if (text == 'Choose Language') {
    return ListTile(
      title: Text(
        text,
        style:
            const TextStyle(fontFamily: 'SFBold', fontSize: 25.0, color: kMain),
      ),
    );
  } else {
    return ListTile(
        title: Text(text,
            style: const TextStyle(
              fontFamily: 'SFBold',
              fontSize: 20.0
            )));
  }
}
