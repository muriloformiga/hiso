import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/features/auth/data/models/user_data_model.dart';
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
    try {
      final document = await firestore
          .collection('users')
          .document(User.instance.userId)
          .get();
      return UserDataModel.fromJson(document.data);
    } catch (error) {
      throw FirestoreException(code: error.code);
    }
  }
}
