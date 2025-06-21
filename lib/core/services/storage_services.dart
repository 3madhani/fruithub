import 'dart:io';

abstract class StorageServices {
  Future<String> uploadImageToStorage(String path, File file);
}
