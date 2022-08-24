import 'package:flutter/material.dart';

@immutable
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color? statusAlive;
  final Color? statusDead;
  final Color? statusUnknown;
  final Color? footerGrid;
  final Color? separateLine;

  const CustomThemeColors({
    required this.statusAlive,
    required this.statusDead,
    required this.statusUnknown,
    required this.footerGrid,
    required this.separateLine,
  });

  Color? getStatusColor(String? status) {
    if (status == 'Alive') {
      return statusAlive; //Colors.green;
    }
    if (status == 'Dead') {
      return statusDead; //Colors.red;
    }
    return statusUnknown; //Colors.orange;
  }

  @override
  ThemeExtension<CustomThemeColors> copyWith({
    Color? statusAlive,
    Color? statusDead,
    Color? statusUnknown,
    Color? footerGrid,
    Color? separateLine,
  }) {
    return CustomThemeColors(
      statusAlive: statusAlive ?? this.statusAlive,
      statusDead: statusDead ?? this.statusDead,
      statusUnknown: statusUnknown ?? this.statusUnknown,
      footerGrid: footerGrid ?? this.footerGrid,
      separateLine: separateLine ?? this.separateLine,
    );
  }

  @override
  ThemeExtension<CustomThemeColors> lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }
    return CustomThemeColors(
        statusAlive: Color.lerp(statusAlive, other.statusAlive, t),
        statusDead: Color.lerp(statusDead, other.statusDead, t),
        statusUnknown: Color.lerp(statusUnknown, other.statusUnknown, t),
        footerGrid: Color.lerp(footerGrid, other.footerGrid, t),
        separateLine: Color.lerp(separateLine, other.separateLine, t));
  }

  static const light = CustomThemeColors(
    statusAlive: Colors.green,
    statusDead: Colors.red,
    statusUnknown: Colors.orange,
    footerGrid: Color.fromARGB(205, 0, 0, 0),
    separateLine: Colors.blueGrey,
  );

  static const dark = CustomThemeColors(
      statusAlive: Colors.lightGreenAccent,
      statusDead: Colors.pinkAccent,
      statusUnknown: Colors.orangeAccent,
      footerGrid: Color.fromARGB(205, 0, 0, 0),
      separateLine: Colors.indigo);
}
