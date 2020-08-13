import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/widgets/home/bottom_navigation_widget.dart';
import 'package:hiso/features/home/presentation/widgets/home/pacients_list_widget.dart';

class ProfessionalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.topGreenGradient,
      ),
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(
                User.instance.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                    HomeLogoutStarted(),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    AppImages.doctors,
                    height: 170.h,
                    fit: BoxFit.cover,
                  ),
                  PacientsListWidget(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
