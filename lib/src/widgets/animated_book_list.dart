import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of animated books with optional separators.
class AnimatedBookList extends StatefulWidget {
  /// Creates an [AnimatedBookList] with a builder function for items.
  ///
  /// The [itemBuilder] is a function that builds the animated book items.
  ///
  /// The [itemCount] is the number of items in the list.
  ///
  /// The [scrollDirection] determines the
  /// scrolling axis (default is horizontal).
  ///
  /// The [scrollController] is the controller for the scrolling behavior.
  ///
  /// The [padding] is the padding around the list.
  const AnimatedBookList.builder({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.padding,
  }) : _separatorBuilder = null;

  /// Creates an [AnimatedBookList] with a builder function
  /// for items and separators.
  ///
  /// The [itemBuilder] is a function that builds the animated book items.
  ///
  /// The [separatorBuilder] is a function that builds
  /// the separators between items.
  ///
  /// The [itemCount] is the number of items in the list.
  ///
  /// The [scrollDirection] determines the scrolling axis
  /// (default is horizontal).
  ///
  /// The [scrollController] is the controller for the scrolling behavior.
  ///
  /// The [padding] is the padding around the list.
  const AnimatedBookList.separated({
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required this.itemCount,
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.padding,
  }) : _separatorBuilder = separatorBuilder;

  /// The function that builds the animated book items.
  final AnimatedBookListBuilder itemBuilder;

  /// The function that builds separators between items (if not null).
  final IndexedWidgetBuilder? _separatorBuilder;

  /// The number of items in the list.
  final int itemCount;

  /// The controller for the scrolling behavior.
  final ScrollController? scrollController;

  /// The scrolling axis (default is horizontal).
  final Axis scrollDirection;

  /// The padding around the list.
  final EdgeInsets? padding;

  @override
  State<AnimatedBookList> createState() => _AnimatedBookListState();
}

class _AnimatedBookListState extends State<AnimatedBookList> {
  late IndexedWidgetBuilder? separatorBuilder = widget._separatorBuilder;
  late AnimatedBookListBuilder itemBuilder = widget.itemBuilder;
  late int itemCount = widget.itemCount;
  late Axis scrollDirection = widget.scrollDirection;
  late EdgeInsets? padding = widget.padding;

  @override
  void didUpdateWidget(AnimatedBookList oldWidget) {
    separatorBuilder = widget._separatorBuilder != separatorBuilder
        ? widget._separatorBuilder
        : separatorBuilder;
    itemBuilder =
        widget.itemBuilder != itemBuilder ? widget.itemBuilder : itemBuilder;
    itemCount = widget.itemCount != itemCount ? widget.itemCount : itemCount;
    scrollDirection = widget.scrollDirection != scrollDirection
        ? widget.scrollDirection
        : scrollDirection;
    padding = widget.padding != padding ? widget.padding : padding;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (separatorBuilder == null) {
      return ListView.builder(
        clipBehavior: Clip.none,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        scrollDirection: scrollDirection,
        padding: padding,
      );
    }
    return ListView.separated(
      itemCount: itemCount,
      clipBehavior: Clip.none,
      separatorBuilder: separatorBuilder!,
      itemBuilder: itemBuilder,
      scrollDirection: scrollDirection,
      padding: padding,
    );
  }
}
