import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/widgets/custom_error_widget.dart';
import 'package:hiso/core/widgets/custom_progress_widget.dart';
import 'package:hiso/features/post/presentation/bloc/timeline/timeline_bloc.dart';

class PacienteDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineBloc, TimelineState>(
      builder: (context, state) {
        if (state is TimelineGetPacientDataSucess) {
          return Column(
            children: <Widget>[
              Text(
                'Paciente: ${state.pacient.name} ${state.pacient.lastName}',
              ),
              Text(
                'Data de nascimento: ${state.pacient.birthDate}',
              ),
              Text(
                'Hospital: ${state.pacient.hospital}',
              ),
              Text(
                'Número do SUS: ${state.pacient.healthNumber}',
              ),
              Text(
                'Registrado por: ${state.pacient.creatorName}'
                ' ${state.pacient.creatorLastName}'
                ' (${state.pacient.creatorCode})',
              ),
            ],
          );
        }
        if (state is TimelineDataLoading) {
          return CustomProgressWidget();
        }
        if (state is TimelineGetPacientDataFailure) {
          return CustomErrorWidget();
        }
        return Container(
          child: Column(
            children: <Widget>[
              //Text('Paciente: ${state.pacient.name}'),
            ],
          ),
        );
      },
    );
  }
}
