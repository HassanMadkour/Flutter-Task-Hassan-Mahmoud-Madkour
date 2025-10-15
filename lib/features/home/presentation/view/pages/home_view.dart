import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_item.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_section.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [ExploreSection(), CategorySection()]),
        ),
      ),
    );
  }
}
