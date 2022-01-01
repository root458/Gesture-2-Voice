import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gesture_to_voice/constants.dart';
import 'package:gesture_to_voice/screens/components/camera_area.dart';
import 'package:gesture_to_voice/screens/components/choose_language_sheet.dart';
import 'package:gesture_to_voice/screens/components/interaction_area.dart';
import 'package:gesture_to_voice/services/data_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Data
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    initializeCameras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final SpeakService _speakService = SpeakService();
    List<String> languages = ['English', 'Chinese', 'French', 'India'];

    return ChangeNotifierProvider<DataService>(
      create: (context) => DataService(),
      child: Scaffold(
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
                  Flexible(
                    flex: 8,
                    child: (cameras == null)
                        ? _returnLoadingWidget()
                        : CameraArea(cameras: cameras!),
                  ),
                  const Flexible(
                    flex: 2,
                    child: InteractionArea(),
                  ),
                  Flexible(flex: 3, child: Container()),
                ],
              ),
              ChooseLanguage(context: context, languages: languages)
            ],
          ),
        ),
      ),
    );
  }

  void initializeCameras() async {
    await availableCameras().then((value) {
      cameras = value;
      setState(() {});
    });
  }

  Widget _returnLoadingWidget() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SpinKitThreeBounce(
        color: kMain,
        size: 50.0,
      ),
    );
  }
}
