import 'package:flutter/animation.dart';

// TODO(any): add documentation here
///
extension AnimationControllerX on AnimationController {
  ///
  Animation<double> curvedAnimation(
    double begin,
    double end, {
    Curve curve = Curves.linear,
  }) {
    return CurvedAnimation(
      parent: this,
      curve: Interval(begin, end, curve: curve),
    );
  }
}
