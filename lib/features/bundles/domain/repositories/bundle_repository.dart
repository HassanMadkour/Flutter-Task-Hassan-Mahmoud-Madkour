import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';

abstract class BundleRepository {
  Future<List<BundleEntity>> getAllBundles();
}
