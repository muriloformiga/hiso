import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/post/presentation/bloc/timeline/timeline_bloc.dart';
import 'package:hiso/features/post/presentation/pages/timeline_page.dart';
import 'package:hiso/injection_container.dart';
import 'package:sailor/sailor.dart';

abstract class PostRoutes {
  static const timelinePage = '/timeline';

  static void createRoutes() {
    Routes.sailor.addRoutes(
      [
        SailorRoute(
          name: timelinePage,
          builder: (context, args, params) {
            return BlocProvider<TimelineBloc>(
              create: (_) => dep<TimelineBloc>(),
              child: TimelinePage(args),
            );
          },
        ),
      ],
    );
  }
}
