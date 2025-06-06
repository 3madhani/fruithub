abstract class DatabaseServices {
  Future<dynamic> getData({
    required String path,
    required String documentId,
  });

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future <bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  });
}
