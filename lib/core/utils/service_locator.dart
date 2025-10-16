import 'package:flutter_task/core/utils/db_service.dart';
import 'package:flutter_task/features/bundles/data/data_sources/bundle_local_data_source.dart';
import 'package:flutter_task/features/bundles/data/repositories/bundle_repository_impl.dart';
import 'package:flutter_task/features/bundles/domain/repositories/bundle_repository.dart';
import 'package:flutter_task/features/bundles/domain/usecases/get_all_bundles_use_case.dart';
import 'package:flutter_task/features/home/data/data_sources/category_local_data_source.dart';
import 'package:flutter_task/features/home/data/data_sources/product_local_data_source.dart';
import 'package:flutter_task/features/home/data/repositories/category_repository_impl.dart';
import 'package:flutter_task/features/home/data/repositories/product_repository_impl.dart';
import 'package:flutter_task/features/home/domain/repositories/category_repository.dart';
import 'package:flutter_task/features/home/domain/repositories/product_repository.dart';
import 'package:flutter_task/features/home/domain/usecases/get_all_categories_use_case.dart';
import 'package:flutter_task/features/home/domain/usecases/get_all_products_use_case.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  static ServiceLocator get instance => _instance;

  ServiceLocator._internal();
  final getIt = GetIt.instance;
  void init() {
    getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
    getIt.registerLazySingleton<ProductLocalDataSource>(
      () =>
          ProductLocalDataSourceImpl(databaseService: getIt<DatabaseService>()),
    );
    getIt.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl(
        databaseService: getIt<DatabaseService>(),
      ),
    );
    getIt.registerLazySingleton<BundleLocalDataSource>(
      () =>
          BundleLocalDataSourceImpl(databaseService: getIt<DatabaseService>()),
    );
    getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
        localDataSource: getIt<ProductLocalDataSource>(),
      ),
    );
    getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(
        localDataSource: getIt<CategoryLocalDataSource>(),
      ),
    );
    getIt.registerLazySingleton<BundleRepository>(
      () =>
          BundleRepositoryImpl(localDataSource: getIt<BundleLocalDataSource>()),
    );
    getIt.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(getIt<ProductRepository>()),
    );
    getIt.registerLazySingleton<GetAllCategoriesUseCase>(
      () => GetAllCategoriesUseCase(getIt<CategoryRepository>()),
    );
    getIt.registerLazySingleton<GetAllBundlesUseCase>(
      () => GetAllBundlesUseCase(getIt<BundleRepository>()),
    );
  }
}
