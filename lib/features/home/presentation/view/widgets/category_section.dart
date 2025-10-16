import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';
import 'package:flutter_task/features/home/presentation/cubits/category/category_cubit.dart';
import 'package:flutter_task/features/home/presentation/cubits/category/category_state.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoaded) {
            return CategoryBuilder(categories: state.categories);
          } else if (state is CategoryError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key, required this.categories});
  final List<CategoryEntity> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(right: 16),
      separatorBuilder: (context, index) {
        return const SizedBox(width: 12);
      },
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(category: categories[index]);
      },
    );
  }
}
