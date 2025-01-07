import 'package:either_dart/either.dart';
import 'package:v_starter_kits/domain/domain.dart';
import 'package:v_starter_kits/domain/src/entity_helper/pages.dart';

abstract class SomethingUseCase {
  Future<Either<Failure, Pages<Something>>> getPage();
}
