import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryItem();
        },
      ),
    );
  }
}
