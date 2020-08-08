import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/post/presentation/bloc/timeline/timeline_bloc.dart';
import 'package:hiso/features/post/presentation/widgets/timeline/pacient_data_widget.dart';
import 'package:hiso/features/post/presentation/widgets/timeline/timeline_tile_widget.dart';
import 'package:sailor/sailor.dart';

class TimelinePageArgs extends BaseArguments {
  TimelinePageArgs({
    @required this.healthNumber,
  });

  final String healthNumber;
}

class TimelinePage extends StatefulWidget {
  TimelinePage(this.args);

  final TimelinePageArgs args;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<TimelineBloc>(context).add(
        TimelineGetPacientData(
          healthNumber: widget.args.healthNumber,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.topGreenGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: Routes.sailor.pop,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Image.asset(
                AppImages.family,
                height: 200.h,
              ),
              BlocBuilder<TimelineBloc, TimelineState>(
                builder: (context, state) {
                  if (state is TimelineGetPacientDataSucess) {
                    final pacient = state.pacient;
                    return Column(
                      children: <Widget>[
                        PacientDataWidget(
                          name: pacient.name,
                          lastName: pacient.lastName,
                          birthDate: pacient.birthDate,
                          creatorCode: pacient.creatorCode,
                          creatorLastName: pacient.creatorLastName,
                          creatorName: pacient.creatorName,
                          healthNumber: pacient.healthNumber,
                          hospital: pacient.hospital,
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.pacient.updates.length,
                          itemBuilder: (context, index) {
                            final update = state.pacient.updates[index];
                            return TimelineTileWidget(
                              date: update.date,
                              hour: update.hour,
                              message: update.message,
                            );
                          },
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
