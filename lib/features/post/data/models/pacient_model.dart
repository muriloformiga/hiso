import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:hiso/features/post/domain/entities/update.dart';
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
    List<Update> updates,
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

  factory PacientModel.fromDocument(
    Map<String, dynamic> pacientData,
    List<Update> updateData,
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
      updates: updateData,
    );
  }

  factory PacientModel.fromBasicData(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return PacientModel(
      name: data['name'],
      lastName: data['lastName'],
      hospital: data['hospital'],
      birthDate: data['birthDate'],
      healthNumber: documentId,
    );
  }
}
