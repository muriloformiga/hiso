import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_user_data.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_email.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRegisterWithEmail extends Mock implements RegisterWithEmail {}

class MockRegisterUserData extends Mock implements RegisterUserData {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  RegisterBloc bloc;
  MockRegisterWithEmail mockRegisterWithEmail;
  MockRegisterUserData mockRegisterUserData;
  MockFirebaseUser mockFirebaseUser;

  setUp(() {
    mockRegisterWithEmail = MockRegisterWithEmail();
    mockRegisterUserData = MockRegisterUserData();
    mockFirebaseUser = MockFirebaseUser();

    bloc = RegisterBloc(
      registerWithEmail: mockRegisterWithEmail,
      registerUserData: mockRegisterUserData,
    );
  });

  test('Estado inicial deve ser RegisterInitial', () {
    // assert
    expect(bloc.state, equals(RegisterInitial()));
  });

  group('RegisterEmailStarted', () {
    final tEmail = 'teste@email.com';
    final tPass = 'teste123';
    final tAuthUser = AuthUser(firebaseUser: mockFirebaseUser);

    final tMessage = 'O seu endereço de email parece estar incorreto.';

    test(
      'Deve pegar os dados chamando o usecase RegisterWithEmail',
      () async {
        // arrange
        when(mockRegisterWithEmail(any))
            .thenAnswer((_) async => Right(tAuthUser));
        // act
        bloc.add(
          RegisterEmailStarted(
            email: tEmail,
            password: tPass,
            passwordRepeat: tPass,
          ),
        );
        await untilCalled(mockRegisterWithEmail(any));
        // assert
        verify(
            mockRegisterWithEmail(AuthParams(email: tEmail, password: tPass)));
      },
    );

    blocTest<RegisterBloc, RegisterEvent, RegisterState>(
      'Deve emitir [RegisterLoadInProgress, RegisterSucess] quando conseguir pegar os dados',
      build: () async {
        when(mockRegisterWithEmail(any))
            .thenAnswer((_) async => Right(tAuthUser));
        return bloc;
      },
      act: (bloc) async => bloc.add(
        RegisterEmailStarted(
          email: tEmail,
          password: tPass,
          passwordRepeat: tPass,
        ),
      ),
      expect: <dynamic>[
        isA<RegisterLoadInProgress>(),
        isA<RegisterSuccess>(),
      ],
    );

    blocTest(
      'Deve emitir [RegisterLoadInProgress, RegisterFailure] quando não conseguir pegar os dados',
      build: () async {
        when(mockRegisterWithEmail(any)).thenAnswer(
            (_) async => Left(FirebaseRegisterFailure(message: tMessage)));
        return bloc;
      },
      act: (bloc) async => bloc.add(
        RegisterEmailStarted(
          email: tEmail,
          password: tPass,
          passwordRepeat: tPass,
        ),
      ),
      expect: <dynamic>[
        isA<RegisterLoadInProgress>(),
        isA<RegisterFailure>(),
      ],
    );
  });
}
