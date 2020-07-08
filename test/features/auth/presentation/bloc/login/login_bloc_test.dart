import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_email.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_facebook.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_google.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginWithEmail extends Mock implements LoginWithEmail {}

class MockLoginWithFacebook extends Mock implements LoginWithFacebook {}

class MockLoginWithGoogle extends Mock implements LoginWithGoogle {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  LoginBloc bloc;
  MockLoginWithEmail mockLoginWithEmail;
  MockLoginWithFacebook mockLoginWithFacebook;
  MockLoginWithGoogle mockLoginWithGoogle;
  MockFirebaseUser mockFirebaseUser;

  setUp(() {
    mockLoginWithEmail = MockLoginWithEmail();
    mockLoginWithFacebook = MockLoginWithFacebook();
    mockLoginWithGoogle = MockLoginWithGoogle();
    mockFirebaseUser = MockFirebaseUser();

    bloc = LoginBloc(
      loginWithEmail: mockLoginWithEmail,
      loginWithFacebook: mockLoginWithFacebook,
      loginWithGoogle: mockLoginWithGoogle,
    );
  });

  test('Estado inicial deve ser LoginInitial', () {
    // assert
    expect(bloc.state, equals(LoginInitial()));
  });

  group('LoginEmailStarted', () {
    final tEmail = 'teste@email.com';
    final tPass = 'teste123';
    final tAuthUser = AuthUser(firebaseUser: mockFirebaseUser);

    final tMessage = 'O seu endereço de email parece estar incorreto.';

    test(
      'Deve pegar os dados chamando o usecase LoginWithEmail',
      () async {
        // arrange
        when(mockLoginWithEmail(any)).thenAnswer((_) async => Right(tAuthUser));
        // act
        bloc.add(LoginEmailStarted(email: tEmail, password: tPass));
        await untilCalled(mockLoginWithEmail(any));
        // assert
        verify(mockLoginWithEmail(Params(email: tEmail, password: tPass)));
      },
    );

    blocTest<LoginBloc, LoginEvent, LoginState>(
      'Deve emitir [LoginLoadInProgress, LoginSucess] quando conseguir pegar os dados',
      build: () async {
        when(mockLoginWithEmail(any)).thenAnswer((_) async => Right(tAuthUser));
        return bloc;
      },
      act: (bloc) async => bloc.add(
        LoginEmailStarted(
          email: tEmail,
          password: tPass,
        ),
      ),
      expect: <dynamic>[
        isA<LoginLoadInProgress>(),
        isA<LoginSuccess>(),
      ],
    );

    blocTest(
      'Deve emitir [LoginLoadInProgress, LoginFailure] quando não conseguir pegar os dados',
      build: () async {
        when(mockLoginWithEmail(any)).thenAnswer(
            (_) async => Left(FirebaseLoginFailure(message: tMessage)));
        return bloc;
      },
      act: (bloc) async =>
          bloc.add(LoginEmailStarted(email: tEmail, password: tPass)),
      expect: <dynamic>[
        isA<LoginLoadInProgress>(),
        isA<LoginFailure>(),
      ],
    );
  });

  group('LoginFacebookStarted', () {
    final tAuthUser = AuthUser(firebaseUser: mockFirebaseUser);

    final tMessage = 'O seu endereço de email parece estar incorreto.';

    test(
      'Deve pegar os dados chamando o usecase LoginWithFacebook',
      () async {
        // arrange
        when(mockLoginWithFacebook(any))
            .thenAnswer((_) async => Right(tAuthUser));
        // act
        bloc.add(LoginFacebookStarted());
        await untilCalled(mockLoginWithFacebook(any));
        // assert
        verify(mockLoginWithFacebook(NoParams()));
      },
    );

    blocTest<LoginBloc, LoginEvent, LoginState>(
      'Deve emitir [LoginLoadInProgress, LoginSucess] quando conseguir pegar os dados',
      build: () async {
        when(mockLoginWithFacebook(any))
            .thenAnswer((_) async => Right(tAuthUser));
        return bloc;
      },
      act: (bloc) async => bloc.add(LoginFacebookStarted()),
      expect: <dynamic>[
        isA<LoginLoadInProgress>(),
        isA<LoginSuccess>(),
      ],
    );

    blocTest(
      'Deve emitir [LoginLoadInProgress, LoginFailure] quando não conseguir pegar os dados',
      build: () async {
        when(mockLoginWithFacebook(any)).thenAnswer(
            (_) async => Left(FirebaseLoginFailure(message: tMessage)));
        return bloc;
      },
      act: (bloc) async => bloc.add(LoginFacebookStarted()),
      expect: <dynamic>[
        isA<LoginLoadInProgress>(),
        isA<LoginFailure>(),
      ],
    );
  });
}
