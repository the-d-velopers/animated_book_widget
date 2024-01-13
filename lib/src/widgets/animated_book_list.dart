import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class AnimatedBookList extends StatefulWidget {
  ///
  const AnimatedBookList.builder({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.padding,
  }) : _separatorBuilder = null;

  ///
  const AnimatedBookList.separated({
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required this.itemCount,
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.padding,
  }) : _separatorBuilder = separatorBuilder;

  ///
  final AnimatedBookListBuilder itemBuilder;

  ///
  final IndexedWidgetBuilder? _separatorBuilder;

  ///
  final int itemCount;

  ///
  final ScrollController? scrollController;

  ///
  final Axis scrollDirection;

  ///
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
