import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/settings/data/datasources/logout_datasource.dart';
import 'package:hiso/features/settings/data/repositories/logout_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockLogoutDataSource extends Mock implements LogoutDataSource {}

void main() {
  LogoutRepositoryImpl repository;
  MockLogoutDataSource mockLogoutDataSource;

  setUp(() {
    mockLogoutDataSource = MockLogoutDataSource();
    repository = LogoutRepositoryImpl(
      logoutDataSource: mockLogoutDataSource,
    );
  });

  group('logout', () {
    void logout;
    test(
      'Deve encerrar a sessão de usuário do Firebase',
      () async {
        // arrange
        when(mockLogoutDataSource.logout()).thenAnswer((_) async => logout);
        // act
        final result = await repository.logout();
        // assert
        verify(mockLogoutDataSource.logout());
        expect(result, equals(Right(logout)));
      },
    );

    test(
      'Deve retornar FirebaseLogoutFailure quando não conseguir encerrar a sessão de usuário do Firebase',
      () async {
        // arrange
        when(mockLogoutDataSource.logout())
            .thenThrow(FirebaseLogoutException());
        // act
        final result = await repository.logout();
        // assert
        verify(mockLogoutDataSource.logout());
        expect(
            result,
            equals(Left(FirebaseLogoutFailure(
                message: 'Falha ao sair, reinicie a aplicação.'))));
      },
    );
  });
}
