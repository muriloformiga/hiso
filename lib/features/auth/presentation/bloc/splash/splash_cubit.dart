import 'package:bloc/bloc.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    @required this.firebaseInfo,
  }) : super(SplashInitial());

  final FirebaseInfo firebaseInfo;

  void verifyCurrentUser() async {
    final user = await Future.delayed(
      Duration(seconds: 2),
      () => firebaseInfo.currentUser,
    );
    if (user == null) {
      emit(SplashUserIsNotLoggedIn());
      return;
    }
    User.instance.setId(user.uid);
    User.instance.setEmail(user.email);
    emit(SplashUserIsLoggedIn());
  }
}
