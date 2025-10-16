import 'package:flutter/material.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/rabbon.dart';

class RibbonBanner extends StatelessWidget {
  final Color? color;
  final double height;
  final Widget? child;

  const RibbonBanner({super.key, this.color, required this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: RibbonPainter(color: color!),
        child: Center(child: child),
      ),
    );
  }
}
