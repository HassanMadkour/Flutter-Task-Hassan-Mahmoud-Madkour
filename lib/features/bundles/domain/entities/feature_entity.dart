import 'package:flutter/widgets.dart';

class FeatureEntity {
  final String name;
  final String? note;
  final int icon;

  FeatureEntity({required this.name, this.note, required this.icon});

  IconData get iconData => IconData(icon);
  // convert icon date to int
}
