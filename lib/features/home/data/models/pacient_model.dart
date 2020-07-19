import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';
import 'package:meta/meta.dart';

class PacientModel extends Pacient {
  PacientModel({
    @required String name,
    @required String lastName,
    @required String hospital,
    @required String phone,
    @required String healthNumber,
    @required Timestamp birthDate,
  }) : super(
          name: name,
          lastName: lastName,
          hospital: hospital,
          phone: phone,
          healthNumber: healthNumber,
          birthDate: birthDate,
        );

  factory PacientModel.fromJson(Map<String, dynamic> data, String documentId) {
    return PacientModel(
      name: data['name'],
      lastName: data['lastName'],
      hospital: data['hospital'],
      phone: data['phone'],
      healthNumber: documentId,
      birthDate: data['birthDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'hospital': hospital,
      'phone': phone,
      'birthDate': birthDate,
    };
  }
}
