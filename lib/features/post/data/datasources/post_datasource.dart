import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/features/home/data/models/pacient_model.dart';
import 'package:meta/meta.dart';

abstract class PostDataSource {
  /// Faz requisição de registro de paciente para
  ///  o serviço de banco de dados do Firebase.
  ///
  /// Dispara uma [FirestorePacientAlreadyExistsException]
  /// caso o usuário que está tentando ser cadastrado já
  /// existe e [FirestoreException] em caso de outro erro.
  Future<void> registerPacient(
    String healthNumber,
    Map<String, dynamic> data,
  );

  /// Faz requisição dos dados de um paciente para
  /// o serviço de banco de dados do Firebase, usando
  /// o número do SUS.
  ///
  /// Dispara uma [FirestoreException] com a mensagem de erro.
  Future<PacientModel> getPacientData(
    String healthNumber,
  );
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl({@required this.firestore});

  final Firestore firestore;

  @override
  Future<void> registerPacient(
    String healthNumber,
    Map<String, dynamic> data,
  ) async {
    try {
      final documentSnapshot = await firestore
          .collection(FirebaseInfo.pacientCollection)
          .document(healthNumber)
          .get();
      if (documentSnapshot.exists == false) {
        await firestore
            .collection(FirebaseInfo.pacientCollection)
            .document(healthNumber)
            .setData(data);
      } else {
        throw FirestorePacientAlreadyExistsException();
      }
    } on FirestorePacientAlreadyExistsException {
      throw FirestorePacientAlreadyExistsException();
    } catch (_) {
      throw FirestoreException();
    }
  }

  @override
  Future<PacientModel> getPacientData(String healthNumber) async {
    try {
      final documentSnapshot = await firestore
          .collection(FirebaseInfo.pacientCollection)
          .document(healthNumber)
          .get();
      return PacientModel.fromJson(documentSnapshot.data, healthNumber);
    } catch (_) {
      throw FirestoreException();
    }
  }
}
