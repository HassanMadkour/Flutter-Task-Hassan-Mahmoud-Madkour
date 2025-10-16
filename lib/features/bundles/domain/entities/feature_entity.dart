import 'package:flutter/widgets.dart';

class FeatureEntity {
  final String name;
  final String? note;
  final int icon;

  FeatureEntity(this.name, this.note, this.icon);

  IconData get iconData => IconData(icon);
}
