import 'package:flutter/material.dart';
import 'package:gesture_to_voice/screens/components/camera_area.dart';
import 'package:gesture_to_voice/screens/components/choose_language_sheet.dart';
import 'package:gesture_to_voice/screens/components/interaction_area.dart';
// import 'package:gesture_to_voice/services/speak_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final SpeakService _speakService = SpeakService();
    List<String> languages = ['English', 'Chinese', 'French', 'India'];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sky.jpg'), fit: BoxFit.cover),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Flexible(
                  flex: 7,
                  child: CameraArea(),
                ),
                Flexible(
                  flex: 2,
                  child: InteractionArea(
                    context: context,
                  ),
                ),
                Flexible(flex: 3, child: Container()),
              ],
            ),
            ChooseLanguage(context: context, languages: languages)
          ],
        ),
      ),
    );
  }
}
