import 'package:either_dart/either.dart';

import '../../domain/domain.dart';

class SomethingRepositoryImpl implements SomethingRepository {
  @override
  Future<Either<Failure, BaseRes<Something>>> getSomething() {
    throw UnimplementedError();
  }
}
