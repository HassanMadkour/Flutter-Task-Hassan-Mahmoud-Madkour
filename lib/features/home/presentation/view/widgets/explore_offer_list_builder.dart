import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_card.dart';

class ExploreOfferListBuilder extends StatefulWidget {
  const ExploreOfferListBuilder({super.key});

  @override
  State<ExploreOfferListBuilder> createState() =>
      _ExploreOfferListBuilderState();
}

class _ExploreOfferListBuilderState extends State<ExploreOfferListBuilder> {
  final List<String> offerList = [
    'كل العروض',
    'ملايس',
    'اكسسوارات',
    'الكترونيات',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        padding: const EdgeInsets.only(right: 16),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        scrollDirection: Axis.horizontal,
        itemCount: offerList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: ExploreCard(
              title: offerList[index],
              isSelected: index == selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
