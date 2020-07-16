import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:meta/meta.dart';

abstract class PostDataSource {
  /// Faz requisição de registro de paciente para
  ///  o serviço de banco de dados do Firebase.
  ///
  /// Dispara uma [FirestoreException] com a mensagem de erro.
  Future<void> registerPacient(
    Map<String, dynamic> data,
  );
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl({@required this.firestore});

  final Firestore firestore;

  @override
  Future<void> registerPacient(Map<String, dynamic> data) async {
    try {
      await firestore
          .collection(FirebaseInfo.pacientCollection)
          .document()
          .setData(data);
    } catch (error) {
      throw FirestoreException(code: error.code);
    }
  }
}
