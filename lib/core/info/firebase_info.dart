import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseInfo {
  Future<FirebaseUser> get currentUser;

  // Firebase Collections
  static final usersCollection = 'users';
  static final pacientCollection = 'pacients';
  static final updateCollection = 'updates';

  // Firebase Fields
  static final creatorIdField = 'creatorId';
}

class FirebaseInfoImpl implements FirebaseInfo {
  FirebaseInfoImpl(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  @override
  Future<FirebaseUser> get currentUser async =>
      await firebaseAuth.currentUser();
}
