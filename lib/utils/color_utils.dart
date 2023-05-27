import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColor(ImageProvider imageProvider, Size size) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider, size: size);
  return paletteGenerator.dominantColor!.color;
}