import 'package:hiso/core/utils/app_consts.dart';
import 'package:hiso/features/post/data/models/pacient_model.dart';
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

  static DocumentSnapshot _lastDocument;

  @override
  Future<List<PacientModel>> getMedicalPacients() async {
    try {
      QuerySnapshot querySnapshot;
      List<PacientModel> list = [];
      if (_lastDocument == null) {
        querySnapshot = await _getInitialData();
      } else {
        querySnapshot = await _getMoreData();
      }
      for (DocumentSnapshot document in querySnapshot.documents) {
        list.add(
          PacientModel.fromDocument(
            document.data,
            document.documentID,
          ),
        );
      }
      _lastDocument = querySnapshot.documents.last;
      return list;
    } catch (_) {
      throw FirestoreException();
    }
  }

  Future<QuerySnapshot> _getInitialData() async {
    final querySnapshot = await firestore
        .collection(FirebaseInfo.pacientCollection)
        .where(FirebaseInfo.creatorIdField, isEqualTo: User.instance.userId)
        .orderBy('name')
        .limit(AppConsts.paginationValue)
        .getDocuments();
    return querySnapshot;
  }

  Future<QuerySnapshot> _getMoreData() async {
    final querySnapshot = await firestore
        .collection(FirebaseInfo.pacientCollection)
        .where(FirebaseInfo.creatorIdField, isEqualTo: User.instance.userId)
        .orderBy('name')
        .startAfterDocument(_lastDocument)
        .limit(AppConsts.paginationValue)
        .getDocuments();
    return querySnapshot;
  }
}
