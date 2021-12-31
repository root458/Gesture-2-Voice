import 'package:flutter/material.dart';

class InteractionArea extends StatelessWidget {
  
  const InteractionArea({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
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
