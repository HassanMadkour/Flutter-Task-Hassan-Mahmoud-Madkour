import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/view/pages/filter_chip.dart';

class CustomWrapBuilder extends StatefulWidget {
  const CustomWrapBuilder({super.key, required this.items});
  final List<String> items;

  @override
  State<CustomWrapBuilder> createState() => _CustomWrapBuilderState();
}

class _CustomWrapBuilderState extends State<CustomWrapBuilder> {
  int selectedChipIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: widget.items
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChipIndex = index;
                  });
                },
                child: CustomFilterChip(
                  label: e,
                  selected: selectedChipIndex == index,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
