import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  User({
    @required this.firebaseUser,
  });

  final FirebaseUser firebaseUser;

  @override
  List<Object> get props => [firebaseUser];
}
