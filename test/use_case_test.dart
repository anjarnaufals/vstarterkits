import 'package:either_dart/either.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:v_starter_kits/domain/domain.dart';
import 'package:v_starter_kits/domain/src/entity_helper/pages.dart';

import 'use_case_test.mocks.dart';

@GenerateMocks([SomethingUseCase])
void main() {
  late MockSomethingUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockSomethingUseCase();
  });

  group('getPage', () {
    final tSomething = Something();
    final tPages = Pages<Something>(data: tSomething);
    provideDummy<Either<Failure, Pages<Something>>>(Right(tPages));

    test('should return Pages<Something> on success', () async {
      // Arrange
      when(mockUseCase.getPage()).thenAnswer((_) async => Right(tPages));

      // Act
      final result = await mockUseCase.getPage();

      // Assert
      expect(result, Right(tPages));
      verify(mockUseCase.getPage()).called(1);
      verifyNoMoreInteractions(mockUseCase);
    });

    test('should return Failure on error', () async {
      // Arrange
      const tFailure = Failure(message: 'Error occurred');
      when(mockUseCase.getPage()).thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await mockUseCase.getPage();

      // Assert
      expect(result, Left(tFailure));
      verify(mockUseCase.getPage()).called(1);
      verifyNoMoreInteractions(mockUseCase);
    });
  });
}
