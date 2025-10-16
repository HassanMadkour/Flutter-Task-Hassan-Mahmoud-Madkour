import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/error/failures.dart';
import 'package:flutter_task/core/usecases/usecase.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';
import 'package:flutter_task/features/bundles/domain/repositories/bundle_repository.dart';

class GetAllBundlesUseCase implements UseCase<List<BundleEntity>, NoParams> {
  final BundleRepository repository;

  GetAllBundlesUseCase(this.repository);

  @override
  Future<Either<Failure, List<BundleEntity>>> call(NoParams params) async {
    return await repository.getAllBundles();
  }
}
