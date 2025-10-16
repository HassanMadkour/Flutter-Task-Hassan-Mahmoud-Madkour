import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/error/failures.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';

abstract class BundleRepository {
  Future<Either<Failure, List<BundleEntity>>> getAllBundles();
}
