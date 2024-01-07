import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
extension ThemeX on BuildContext {
  ///
  ThemeData get theme => Theme.of(this);
}

///
extension TextThemeX on BuildContext {
  ///
  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;
}
