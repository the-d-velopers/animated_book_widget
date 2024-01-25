import 'package:flutter/material.dart';

/// Extension methods for accessing theme-related
/// properties within a [BuildContext].
extension ThemeX on BuildContext {
  /// Gets the [ThemeData] from the current theme.
  ThemeData get theme => Theme.of(this);
}

/// Extension methods for accessing text-related
/// properties within a [BuildContext].
extension TextThemeX on BuildContext {
  /// Gets the default [TextStyle] from the current [DefaultTextStyle].
  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;
}
