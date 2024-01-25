/// [AnimatedBookStatus] A enum representing the status of an animated book.
enum AnimatedBookStatus {
  /// Indicates that the animated book has been dismissed.
  dismissed(),

  /// Indicates that the animated book animation has been completed.
  completed(),

  /// Indicates that the animated book is currently in an animated state.
  animated(ignoring: true);

  /// Creates an instance of [AnimatedBookStatus].
  const AnimatedBookStatus({this.ignoring = false});

  /// A flag indicating whether the status should be ignored (default is false).
  final bool ignoring;
}
