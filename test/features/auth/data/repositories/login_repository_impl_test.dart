import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/core/info/network_info.dart';
import 'package:hiso/features/auth/data/datasources/login_datasource.dart';
import 'package:hiso/features/auth/data/repositories/login_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockLoginDataSource extends Mock implements LoginDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  LoginRepositoryImpl repository;
  MockLoginDataSource mockLoginDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockFirebaseUser mockFirebaseUser;

  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockFirebaseUser = MockFirebaseUser();
    repository = LoginRepositoryImpl(
      loginDataSource: mockLoginDataSource,
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

  group('loginWithEmail', () {
    final tEmail = 'teste@email.com';
    final tPass = 'senhateste123';
    final tFirebaseUser = mockFirebaseUser;

    test(
      'Deve verificar se o dispositivo está online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.loginWithEmail(tEmail, tPass);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'Deve retornar um FirebaseUser quando houver sucesso no login com Email',
        () async {
          // arrange
          when(mockLoginDataSource.loginWithEmail(any, any))
              .thenAnswer((_) async => tFirebaseUser);
          // act
          final result = await repository.loginWithEmail(tEmail, tPass);
          // assert
          verify(mockLoginDataSource.loginWithEmail(tEmail, tPass));
          expect(result, equals(Right(tFirebaseUser)));
        },
      );

      test(
        'Deve retornar FirebaseLoginFailure quando houver falha no login com Email',
        () async {
          // arrange
          when(mockLoginDataSource.loginWithEmail(any, any))
              .thenThrow(FirebaseLoginException(code: 'ERROR_INVALID_EMAIL'));
          // act
          final result = await repository.loginWithEmail(tEmail, tPass);
          // assert
          verify(mockLoginDataSource.loginWithEmail(tEmail, tPass));
          expect(
              result,
              equals(Left(FirebaseLoginFailure(
                  message:
                      'O seu endereço de email parece estar incorreto.'))));
        },
      );
    });
  });

  group('loginWithGoogle', () {
    final tFirebaseUser = mockFirebaseUser;

    test(
      'Deve verificar se o dispositivo está online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.loginWithGoogle();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'Deve retornar um FirebaseUser quando houver sucesso no login com Google',
        () async {
          // arrange
          when(mockLoginDataSource.loginWithGoogle())
              .thenAnswer((_) async => tFirebaseUser);
          // act
          final result = await repository.loginWithGoogle();
          // assert
          verify(mockLoginDataSource.loginWithGoogle());
          expect(result, equals(Right(tFirebaseUser)));
        },
      );

      test(
        'Deve retornar FirebaseLoginFailure quando houver falha no login com Google',
        () async {
          // arrange
          when(mockLoginDataSource.loginWithGoogle()).thenThrow(
              FirebaseLoginException(
                  code: 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL'));
          // act
          final result = await repository.loginWithGoogle();
          // assert
          verify(mockLoginDataSource.loginWithGoogle());
          expect(
              result,
              equals(Left(FirebaseLoginFailure(
                  message:
                      'If there already exists an account with the email address asserted by Google.'))));
        },
      );
    });
  });
}
