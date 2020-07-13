import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/features/home/data/models/user_data_model.dart';
import 'package:meta/meta.dart';

abstract class ValidationDataSource {
  /// Faz requisição ao Firebase para chamar os dados do usuário,
  /// caso esses dados existam, constroi um modelo de User e retorna
  /// verdadeiro, senão, retorna falso.
  ///
  /// Dispara uma [FirestoreException] com a mensagem de erro.
  Future<UserDataModel> getUserData();
}

class ValidationDataSourceImpl implements ValidationDataSource {
  ValidationDataSourceImpl({@required this.firestore});

  final Firestore firestore;

  @override
  Future<UserDataModel> getUserData() async {
    final document = await firestore
        .collection(FirebaseInfo.usersCollection)
        .document(User.instance.userId)
        .get();
    if (!document.exists) {
      throw FirestoreNotFoundException();
    } else {
      return UserDataModel.fromJson(document.data);
    }
  }
}
