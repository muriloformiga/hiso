import 'package:flutter/material.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/core/utils/app_consts.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:hiso/features/post/presentation/widgets/timeline/pacient_data_widget.dart';
import 'package:hiso/features/post/presentation/widgets/timeline/updates_list_widget.dart';
import 'package:sailor/sailor.dart';

class TimelinePageArgs extends BaseArguments {
  TimelinePageArgs({
    @required this.pacient,
  });

  final Pacient pacient;
}

class TimelinePage extends StatelessWidget {
  TimelinePage(this.args);

  final TimelinePageArgs args;

  @override
  Widget build(BuildContext context) {
    AppConsts.lastUpdateDocument = null;
    final pacient = args.pacient;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PacientDataWidget(
                pacient: pacient,
              ),
              UpdatesListWidget(
                healthNumber: pacient.healthNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
