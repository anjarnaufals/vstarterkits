import 'package:either_dart/either.dart';

import '../../domain.dart';


abstract class SomethingRepository {
  Future<Either<Failure, BaseRes<Something>>> getSomething();
}
