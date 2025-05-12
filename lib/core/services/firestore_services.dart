import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_services.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.data() as Map<String, dynamic>;
  }

  @override
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }
}
