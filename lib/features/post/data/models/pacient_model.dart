import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:meta/meta.dart';

class PacientModel extends Pacient {
  PacientModel({
    @required String name,
    @required String lastName,
    @required String hospital,
    @required String healthNumber,
    @required String birthDate,
    String phone,
    String creatorName,
    String creatorLastName,
    String creatorCode,
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
        );

  factory PacientModel.fromDocument(
    Map<String, dynamic> pacientData,
    String documentId,
  ) {
    return PacientModel(
      name: pacientData['name'],
      lastName: pacientData['lastName'],
      hospital: pacientData['hospital'],
      phone: pacientData['phone'],
      creatorName: pacientData['creatorName'],
      creatorLastName: pacientData['creatorLastName'],
      creatorCode: pacientData['creatorCode'],
      healthNumber: documentId,
      birthDate: pacientData['birthDate'],
    );
  }
}
