import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';

class PacientDataWidget extends StatelessWidget {
  PacientDataWidget({
    @required this.name,
    @required this.lastName,
    @required this.birthDate,
    @required this.healthNumber,
    @required this.hospital,
    @required this.creatorCode,
    @required this.creatorName,
    @required this.creatorLastName,
  });

  final String name;
  final String lastName;
  final String birthDate;
  final String healthNumber;
  final String hospital;
  final String creatorCode;
  final String creatorName;
  final String creatorLastName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Column(
        children: <Widget>[
          Text(
            'Paciente: $name $lastName',
          ),
          Text(
            'Data de nascimento: $birthDate',
          ),
          Text(
            'Hospital: $hospital',
          ),
          Text(
            'Número do SUS: $healthNumber',
          ),
          Text(
            'Registrado por: $creatorName $creatorLastName ($creatorCode)',
          ),
        ],
      ),
    );
  }
}
