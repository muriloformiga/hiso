import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_facebook.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockLoginRepository mockLoginRepository;
  MockFirebaseUser mockFirebaseUser;
  LoginWithFacebook loginWithFacebook;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    mockFirebaseUser = MockFirebaseUser();
    loginWithFacebook = LoginWithFacebook(mockLoginRepository);
  });

  final tFirebaseUser = mockFirebaseUser;

  test('Deve logar o usuário com a conta do Facebook', () async {
    // Arrange
    when(mockLoginRepository.loginWithFacebook())
        .thenAnswer((_) async => Right(tFirebaseUser));
    // Act
    final result = await loginWithFacebook(NoParams());
    // Assert
    expect(result, Right(tFirebaseUser));
    verify(mockLoginRepository.loginWithFacebook());
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
