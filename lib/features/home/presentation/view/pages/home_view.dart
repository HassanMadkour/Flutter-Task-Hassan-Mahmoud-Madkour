import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/service_locator.dart';
import 'package:flutter_task/features/home/domain/usecases/get_all_categories_use_case.dart';
import 'package:flutter_task/features/home/domain/usecases/get_all_products_use_case.dart';
import 'package:flutter_task/features/home/presentation/cubits/category/category_cubit.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/products_list_builder.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/bottom_bar.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/offer_row.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_section.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_section.dart';
import 'package:flutter_task/features/home/presentation/cubits/product/product_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            getAllProductsUseCase: ServiceLocator.instance
                .getIt<GetAllProductsUseCase>(),
          )..getProducts(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            getAllCategoriesUseCase: ServiceLocator.instance
                .getIt<GetAllCategoriesUseCase>(),
          )..getCategories(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ExploreSection()),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: CategorySection()),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: OfferRow()),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              ProductsListBuilder(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
