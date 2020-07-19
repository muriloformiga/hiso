import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/usecases/logout/logout.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';
import 'package:hiso/features/home/domain/usecases/home/get_medical_pacients.dart';
import 'package:hiso/features/home/domain/usecases/validation/get_user_data.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @required this.logout,
    @required this.getUserData,
    @required this.getMedicalPacients,
  })  : assert(logout != null),
        assert(getUserData != null),
        super(HomeInitial());

  final Logout logout;
  final GetUserData getUserData;
  final GetMedicalPacients getMedicalPacients;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLogoutStarted) {
      yield* _mapToLogout();
    } else if (event is HomeGetUserData) {
      yield* _mapToGetUserData();
    }
  }

  Stream<HomeState> _mapToLogout() async* {
    final result = await logout(NoParams());

    yield result.fold((failure) => HomeFailure(message: failure.message),
        (_) => HomeLogout());
  }

  Stream<HomeState> _mapToGetUserData() async* {
    yield HomeDataLoadInProgress();
    final result = await getUserData(NoParams());
    yield* result.fold(
      (failure) async* {
        if (failure is FirestoreNotFoundFailure) {
          yield HomeUserDataInexist(message: failure.message);
        }
        yield HomeUserDataError(message: failure.message);
      },
      (userData) async* {
        User.instance.setName(userData.name);
        User.instance.setLastName(userData.lastName);
        User.instance.setAccountType(userData.accountType);
        User.instance.setPhone(userData.phone);
        User.instance.setCpf(userData.cpf);
        User.instance.setCode(userData.code);
        final result = await getMedicalPacients(NoParams());
        result.fold(
          (l) => null,
          (pacients) {
            for (Pacient p in pacients) {
              print(p.name);
            }
          },
        );
        final results = await getMedicalPacients(NoParams());
        results.fold(
          (l) => null,
          (pacients) {
            for (Pacient p in pacients) {
              print(p.name);
            }
          },
        );
        yield HomeUserDataLoadSucess();
      },
    );
  }
}
