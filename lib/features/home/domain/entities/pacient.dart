import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Pacient extends Equatable {
  Pacient({
    @required this.name,
    @required this.lastName,
    @required this.hospital,
    @required this.healthNumber,
    @required this.phone,
    @required this.creatorName,
    @required this.creatorLastName,
    @required this.creatorCode,
    @required this.birthDate,
    @required this.updates,
  });

  final String name;
  final String lastName;
  final String hospital;
  final String healthNumber;
  final String phone;
  final String creatorName;
  final String creatorLastName;
  final String creatorCode;
  final String birthDate;
  final Map<String, dynamic> updates;

  @override
  List<Object> get props => [
        name,
        lastName,
        hospital,
        healthNumber,
        phone,
        creatorName,
        creatorLastName,
        creatorCode,
        birthDate,
        updates,
      ];
}
