import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_email.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRegisterRepository extends Mock implements RegisterRepository {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  MockRegisterRepository mockRegisterRepository;
  MockFirebaseUser mockFirebaseUser;
  RegisterWithEmail registerWithEmail;

  setUp(() {
    mockRegisterRepository = MockRegisterRepository();
    mockFirebaseUser = MockFirebaseUser();
    registerWithEmail = RegisterWithEmail(mockRegisterRepository);
  });

  final tEmail = 'llucasmendes@hotmail.com';
  final tPass = 'formigaatomica';
  final tFirebaseUser = mockFirebaseUser;

  test('Deve criar conta do usuário com e-mail', () async {
    // Arrange
    when(mockRegisterRepository.registerWithEmail(any, any))
        .thenAnswer((_) async => Right(tFirebaseUser));
    // Act
    final result = await registerWithEmail(Params(
      email: tEmail,
      password: tPass,
    ));
    // Assert
    expect(result, Right(tFirebaseUser));
    verify(mockRegisterRepository.registerWithEmail(tEmail, tPass));
    verifyNoMoreInteractions(mockRegisterRepository);
  });
}
