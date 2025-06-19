abstract class DatabaseServices {
  Future<bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? queryParameters,
  });

  Stream<dynamic> streamData({
    required String path,
    String? documentId,
    Map<String, dynamic>? queryParameters,
  });

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
}
