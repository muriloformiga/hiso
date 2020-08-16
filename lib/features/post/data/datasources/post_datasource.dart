import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/utils/app_consts.dart';
import 'package:hiso/features/post/data/models/update_model.dart';
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
    Map<String, dynamic> pacientData,
    Map<String, dynamic> updateData,
  );

  /// Faz requisição dos dados de um paciente para
  /// o serviço de banco de dados do Firebase, usando
  /// o número do SUS.
  ///
  /// Dispara uma [FirestoreException] com a mensagem de erro.
  Future<List<UpdateModel>> getPacientUpdates(
    String healthNumber,
  );
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl({@required this.firestore});

  final Firestore firestore;

  @override
  Future<void> registerPacient(
    String healthNumber,
    Map<String, dynamic> pacientData,
    Map<String, dynamic> updateData,
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
            .setData(pacientData);
        await firestore
            .collection(FirebaseInfo.pacientCollection)
            .document(healthNumber)
            .collection(FirebaseInfo.updateCollection)
            .document()
            .setData(updateData);
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
  Future<List<UpdateModel>> getPacientUpdates(String healthNumber) async {
    try {
      QuerySnapshot querySnapshot;
      List<UpdateModel> list = [];
      if (AppConsts.lastUpdateDocument == null) {
        querySnapshot = await _getInitialData(healthNumber);
      } else {
        querySnapshot = await _getMoreData(healthNumber);
      }
      for (DocumentSnapshot document in querySnapshot.documents) {
        list.add(
          UpdateModel.fromJson(
            document.data,
          ),
        );
      }
      AppConsts.lastUpdateDocument = querySnapshot.documents.last;
      return list;
    } catch (_) {
      throw FirestoreException();
    }
  }

  Future<QuerySnapshot> _getInitialData(String healthNumber) async {
    final querySnapshot = await firestore
        .collection(FirebaseInfo.pacientCollection)
        .document(healthNumber)
        .collection(FirebaseInfo.updateCollection)
        .orderBy('date')
        .limit(AppConsts.paginationValue)
        .getDocuments();
    return querySnapshot;
  }

  Future<QuerySnapshot> _getMoreData(String healthNumber) async {
    final querySnapshot = await firestore
        .collection(FirebaseInfo.pacientCollection)
        .document(healthNumber)
        .collection(FirebaseInfo.updateCollection)
        .orderBy('date')
        .startAfterDocument(AppConsts.lastUpdateDocument)
        .limit(AppConsts.paginationValue)
        .getDocuments();
    return querySnapshot;
  }
}
