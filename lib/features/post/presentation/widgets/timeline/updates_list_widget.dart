import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/widgets/custom_progress_widget.dart';
import 'package:hiso/features/post/presentation/bloc/timeline/timeline_bloc.dart';
import 'package:hiso/features/post/presentation/widgets/timeline/timeline_tile_widget.dart';

class UpdatesListWidget extends StatelessWidget {
  UpdatesListWidget({
    @required this.healthNumber,
  });

  final String healthNumber;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TimelineBloc>(context).add(
      TimelineGetPacientUpdates(
        healthNumber: healthNumber,
      ),
    );
    return BlocBuilder<TimelineBloc, TimelineState>(
      builder: (context, state) {
        print(state);
        if (state is TimelineGetUpdatesSucess) {
          final updates = state.updates;
          if (updates.isEmpty) {
            return Text('Nenhuma atualização cadastrada.');
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index < updates.length) {
                return TimelineTileWidget(
                  update: updates[index],
                );
              } else {
                BlocProvider.of<TimelineBloc>(context).add(
                  TimelineGetPacientUpdates(
                    healthNumber: healthNumber,
                  ),
                );
                return CustomProgressWidget();
              }
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                state.hasReachedMax ? updates.length : updates.length + 1,
          );
        }
        return CustomProgressWidget();
      },
    );
  }
}
