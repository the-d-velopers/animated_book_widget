import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class AnimatedBookWidget extends StatefulWidget {
  ///
  AnimatedBookWidget({
    required this.cover,
    required this.size,
    required Widget content,
    super.key,
    this.padding = EdgeInsets.zero,
    this.blurRadius = 4,
    this.spreadRadius = .5,
    this.backgroundBlurOffset = Offset.zero,
    this.backgroundColor,
    this.backgroundShadowColor,
  }) : contentDelegate = DefaultAnimatedContentDelegate(contentChild: content);

  ///
  AnimatedBookWidget.builder({
    required this.cover,
    required this.size,
    required AnimatedBookContentBuilder contentBuilder,
    Widget? contentChild,
    super.key,
    this.padding = EdgeInsets.zero,
    this.blurRadius = 4,
    this.spreadRadius = .5,
    this.backgroundBlurOffset = Offset.zero,
    this.backgroundColor,
    this.backgroundShadowColor,
  }) : contentDelegate = BuilderAnimatedContentDelegate(
          contentBuilder: contentBuilder,
          contentChild: contentChild,
        );

  ///
  final Widget cover;

  ///
  final AnimatedContentDelegate contentDelegate;

  ///
  final Size size;

  ///
  final EdgeInsets padding;

  ///
  final Color? backgroundColor;

  ///
  final Color? backgroundShadowColor;

  ///
  final double blurRadius;

  ///
  final double spreadRadius;

  ///
  final Offset backgroundBlurOffset;

  @override
  State<AnimatedBookWidget> createState() => _AnimatedBookWidgetState();
}

class _AnimatedBookWidgetState extends State<AnimatedBookWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..addStatusListener(statusListener);
  late final coverAnimation = animationController.curvedAnimation(0, 1);
  late final contentAnimation = animationController.curvedAnimation(.5, 1);
  AnimatedBookStatus bookStatus = AnimatedBookStatus.dismissed;

  late Size size = widget.size;
  late Widget cover = widget.cover;
  late AnimatedContentDelegate contentDelegate = widget.contentDelegate;
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
    contentDelegate = widget.contentDelegate != contentDelegate
        ? widget.contentDelegate
        : contentDelegate;
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
                bookAnimation: contentAnimation,
                delegate: contentDelegate,
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
