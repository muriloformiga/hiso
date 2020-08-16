import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppConsts {
  static int paginationValue = 30;
  static DocumentSnapshot lastPacientDocument;
  static DocumentSnapshot lastUpdateDocument;
}
