import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/core/info/network_info.dart';
import 'package:hiso/features/auth/data/datasources/register_datasource.dart';
import 'package:hiso/features/auth/data/repositories/register_repository_impl.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:mockito/mockito.dart';

class MockRegisterDataSource extends Mock implements RegisterDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  RegisterRepositoryImpl repository;
  MockRegisterDataSource mockRegisterDataSource;
  MockFirebaseUser mockFirebaseUser;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRegisterDataSource = MockRegisterDataSource();
    mockFirebaseUser = MockFirebaseUser();
    mockNetworkInfo = MockNetworkInfo();
    repository = RegisterRepositoryImpl(
      registerDataSource: mockRegisterDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('Dispositivo está online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  group('registerWithEmail', () {
    final tEmail = 'teste@email.com';
    final tPass = '123456';
    final tAuthUser = AuthUser(firebaseUser: mockFirebaseUser);

    test(
      'Deve verificar se o dispositivo está online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.registerWithEmail(tEmail, tPass);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'Deve retornar um User quando houver sucesso no registro',
        () async {
          // arrange
          when(mockRegisterDataSource.registerWithEmail(any, any))
              .thenAnswer((_) async => tAuthUser);
          // act
          final result = await repository.registerWithEmail(tEmail, tPass);
          // assert
          verify(mockRegisterDataSource.registerWithEmail(tEmail, tPass));
          expect(result, equals(Right(tAuthUser)));
        },
      );

      test(
        'Deve retornar ServerFailure quando houver falha na conexão ao servidor',
        () async {
          // arrange
          when(mockRegisterDataSource.registerWithEmail(any, any)).thenThrow(
              FirebaseRegisterException(code: 'ERROR_EMAIL_ALREADY_IN_USE'));
          // act
          final result = await repository.registerWithEmail(tEmail, tPass);
          // assert
          verify(mockRegisterDataSource.registerWithEmail(tEmail, tPass));
          expect(
              result,
              equals(Left(FirebaseLoginFailure(
                  message:
                      'Já existe uma conta associada a esse endereço de e-mail.'))));
        },
      );
    });
  });
}
