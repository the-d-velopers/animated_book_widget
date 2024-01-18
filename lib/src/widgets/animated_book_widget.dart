import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

/// A Flutter StatefulWidget that creates an animated book effect.
///
/// This widget can be used to simulate the appearance of a book opening and
/// closing, with a customizable cover and content. The animation is triggered
/// by a tap gesture.
///
/// Usage:
/// ```
/// AnimatedBookWidget(
///   cover: WidgetForCover(),
///   content: WidgetForContent(),
///   size: Size(width, height),
///   // Optional parameters
///   padding: EdgeInsets.all(10),
///   blurRadius: 5.0,
///   spreadRadius: 0.5,
///   backgroundBlurOffset: Offset(2, 2),
///   backgroundColor: Colors.white,
///   backgroundShadowColor: Colors.black12,
///   animation: Duration(milliseconds: 800),
/// )
/// ```
class AnimatedBookWidget extends StatefulWidget {
  /// Creates an AnimatedBookWidget.
  ///
  /// The [cover] and [content] are required to display the book's cover and
  /// content respectively. The [size] parameter is also required to define the
  /// widget's size.
  ///
  /// The widget's appearance and behavior can be customized with optional
  /// parameters like [padding], [backgroundColor], [backgroundShadowColor],
  /// [blurRadius], [spreadRadius], [backgroundBlurOffset], and [duration].
  const AnimatedBookWidget({
    required this.cover,
    required this.content,
    this.size,
    super.key,
    this.padding = EdgeInsets.zero,
    this.blurRadius = 4,
    this.spreadRadius = .5,
    this.backgroundBlurOffset = Offset.zero,
    this.backgroundColor,
    this.backgroundShadowColor,
    this.duration = const Duration(milliseconds: 500),
  });

  /// The cover of the book.
  final Widget cover;

  /// The content inside the book.
  final Widget content;

  /// The size of the book widget.
  final Size? size;

  /// Padding around the book widget.
  final EdgeInsets padding;

  /// Background color of the book widget.
  final Color? backgroundColor;

  /// Color of the shadow behind the book widget.
  final Color? backgroundShadowColor;

  /// The blur radius for the background shadow.
  final double blurRadius;

  /// The spread radius for the background shadow.
  final double spreadRadius;

  /// The offset for the background blur effect.
  final Offset backgroundBlurOffset;

  /// Duration of the opening and closing animation.
  final Duration duration;

  @override
  State<AnimatedBookWidget> createState() => _AnimatedBookWidgetState();
}

class _AnimatedBookWidgetState extends State<AnimatedBookWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..addStatusListener(statusListener);
  late final coverAnimation = animationController.curvedAnimation(0, 1);
  late final contentAnimation = animationController.curvedAnimation(.5, 1);
  AnimatedBookStatus bookStatus = AnimatedBookStatus.dismissed;

  late Size? size = widget.size;
  late Widget cover = widget.cover;
  late Widget content = widget.content;
  late EdgeInsets padding = widget.padding;
  late Color backgroundColor =
      widget.backgroundColor ?? context.theme.scaffoldBackgroundColor;
  late Color backgroundShadowColor = widget.backgroundShadowColor ??
      context.defaultTextStyle.color!.withOpacity(.075);
  late double blurRadius = widget.blurRadius;
  late double spreadRadius = widget.spreadRadius;
  late Offset backgroundBlurOffset = widget.backgroundBlurOffset;

  void statusListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
        bookStatus = AnimatedBookStatus.dismissed;
      case AnimationStatus.completed:
        bookStatus = AnimatedBookStatus.completed;
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        bookStatus = AnimatedBookStatus.animated;
    }
  }

  void onPressed() {
    switch (bookStatus) {
      case AnimatedBookStatus.dismissed:
        animationController.forward(from: 0);
      case AnimatedBookStatus.completed:
        animationController.reverse(from: 1);
      case AnimatedBookStatus.animated:
    }
  }

  @override
  void dispose() {
    animationController
      ..removeStatusListener(statusListener)
      ..dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedBookWidget oldWidget) {
    size = widget.size != size ? widget.size : size;
    cover = widget.cover != cover ? widget.cover : cover;
    content = widget.content != content ? widget.content : content;
    padding = widget.padding != padding ? widget.padding : padding;
    backgroundColor = widget.backgroundColor != backgroundColor
        ? widget.backgroundColor ?? backgroundColor
        : backgroundColor;
    backgroundShadowColor =
        widget.backgroundShadowColor != backgroundShadowColor
            ? widget.backgroundShadowColor ?? backgroundShadowColor
            : backgroundShadowColor;
    blurRadius =
        widget.blurRadius != blurRadius ? widget.blurRadius : blurRadius;
    spreadRadius = widget.spreadRadius != spreadRadius
        ? widget.spreadRadius
        : spreadRadius;
    backgroundBlurOffset = widget.backgroundBlurOffset != backgroundBlurOffset
        ? widget.backgroundBlurOffset
        : backgroundBlurOffset;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox.fromSize(
        size: size,
        child: GestureDetector(
          onTap: onPressed,
          child: Stack(
            fit: StackFit.expand,
            children: [
              BackgroundBlur(
                backgroundColor: backgroundColor,
                backgroundShadowColor: backgroundShadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                offset: backgroundBlurOffset,
              ),
              AnimatedContentWidget(
                listenable: contentAnimation,
                content: content,
              ),
              AnimatedCoverWidget(
                listenable: coverAnimation,
                cover: cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
