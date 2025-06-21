import 'package:image_picker/image_picker.dart';

Future<String> pickImageFunc() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return image.path;
  }
  return '';
}
