import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/usecases/logout/logout.dart';
import 'package:hiso/features/home/domain/usecases/validation/get_user_data.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @required this.logout,
    @required this.getUserData,
  })  : assert(logout != null),
        assert(getUserData != null),
        super(HomeInitial());

  final Logout logout;
  final GetUserData getUserData;

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
    yield result.fold(
      (failure) {
        if (failure is FirestoreNotFoundFailure) {
          return HomeUserDataInexist(message: failure.message);
        }
        return HomeUserDataError(message: failure.message);
      },
      (userData) {
        User.instance.setName(userData.name);
        User.instance.setAccountType(userData.accountType);
        User.instance.setPhone(userData.phone);
        return HomeUserDataLoadSucess();
      },
    );
  }
}
