


import 'package:dio/dio.dart';

Future uploadImageToApi(dynamic imagePath )async{
  return await MultipartFile.fromFile(imagePath.path,filename: imagePath.split('/').last);
}