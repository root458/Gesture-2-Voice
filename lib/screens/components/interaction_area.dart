import 'package:flutter/material.dart';
import 'package:gesture_to_voice/constants.dart';

class InteractionArea extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  InteractionArea({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.mic, color: kWhite,),
          onPressed: () {},
          label: const Text('Speak', style: TextStyle(fontFamily: 'SFBold', fontSize: 20,)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kMain),
            elevation: MaterialStateProperty.all<double>(5),
            shadowColor: MaterialStateProperty.all<Color>(kMain),
            fixedSize:
                MaterialStateProperty.all<Size>(Size(0.7 * size.width, 50)),
          ),
        ),
        const Text(
          'Words to be uttered',
          style: TextStyle(
            overflow: TextOverflow.visible,
            fontFamily: 'SFBold',
            fontSize: 25.0,
          ),
        ),
      ],
    );
  }
}
