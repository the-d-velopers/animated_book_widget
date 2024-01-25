import 'package:flutter/material.dart';

/// A Flutter widget that provides a blurred background
/// effect with customizable properties.
class BackgroundBlur extends StatelessWidget {
  /// Creates a [BackgroundBlur] widget.
  ///
  /// The [backgroundColor] is the base color of the background.
  ///
  /// The [backgroundShadowColor] is the color of the shadow
  /// applied to the background.
  ///
  /// The [blurRadius] determines the amount of blur applied to the background.
  ///
  /// The [spreadRadius] determines how far the shadow is spread.
  ///
  /// The [offset] specifies the offset of the shadow
  /// relative to the background.
  ///
  const BackgroundBlur({
    required this.backgroundColor,
    required this.backgroundShadowColor,
    required this.blurRadius,
    required this.spreadRadius,
    required this.offset,
    super.key,
  });

  /// The base color of the background.
  final Color backgroundColor;

  /// The color of the shadow applied to the background.
  final Color backgroundShadowColor;

  /// The amount of blur applied to the background.
  final double blurRadius;

  /// How far the shadow is spread.
  final double spreadRadius;

  /// The offset of the shadow relative to the background.
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: backgroundShadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: offset,
            ),
          ],
        ),
      ),
    );
  }
}
