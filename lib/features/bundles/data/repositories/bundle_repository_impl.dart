import 'package:flutter_task/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';
import 'package:flutter_task/features/bundles/domain/repositories/bundle_repository.dart';
import 'package:flutter_task/features/bundles/data/data_sources/bundle_local_data_source.dart';

class BundleRepositoryImpl implements BundleRepository {
  final BundleLocalDataSource localDataSource;

  BundleRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<BundleEntity>>> getAllBundles() async {
    try {
      final bundles = await localDataSource.getAllBundles();
      return Right(bundles);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to load bundles: $e'));
    }
  }
}
