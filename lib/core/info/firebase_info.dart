import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseInfo {
  Future<FirebaseUser> get currentUser;

  // Firebase Collections
  static final usersCollection = 'users';
}

class FirebaseInfoImpl implements FirebaseInfo {
  FirebaseInfoImpl(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  @override
  Future<FirebaseUser> get currentUser async =>
      await firebaseAuth.currentUser();
}
