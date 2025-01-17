import 'package:either_dart/either.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:v_starter_kits/domain/domain.dart';

import 'repository_test.mocks.dart';

@GenerateMocks([SomethingRepository])
@GenerateMocks([SomethingRepositoryWithoutBaseRes])
void main() {
  late MockSomethingRepository mockSomethingRepository;
  late MockSomethingRepositoryWithoutBaseRes
      mockSomethingRepositoryWithoutBaseRes;

  setUp(() {
    mockSomethingRepository = MockSomethingRepository();
    mockSomethingRepositoryWithoutBaseRes =
        MockSomethingRepositoryWithoutBaseRes();
  });

  group('getSomething', () {
    const tSomething = Something();

    final tBaseRes = BaseRes<Something>(data: tSomething);

    provideDummy<Either<Failure, BaseRes<Something>>>(Right(tBaseRes));
    provideDummy<Either<Failure, Something>>(Right(tSomething));

    test('should return BaseRes<Something> on success', () async {
      // Arrange
      when(mockSomethingRepository.getSomething())
          .thenAnswer((_) async => Right(tBaseRes));

      // Act
      final result = await mockSomethingRepository.getSomething();

      // Assert
      expect(result, Right(tBaseRes));
      verify(mockSomethingRepository.getSomething()).called(1);
      verifyNoMoreInteractions(mockSomethingRepository);
    });

    test('should return Failure on error', () async {
      // Arrange
      const tFailure = Failure(message: 'Error occurred');

      when(mockSomethingRepository.getSomething())
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await mockSomethingRepository.getSomething();

      // Assert
      expect(result, Left(tFailure));
      verify(mockSomethingRepository.getSomething()).called(1);
      verifyNoMoreInteractions(mockSomethingRepository);
    });

    test('should return Something on success', () async {
      // Arrange
      when(mockSomethingRepositoryWithoutBaseRes.getSomething())
          .thenAnswer((_) async => Right(tSomething));

      // Act
      final result = await mockSomethingRepositoryWithoutBaseRes.getSomething();

      // Assert
      expect(result, Right(tSomething));
      verify(mockSomethingRepositoryWithoutBaseRes.getSomething()).called(1);
      verifyNoMoreInteractions(mockSomethingRepositoryWithoutBaseRes);
    });

    test('should return Failure on error', () async {
      // Arrange
      const tFailure = Failure(message: 'Error occurred');

      when(mockSomethingRepositoryWithoutBaseRes.getSomething())
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await mockSomethingRepositoryWithoutBaseRes.getSomething();

      // Assert
      expect(result, Left(tFailure));
      verify(mockSomethingRepositoryWithoutBaseRes.getSomething()).called(1);
      verifyNoMoreInteractions(mockSomethingRepositoryWithoutBaseRes);
    });
  });
}
