import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseInfo {
  Future<bool> get hasUserLogged;
}

class FirebaseInfoImpl implements FirebaseInfo {
  FirebaseInfoImpl(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  @override
  Future<bool> get hasUserLogged async =>
      await firebaseAuth.currentUser() != null ? true : false;
}
