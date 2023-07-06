import 'package:cloud_firestore/cloud_firestore.dart';

import '../../5.models/5.models.dart';

abstract class FireStoreClient {
  Future<QuerySnapshot> getCollection(String path);
  Future<DocumentSnapshot> getDocument(String path);
  Future<bool> addDocument(CollectionReference colRef, Map<String, dynamic> data);
  Future<bool> addCollection(DocumentReference docRef, Map<String, dynamic> data);
  Future<void> deleteDocument(String path);
  Future<void> updateDocument(String path, Map<String, dynamic> data);

  Future<DocumentReference> getColWithRef(DocumentReference ref);
  Future<DocumentReference> getDocWithRef(DocumentReference ref);
  Future<MeResponse?> getDocWithUserRef(DocumentReference<Object?> ref);
}

class FireStoreClientImpl extends FireStoreClient {
  @override
  Future<void> deleteDocument(String path) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference<Object?>> getColWithRef(DocumentReference<Object?> ref) {
    // TODO: implement getColWithRef
    throw UnimplementedError();
  }

  @override
  Future<QuerySnapshot<Object?>> getCollection(String path) {
    // TODO: implement getCollection
    throw UnimplementedError();
  }

  @override
  Future<MeResponse?> getDocWithUserRef(DocumentReference<Object?> ref) async {
    final user = ref.withConverter<MeResponse>(
      fromFirestore: (snapshot, _) => MeResponse.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );

    var snap = await user.get();

    if (!snap.exists) null;
    return snap.data();
  }

  @override
  Future<DocumentSnapshot<Object?>> getDocument(String path) {
    // TODO: implement getDocument
    throw UnimplementedError();
  }

  @override
  Future<bool> addDocument(CollectionReference colRef, Map<String, dynamic> data) async {
    try {
      colRef.add(data).then((value) => print('added')).catchError((e) => print('add error: $e'));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addCollection(DocumentReference docRef, Map<String, dynamic> data) async {
    try {
      await docRef
          .set(data)
          .then((value) => print('collection added'))
          .catchError((e) => print('collection add error: $e'));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> updateDocument(String path, Map<String, dynamic> data) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference<Object?>> getDocWithRef(DocumentReference<Object?> ref) {
    // TODO: implement getDocWithRef
    throw UnimplementedError();
  }
}
