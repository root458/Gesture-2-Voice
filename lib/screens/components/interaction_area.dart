import 'package:flutter/material.dart';
import 'package:gesture_to_voice/services/data_service.dart';
import 'package:provider/provider.dart';

class InteractionArea extends StatelessWidget {
  
  const InteractionArea({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // DataService
    final DataService _dataService = Provider.of<DataService>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          _dataService.wordsToDisplay,
          style: const TextStyle(
            overflow: TextOverflow.visible,
            fontFamily: 'SFBold',
            fontSize: 25.0,
          ),
        ),
      ],
    );
  }
}
