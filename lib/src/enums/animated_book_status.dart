// TODO(any): add documentation here
///
enum AnimatedBookStatus {
  ///
  dismissed(),

  ///
  completed(),

  ///
  animated(ignoring: true);

  const AnimatedBookStatus({this.ignoring = false});

  ///
  final bool ignoring;
}
