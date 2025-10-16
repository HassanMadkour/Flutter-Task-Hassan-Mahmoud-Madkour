import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/usecases/usecase.dart';
import 'package:flutter_task/features/bundles/domain/usecases/get_all_bundles_use_case.dart';
import 'package:flutter_task/features/bundles/presentation/cubit/bundle/bundle_state.dart';

class BundleCubit extends Cubit<BundleState> {
  final GetAllBundlesUseCase getAllBundlesUseCase;

  BundleCubit({required this.getAllBundlesUseCase}) : super(BundleInitial());

  Future<void> getBundles() async {
    emit(BundleLoading());
    final result = await getAllBundlesUseCase(NoParams());

    result.fold(
      (failure) => emit(BundleError(failure.message)),
      (bundles) => emit(BundleLoaded(bundles)),
    );
  }
}
