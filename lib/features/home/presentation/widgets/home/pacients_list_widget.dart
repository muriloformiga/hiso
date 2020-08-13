import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/widgets/custom_progress_widget.dart';
import 'package:hiso/features/home/presentation/bloc/pacients/pacients_bloc.dart';
import 'package:hiso/features/home/presentation/widgets/home/pacient_tile_widget.dart';

class PacientsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PacientsBloc>(context).add(PacientsGetMedicalPacients());
    return BlocBuilder<PacientsBloc, PacientsState>(
      builder: (context, state) {
        if (state is PacientsLoadSucess) {
          final pacients = state.pacients;
          if (pacients.isEmpty) {
            return Text('Nenhum paciente cadastrado.');
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index < pacients.length) {
                return PacientTileWidget(
                  pacient: pacients[index],
                );
              } else {
                BlocProvider.of<PacientsBloc>(context)
                    .add(PacientsGetMedicalPacients());
                return CustomProgressWidget();
              }
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                state.hasReachedMax ? pacients.length : pacients.length + 1,
          );
        }
        return CustomProgressWidget();
      },
    );
  }
}
