import 'package:hiso/features/home/domain/entities/pacient.dart';
import 'package:meta/meta.dart';

class PacientModel extends Pacient {
  PacientModel({
    @required String name,
    @required String lastName,
    @required String hospital,
    @required String phone,
    @required String creatorName,
    @required String creatorLastName,
    @required String creatorCode,
    @required String healthNumber,
    @required String birthDate,
    @required Map<String, dynamic> updates,
  }) : super(
          name: name,
          lastName: lastName,
          hospital: hospital,
          phone: phone,
          creatorName: creatorName,
          creatorLastName: creatorLastName,
          creatorCode: creatorCode,
          healthNumber: healthNumber,
          birthDate: birthDate,
          updates: updates,
        );

  factory PacientModel.fromJson(Map<String, dynamic> data, String documentId) {
    return PacientModel(
      name: data['name'],
      lastName: data['lastName'],
      hospital: data['hospital'],
      phone: data['phone'],
      creatorName: data['creatorName'],
      creatorLastName: data['creatorLastName'],
      creatorCode: data['creatorCode'],
      healthNumber: documentId,
      birthDate: data['birthDate'],
      updates: data['updates'],
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
