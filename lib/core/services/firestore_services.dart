import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_services.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  }) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (documentId != null) {
      // If documentId is provided, fetch the specific document
      var doc = await firestore.collection(path).doc(documentId).get();
      return doc.data();
    } else {
      // If documentId is not provided, fetch the entire collection
      Query<Map<String, dynamic>> querySnapshot = firestore.collection(path);
      if (queryParameters != null) {
        // Apply query parameters if provided
        if (queryParameters["orderBy"] != null) {
          var orderBy = queryParameters["orderBy"];
          var descending = queryParameters["descending"] ?? false;
          querySnapshot = querySnapshot.orderBy(
            orderBy,
            descending: descending,
          );
        }

        if (queryParameters["limit"] != null) {
          var limit = queryParameters["limit"];
          querySnapshot = querySnapshot.limit(limit);
        }
      }
      var querySnapshotResult = await querySnapshot.get();
      // Convert the query snapshot to a list of maps
      return querySnapshotResult.docs.map((doc) => doc.data()).toList();
    }
  }

  @override
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Stream streamData({
    required String path,
    Map<String, dynamic>? queryParameters,
    String? documentId,
  }) {
    if (documentId != null) {
      // Return a stream for a single document
      return firestore.collection(path).doc(documentId).snapshots();
    } else {
      // Return a stream for the whole collection
      Query<Map<String, dynamic>> querySnapshot = firestore.collection(path);
      if (queryParameters != null) {
        if (queryParameters["orderBy"] != null) {
          var orderBy = queryParameters["orderBy"];
          var descending = queryParameters["descending"] ?? false;
          querySnapshot = querySnapshot.orderBy(
            orderBy,
            descending: descending,
          );
        }

        if (queryParameters["limit"] != null) {
          var limit = queryParameters["limit"];
          querySnapshot = querySnapshot.limit(limit);
        }
      }

      return querySnapshot.snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
      );
    }
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).update(data);
    }
  }
}
