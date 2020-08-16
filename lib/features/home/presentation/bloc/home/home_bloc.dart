import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/home/domain/usecases/validation/get_user_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @required this.getUserData,
  })  : assert(getUserData != null),
        super(HomeInitial());

  final GetUserData getUserData;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeGetUserData) {
      yield* _mapToGetUserData();
    }
  }

  Stream<HomeState> _mapToGetUserData() async* {
    yield HomeUserDataLoading();
    final result = await getUserData(NoParams());
    yield* result.fold(
      (failure) async* {
        if (failure is FirestoreNotFoundFailure) {
          yield HomeUserDataInexist(message: failure.message);
        }
        yield HomeUserDataLoadError(message: failure.message);
      },
      (userData) async* {
        User.instance.setName(userData.name);
        User.instance.setLastName(userData.lastName);
        User.instance.setAccountType(userData.accountType);
        User.instance.setPhone(userData.phone);
        User.instance.setCpf(userData.cpf);
        User.instance.setCode(userData.code);
        yield HomeUserDataLoadSucess();
      },
    );
  }
}
