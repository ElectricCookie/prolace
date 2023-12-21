import 'package:flutter/material.dart';

Color borderColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1);
}

Color mutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4);
}

Color cardColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return !isDark ? Colors.white : Colors.black.withOpacity(0.1);
}

Color cardColorSecondary(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return !isDark ? Colors.grey.shade100 : Colors.grey.shade900;
}

Color textColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? Colors.white : Colors.black;
}

Color navigationBarColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? Colors.grey.shade900 : Colors.grey.shade200;
}

Color shadowColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.2);
}
