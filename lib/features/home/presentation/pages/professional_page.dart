import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/bloc/pacients/pacients_bloc.dart';
import 'package:hiso/features/home/presentation/widgets/home/bottom_navigation_widget.dart';
import 'package:hiso/features/home/presentation/widgets/home/pacient_tile_widget.dart';

class ProfessionalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.topGreenGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                      HomeLogoutStarted(),
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.doctors,
                  height: 170.h,
                ),
                // if (state is HomeUserDataLoadSucess) {
                //   BlocProvider.of<PacientsBloc>(context)
                //       .add(PacientsGetMedicalPacients());
                //   return Column(
                //     children: <Widget>[
                //       Text(
                //         User.instance.userId,
                //       ),
                //       Text(
                //         User.instance.name,
                //       ),
                //       Text(
                //         User.instance.accountType,
                //       ),
                //     ],
                //   );
                // },

                BlocBuilder<PacientsBloc, PacientsState>(
                  builder: (context, state) {
                    if (state is PacientsMedicalPacientsLoadSucess) {
                      final pacients = state.pacients;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: pacients.length,
                        itemBuilder: (context, index) {
                          final pacient = pacients[index];
                          return PacientTileWidget(
                            name: pacient.name,
                            lastName: pacient.lastName,
                            hospital: pacient.hospital,
                            birthDate: pacient.birthDate,
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
