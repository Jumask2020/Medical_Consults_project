

import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> imagePicker(ImageSource source) async {
  ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: source);
  File fileImage = File(image!.path);
  return fileImage;
}