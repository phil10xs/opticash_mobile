import 'package:flutter/material.dart';

class BottomNavModel {
  final String? label;
  final String? tooltip;
  final Widget? views;
  final String? icon;
  final String? iconActive;

  const BottomNavModel({
    this.label,
    this.tooltip,
    this.views,
    this.icon,
    this.iconActive,
  });

  factory BottomNavModel.fromJson(Map<String, dynamic> map) => BottomNavModel(
        icon: map['icon'],
        label: map['label'],
        tooltip: map['tooltip'],
        views: map['view'],
        iconActive: map['iconActive'],
      );
}
