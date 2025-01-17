import 'package:either_dart/either.dart';

import '../../domain.dart';

abstract class SomethingRepositoryWithoutBaseRes {
  Future<Either<Failure, Something>> getSomething();
}
