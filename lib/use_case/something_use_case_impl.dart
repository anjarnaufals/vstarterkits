import 'package:either_dart/either.dart';
import 'package:v_starter_kits/domain/src/entity_helper/pages.dart';

import '../domain/domain.dart';

class SomethingUseCaseImpl implements SomethingUseCase {
  @override
  Future<Either<Failure, Pages<Something>>> getPage() {
    // TODO: implement getPage
    throw UnimplementedError();
  }
}
