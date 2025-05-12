abstract class DatabaseServices {
  Future<void> setData(
    {required String path, required Map<String, dynamic> data}
  );
}
