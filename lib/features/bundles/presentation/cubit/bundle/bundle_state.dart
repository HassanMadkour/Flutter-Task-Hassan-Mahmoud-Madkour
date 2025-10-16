import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';

abstract class BundleState {
  const BundleState();
}

class BundleInitial extends BundleState {}

class BundleLoading extends BundleState {}

class BundleLoaded extends BundleState {
  final List<BundleEntity> bundles;

  const BundleLoaded(this.bundles);
}

class BundleError extends BundleState {
  final String message;

  const BundleError(this.message);
}
