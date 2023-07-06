import 'package:ajaaja_app/4.data_sources/remote/firestore_client.dart';

import '../../index.dart';

final firestoreApiProvider = Provider<FireStoreClient>((ref) {
  return FireStoreClientImpl();
});
