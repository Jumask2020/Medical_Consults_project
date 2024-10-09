// import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UploadImage {
//
//   Future uploadImageToApi(dynamic imagePath)async{
//     return await MultipartFile.fromFile(imagePath.path,filename: imagePath.path.split('/').last);
//   }
//
//
//   Future<String?> imagePicker(ImageSource source) async {
//     ImagePicker picker = ImagePicker();
//     XFile? image = await picker.pickImage(source: source);
//     return image?.path;
//   }
// // }