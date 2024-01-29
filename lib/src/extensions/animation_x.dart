import 'package:flutter/animation.dart';

/// Extension methods for the [AnimationController] class.
extension AnimationControllerX on AnimationController {
  /// Creates a [CurvedAnimation] with a specified curve within a given range.
  ///
  /// The optional [curve] parameter specifies
  ///
  /// the curve to be applied (default is [Curves.linear]).
  Animation<double> curvedAnimation({Curve curve = Curves.linear}) {
    return CurvedAnimation(
      parent: this,
      curve: curve,
    );
  }
}
