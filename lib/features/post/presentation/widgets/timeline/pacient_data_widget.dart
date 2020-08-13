import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';

class PacientDataWidget extends StatelessWidget {
  PacientDataWidget({
    @required this.pacient,
  });

  final Pacient pacient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Column(
        children: <Widget>[
          Text(
            'Paciente: ${pacient.name} ${pacient.lastName}',
          ),
          Text(
            'Data de nascimento: ${pacient.birthDate}',
          ),
          Text(
            'Hospital: ${pacient.hospital}',
          ),
          Text(
            'Número do SUS: ${pacient.healthNumber}',
          ),
          Text(
            'Registrado por: ${pacient.creatorName} ${pacient.creatorLastName} (${pacient.creatorCode})',
          ),
        ],
      ),
    );
  }
}
