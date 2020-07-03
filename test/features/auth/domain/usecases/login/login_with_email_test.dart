import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_email.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockLoginRepository mockLoginRepository;
  MockFirebaseUser mockFirebaseUser;
  LoginWithEmail loginWithEmail;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    mockFirebaseUser = MockFirebaseUser();
    loginWithEmail = LoginWithEmail(mockLoginRepository);
  });

  final tEmail = 'teste@email.com';
  final tPass = 'senhateste123';
  final tFirebaseUser = mockFirebaseUser;

  test('Deve logar o usuário com e-mail', () async {
    // Arrange
    when(mockLoginRepository.loginWithEmail(any, any))
        .thenAnswer((_) async => Right(tFirebaseUser));
    // Act
    final result = await loginWithEmail(Params(
      email: tEmail,
      password: tPass,
    ));
    // Assert
    expect(result, Right(tFirebaseUser));
    verify(mockLoginRepository.loginWithEmail(tEmail, tPass));
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
