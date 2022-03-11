//success asset to Uint8List
import 'dart:io';
import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:image/image.dart' as imglib;
import 'package:flutter/services.dart';

class FileToCroppedImage {
  final String assetPath;
  final int vCount;
  final int hCount;

  final List<Uint8List> outputUint8List = <Uint8List>[];

  FileToCroppedImage(
      {required this.assetPath, required this.vCount, required this.hCount});

  Future<List<Uint8List>> cropperImage() async {
    String assetString = assetPath;
    ByteData bytes = await rootBundle.load(assetString);
    Uint8List soundBytes = bytes.buffer.asUint8List();

    imglib.Image? myConvertedImage = imglib.decodePng(soundBytes);

    try {
      int xLength = (myConvertedImage!.width / hCount).round();
      int yLength = (myConvertedImage.height / vCount).round();
      for (int y = 0; y < myConvertedImage.height;) {
        for (int x = 0; x < myConvertedImage.width;) {
          imglib.Image img =
              imglib.copyCrop(myConvertedImage, x, y, xLength, yLength);
          List<int> myList = imglib.encodePng(img);
          Uint8List uni8 = Uint8List.fromList(myList);
          outputUint8List.add(uni8);
          x = x + xLength + 1;
        }
        y = y + yLength + 1;
      }
    } catch (e) {
      print(e);
    }
    return outputUint8List;
  }
}
