import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/products_sliver_grid.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/offer_row.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_section.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ExploreSection()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CategorySection()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: OfferRow()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            ProductsSliverGrid(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          fixedColor: AppColors.blackOpacity50,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'محادثة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'اضف اعلان',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'اعلاناتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}
