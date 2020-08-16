import 'package:dartz/dartz.dart';
import 'package:hiso/features/settings/domain/repositories/logout_repository.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/settings/domain/usecases/logout/logout.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLogoutRepository extends Mock implements LogoutRepository {}

void main() {
  MockLogoutRepository mockLogoutRepository;
  Logout logout;

  setUp(() {
    mockLogoutRepository = MockLogoutRepository();
    logout = Logout(mockLogoutRepository);
  });

  void tLogout;

  test('Deve deslogar o usuário', () async {
    // Arrange
    when(mockLogoutRepository.logout()).thenAnswer((_) async => Right(tLogout));
    // Act
    final result = await logout(NoParams());
    // Assert
    expect(result, Right(tLogout));
    verify(mockLogoutRepository.logout());
    verifyNoMoreInteractions(mockLogoutRepository);
  });
}
