import 'dart:io';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

class Classify {

  Future<List?> getGesture(XFile imageFile) async {
    await loadModel();
    var result = await classifyImage(File(imageFile.path));
    Tflite.close();
    return result;
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/model_unquant.tflite",
      labels: "assets/model/labels.txt",
      numThreads: 1,
    );
  }

  Future<List?> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    return output;
  }
}