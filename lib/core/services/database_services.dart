abstract class DatabaseServices {
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
}
