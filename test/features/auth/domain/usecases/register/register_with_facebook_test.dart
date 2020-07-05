import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_facebook.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRegisterRepository extends Mock implements RegisterRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockRegisterRepository mockRegisterRepository;
  MockFirebaseUser mockFirebaseUser;
  RegisterWithFacebook registerWithFacebook;

  setUp(() {
    mockRegisterRepository = MockRegisterRepository();
    mockFirebaseUser = MockFirebaseUser();
    registerWithFacebook = RegisterWithFacebook(mockRegisterRepository);
  });

  final tAuthUser = AuthUser(firebaseUser: mockFirebaseUser);

  test('Deve criar conta do usuário com facebook', () async {
    // Arrange
    when(mockRegisterRepository.registerWithFacebook())
        .thenAnswer((_) async => Right(tAuthUser));
    // Act
    final result = await registerWithFacebook(NoParams());
    // Assert
    expect(result, Right(tAuthUser));
    verify(mockRegisterRepository.registerWithFacebook());
    verifyNoMoreInteractions(mockRegisterRepository);
  });
}
