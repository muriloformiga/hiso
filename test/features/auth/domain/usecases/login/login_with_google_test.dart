import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_google.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockLoginRepository mockLoginRepository;
  MockFirebaseUser mockFirebaseUser;
  LoginWithGoogle loginWithGoogle;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    mockFirebaseUser = MockFirebaseUser();
    loginWithGoogle = LoginWithGoogle(mockLoginRepository);
  });

  final tFirebaseUser = mockFirebaseUser;

  test('Deve logar o usuário com a conta do Google', () async {
    // Arrange
    when(mockLoginRepository.loginWithGoogle())
        .thenAnswer((_) async => Right(tFirebaseUser));
    // Act
    final result = await loginWithGoogle(NoParams());
    // Assert
    expect(result, Right(tFirebaseUser));
    verify(mockLoginRepository.loginWithGoogle());
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
