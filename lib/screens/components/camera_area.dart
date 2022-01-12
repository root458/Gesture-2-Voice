import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gesture_to_voice/constants.dart';
import 'package:gesture_to_voice/services/classify.dart';
import 'package:gesture_to_voice/services/data_service.dart';
import 'package:gesture_to_voice/services/speak_service.dart';
import 'package:gesture_to_voice/services/translation_service.dart';
import 'package:provider/provider.dart';

class CameraArea extends StatefulWidget {
  final List<CameraDescription> cameras;
  final BuildContext contextOne;
  const CameraArea({Key? key, required this.cameras, required this.contextOne})
      : super(key: key);

  @override
  State<CameraArea> createState() => _CameraAreaState();
}

class _CameraAreaState extends State<CameraArea> {
  // Controllers and files
  late CameraController _cameraController;
  late XFile _imageFile;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size
    Size size = MediaQuery.of(context).size;

    // DataService
    final DataService _dataService = Provider.of<DataService>(context);

    // Classify service
    final Classify classifier = Classify();

    // TTS service
    SpeakService _speakService = SpeakService();

    if (!_cameraController.value.isInitialized) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: SpinKitThreeBounce(
          color: kMain,
          size: 50.0,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: SizedBox(
        height: size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.46,
              width: size.width * 0.96,
              decoration: const BoxDecoration(
                  color: kMain,
                  borderRadius: BorderRadius.all(Radius.circular(27.0))),
              child: CameraPreview(_cameraController),
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.mic,
                color: kWhite,
              ),
              onPressed: () async {
                // RESULT VALUES
                late String _gesture;
                late double _confidence;
                late String _translation;
                // This button initiates all actions
                // 1. Take photo
                await _takePicture();
                // 2. Run model on photo, get gesture string
                await classifier.getGesture(_imageFile).then((value) {
                  setState(() {
                    _gesture = value![0]['label'];
                    _confidence = value[0]['confidence'];
                  });
                });
                if (_confidence > 0.65) {
                  // Do the stuff
                  // 3. Translate the gesture string to current selected language
                  await TranslationService.translateMessage(
                          message: _gesture,
                          fromLanguageCode: 'en',
                          tOLanguageCode:
                              _dataService.currentLanguage.translationCode)
                      .then((value) {
                    _translation = value;
                  });
                  // 4. Update the word on the data service instance
                  _dataService.setWordsToDisplay(_translation);
                  // 5. Speak the word in the language
                  _speakService.speak(
                      words: _translation,
                      langej: _dataService.currentLanguage.ttsCode);
                } else {
                  // Display not sure/ try again in material banner
                  showBanner(widget.contextOne, _dataService);
                }
              },
              label: Text(_dataService.speak,
                  style: const TextStyle(
                    fontFamily: 'SFBold',
                    fontSize: 20,
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(kMain),
                elevation: MaterialStateProperty.all<double>(5),
                shadowColor: MaterialStateProperty.all<Color>(kMain),
                fixedSize:
                    MaterialStateProperty.all<Size>(Size(0.7 * size.width, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBanner(BuildContext contextOne, DataService dataService) {
    ScaffoldMessenger.of(contextOne).showMaterialBanner(MaterialBanner(
      content: Text(
        dataService.tryAgain,
        style: const TextStyle(color: kWhite),
      ),
      leading: const Icon(
        Icons.info,
        color: kWhite,
      ),
      backgroundColor: kAccent,
      actions: [
        TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Icon(Icons.thumb_up, color: kWhite,)),
      ],
    ));
  }

  _takePicture() async {
    _imageFile = await _cameraController.takePicture();
    setState(() {});
  }
}
