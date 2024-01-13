import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class BackgroundBlur extends StatelessWidget {
  ///
  const BackgroundBlur({
    required this.backgroundColor,
    required this.backgroundShadowColor,
    required this.blurRadius,
    required this.spreadRadius,
    required this.offset,
    super.key,
  });

  ///
  final Color backgroundColor;

  ///
  final Color backgroundShadowColor;

  ///
  final double blurRadius;

  ///
  final double spreadRadius;

  ///
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
