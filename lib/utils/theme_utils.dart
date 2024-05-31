import 'package:flutter/material.dart';

extension ThemeUtils on BuildContext {
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get iconColor => Theme.of(this).colorScheme.primary;
  Color get cardColor => Theme.of(this).cardColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  TextStyle? get caption => Theme.of(this).textTheme.caption;
  TextStyle? get overline => Theme.of(this).textTheme.overline;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}