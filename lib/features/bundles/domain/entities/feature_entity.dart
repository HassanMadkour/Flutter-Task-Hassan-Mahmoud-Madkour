import 'package:flutter/widgets.dart';
import 'package:material_symbols_icons/symbols.dart';

class FeatureEntity {
  final String name;
  final String? note;
  final int icon;

  FeatureEntity({required this.name, this.note, required this.icon});

  IconData get iconData => icons[icon];

  final List<IconData> icons = [
    Symbols.acute,
    Symbols.rocket,
    Symbols.push_pin,
    Symbols.globe,
    Symbols.workspace_premium,
  ];
}
