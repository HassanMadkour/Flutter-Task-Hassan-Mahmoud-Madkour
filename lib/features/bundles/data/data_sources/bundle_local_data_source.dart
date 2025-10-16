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

    // Get all bundles
    final List<Map<String, dynamic>> bundlesMaps = await db.query(
      'bundles',
      orderBy: 'id ASC',
    );

    final List<BundleEntity> bundles = [];

    for (final bundleMap in bundlesMaps) {
      final bundleId = bundleMap['id'] as int;

      // Get features through the bundleFeature junction table
      final featureMaps = await db.rawQuery(
        '''
        SELECT f.* FROM features f
        INNER JOIN bundleFeature bf ON f.id = bf.featureId
        WHERE bf.bundleId = ?
      ''',
        [bundleId],
      );

      final features = featureMaps.map((e) => FeatureModel.fromDb(e)).toList();

      final bundle = BundleModel.fromDb(bundleMap, features);
      bundles.add(bundle.toEntity());
    }

    return bundles;
  }
}
