import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/post/presentation/bloc/timeline/timeline_bloc.dart';
import 'package:hiso/features/post/presentation/widgets/timeline/paciente_data_widget.dart';
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
              PacienteDataWidget(),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TimelineTileWidget(
                    date: '00/00/0000',
                    hour: '00:00',
                    message:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Phasellus sed mauris hendrerit, hendrerit nisl eget, '
                        'ullamcorper est. Nulla sit amet pharetra tellus, vitae '
                        'tempus elit. Ut nunc orci, malesuada non aliquet non, '
                        'pellentesque et ipsum. Pellentesque viverra dolor vitae '
                        'lacus mattis sollicitudin. Pellentesque in metus sit '
                        'amet libero suscipit accumsan sit amet sed ligula.',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
