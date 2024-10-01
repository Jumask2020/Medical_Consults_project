import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {


  Future<String?> imagePicker(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);
    return image?.path;
  }
}