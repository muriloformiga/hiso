import 'dart:async';

import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/home/domain/entities/user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/features/home/domain/usecases/validation/get_user_data.dart';
import 'package:meta/meta.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc({@required this.getUserData}) : super(ValidationInitial());

  final GetUserData getUserData;

  @override
  Stream<ValidationState> mapEventToState(
    ValidationEvent event,
  ) async* {
    if (event is ValidationLoadDataStarted) {
      yield* _mapToLoadDataStarted();
    }
  }

  Stream<ValidationState> _mapToLoadDataStarted() async* {
    yield ValidationLoadDataInProgress();
    final result = await getUserData(NoParams());
    yield result.fold(
      (failure) => ValidationFailure(message: failure.message),
      (userData) {
        // User.instance.setName(userData.name);
        // User.instance.setLastName(userData.lastName);
        // User.instance.setCpf(userData.cpf);
        // User.instance.setCode(userData.code);
        // User.instance.setPhone(userData.phone);
        // User.instance.setAccountType(userData.accountType);
        return ValidationSucess(userData: userData);
      },
    );
  }
}
