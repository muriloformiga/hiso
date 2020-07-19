import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Pacient extends Equatable {
  Pacient({
    @required this.name,
    @required this.lastName,
    @required this.hospital,
    @required this.healthNumber,
    @required this.phone,
    @required this.birthDate,
  });

  final String name;
  final String lastName;
  final String hospital;
  final String healthNumber;
  final String phone;
  final Timestamp birthDate;

  @override
  List<Object> get props => [
        name,
        lastName,
        hospital,
        healthNumber,
        phone,
        birthDate,
      ];
}
