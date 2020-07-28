import 'package:hiso/features/home/data/models/pacient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:meta/meta.dart';

abstract class PacientDataSource {
  /// Acessa o Firebase para pegar os usuários cadastrados
  /// pelo médico logado no sistema.
  ///
  /// Dispara uma [FirestoreException] com a mensagem de erro.
  Future<List<PacientModel>> getMedicalPacients();
}

class PacientDataSourceImpl implements PacientDataSource {
  PacientDataSourceImpl({@required this.firestore});

  final Firestore firestore;
  final String creatorIdField = 'creatorId';
  final int queryLimit = 2;

  static List<DocumentSnapshot> _lastDocument;

  @override
  Future<List<PacientModel>> getMedicalPacients() async {
    try {
      QuerySnapshot querySnapshot;
      if (_lastDocument == null) {
        querySnapshot = await _getInitialData();
      } else {
        querySnapshot = await _getMoreData();
      }

      List<PacientModel> list = [];
      for (DocumentSnapshot document in querySnapshot.documents) {
        list.add(
          PacientModel.fromJson(
            document.data,
            document.documentID,
          ),
        );
      }
      return list;
    } catch (_) {
      throw FirestoreException();
    }
  }

  Future<QuerySnapshot> _getInitialData() async {
    final querySnapshot = await firestore
        .collection(FirebaseInfo.pacientCollection)
        .where(creatorIdField, isEqualTo: User.instance.userId)
        .limit(queryLimit)
        .getDocuments();
    return querySnapshot;
  }

  Future<QuerySnapshot> _getMoreData() async {
    final querySnapshot = await firestore
        .collection(FirebaseInfo.pacientCollection)
        .where(creatorIdField, isEqualTo: User.instance.userId)
        .orderBy('name')
        .startAfterDocument(_lastDocument[_lastDocument.length - 1])
        .limit(queryLimit)
        .getDocuments();
    return querySnapshot;
  }
}
