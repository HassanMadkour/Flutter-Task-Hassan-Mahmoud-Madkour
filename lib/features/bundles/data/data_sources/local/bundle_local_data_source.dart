import 'package:flutter_task/core/utils/db_service.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';

abstract class BundleLocalDataSource {
  Future<List<BundleEntity>> getAllBundles();
}

class BundleLocalDataSourceImpl implements BundleLocalDataSource {
  final DatabaseService databaseService;

  BundleLocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<BundleEntity>> getAllBundles() async {
    return await databaseService.getAllBundles();
  }
}
