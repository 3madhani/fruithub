import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

import 'storage_services.dart';

class FireStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImageToStorage(String path, File file) async {
    String fileName = p.basename(file.path);
    var fileRef = storageReference.child("$path/$fileName");

    await fileRef.putFile(file);

    return fileRef.getDownloadURL();
  }
}
