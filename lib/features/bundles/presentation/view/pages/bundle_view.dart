import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/core/utils/app_router.dart';
import 'package:flutter_task/core/utils/service_locator.dart';
import 'package:flutter_task/core/widgets/custom_button.dart';
import 'package:flutter_task/features/bundles/domain/usecases/get_all_bundles_use_case.dart';
import 'package:flutter_task/features/bundles/presentation/cubit/bundle/bundle_cubit.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/user_custom_bundle.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/bundle_builder.dart';
import 'package:go_router/go_router.dart';

class BundleView extends StatefulWidget {
  const BundleView({super.key});

  @override
  State<BundleView> createState() => BundleViewState();
}

class BundleViewState extends State<BundleView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BundleCubit(
        getAllBundlesUseCase: ServiceLocator.instance
            .getIt<GetAllBundlesUseCase>(),
      )..getBundles(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    spacing: 12,
                    children: [
                      InkWell(
                        onTap: () => GoRouter.of(context).pop(),
                        child: Icon(Icons.arrow_back_ios_outlined, size: 12),
                      ),
                      Text(
                        "أختر الباقات اللى تناسبك",
                        style: AppFontStyle.tajawalMedium24,
                      ),
                    ],
                  ),
                  Text(
                    "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
                    style: AppFontStyle.tajawalRegular14,
                  ),
                  SizedBox(height: 20),
                  BundleBuilder(),
                  SizedBox(height: 20),
                  UserCustomBundle(),
                  SizedBox(height: 40),

                  CustomButton(
                    onPressed: () =>
                        GoRouter.of(context).push(AppRouter.filterRoute),
                    text: "التالي",
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
