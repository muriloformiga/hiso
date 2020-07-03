import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_twitter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRegisterRepository extends Mock implements RegisterRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockRegisterRepository mockRegisterRepository;
  MockFirebaseUser mockFirebaseUser;
  RegisterWithTwitter registerWithTwitter;

  setUp(() {
    mockRegisterRepository = MockRegisterRepository();
    mockFirebaseUser = MockFirebaseUser();
    registerWithTwitter = RegisterWithTwitter(mockRegisterRepository);
  });

  final tFirebaseUser = mockFirebaseUser;

  test('Deve criar conta do usuário com twitter', () async {
    // Arrange
    when(mockRegisterRepository.registerWithTwitter())
        .thenAnswer((_) async => Right(tFirebaseUser));
    // Act
    final result = await registerWithTwitter(NoParams());
    // Assert
    expect(result, Right(tFirebaseUser));
    verify(mockRegisterRepository.registerWithTwitter());
    verifyNoMoreInteractions(mockRegisterRepository);
  });
}
