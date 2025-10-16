import 'package:flutter_task/core/utils/db_service.dart';
import 'package:flutter_task/features/bundles/data/models/bundle_model.dart';
import 'package:flutter_task/features/bundles/data/models/feature_model.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';

abstract class BundleLocalDataSource {
  Future<List<BundleEntity>> getAllBundles();
}

class BundleLocalDataSourceImpl implements BundleLocalDataSource {
  final DatabaseService databaseService;

  BundleLocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<BundleEntity>> getAllBundles() async {
    final db = await databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bundles',
      orderBy: 'id ASC',
    );

    final List<BundleEntity> bundles = [];

    for (final bundleMap in maps) {
      final featuresMaps = await db.query(
        'features',
        where: 'bundleId = ?',
        whereArgs: [bundleMap['id']],
      );
      final bundle = BundleModel.fromDb(
        bundleMap,
        featuresMaps.map((e) => FeatureModel.fromDb(e)).toList(),
      );
      bundles.add(bundle.toEntity());
    }

    return bundles;
  }
}
