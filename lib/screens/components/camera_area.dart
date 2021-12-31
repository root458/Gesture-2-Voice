import 'package:flutter/material.dart';
import 'package:gesture_to_voice/constants.dart';

class CameraArea extends StatelessWidget {
  const CameraArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: kMain,
          borderRadius: BorderRadius.all(Radius.circular(27.0))
        ),
      ),
    );
  }
}
