import 'package:cloud_firestore/cloud_firestore.dart';

import '../../flavors.dart';

class FirestoreConfig {
  static final FirestoreConfig instance = FirestoreConfig._internal();
  factory FirestoreConfig() {
    return instance;
  }

  FirestoreConfig._internal() {}

  static final rootDoc = FirebaseFirestore.instance.collection(F.name).doc('app');

  final userDoc = FirebaseFirestore.instance.collection(F.name).doc('user');
  final userCollection = rootDoc.collection('user');
}
