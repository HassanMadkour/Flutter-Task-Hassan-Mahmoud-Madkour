import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/bundles/presentation/cubit/bundle/bundle_cubit.dart';
import 'package:flutter_task/features/bundles/presentation/cubit/bundle/bundle_state.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/bundle_card.dart';

class BundleBuilder extends StatelessWidget {
  const BundleBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BundleCubit, BundleState>(
      builder: (context, state) {
        if (state is BundleLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.bundles.length,
            itemBuilder: (context, index) {
              return BundleCard(bundleEntity: state.bundles[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 24);
            },
          );
        } else if (state is BundleError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
