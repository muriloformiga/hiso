import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  UserModel({
    @required FirebaseUser firebaseUser,
  }) : super(firebaseUser: firebaseUser);
}
