import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_twitter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockLoginRepository mockLoginRepository;
  MockFirebaseUser mockFirebaseUser;
  LoginWithTwitter loginWithTwitter;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    mockFirebaseUser = MockFirebaseUser();
    loginWithTwitter = LoginWithTwitter(mockLoginRepository);
  });

  final tFirebaseUser = mockFirebaseUser;

  test('Deve logar o usuário com a conta do Twitter', () async {
    // Arrange
    when(mockLoginRepository.loginWithTwitter())
        .thenAnswer((_) async => Right(tFirebaseUser));
    // Act
    final result = await loginWithTwitter(NoParams());
    // Assert
    expect(result, Right(tFirebaseUser));
    verify(mockLoginRepository.loginWithTwitter());
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
