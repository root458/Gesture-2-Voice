import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gesture_to_voice/constants.dart';

class CameraArea extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraArea({Key? key, required this.cameras}) : super(key: key);

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
        height: size.height*0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.5,
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
                await _takePicture();
              },
              label: const Text('Speak',
                  style: TextStyle(
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

  _takePicture() async {
    _imageFile = await _cameraController.takePicture();
    setState(() {});
  }
}
