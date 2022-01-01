import 'package:flutter/material.dart';
import 'package:gesture_to_voice/screens/home.dart';
import 'package:gesture_to_voice/services/data_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataService>(
      create: (context) => DataService(),
      child: MaterialApp(
        title: 'G2V',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'SFRegular'
        ),
        home: const Home(),
      ),
    );
  }
}
