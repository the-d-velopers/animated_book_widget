import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

/// A StatefulWidget that creates a customizable animated list of books.
///
/// This widget can be initialized in two ways: either using a standard list
/// builder or a separated list builder. The standard list builder creates a
/// basic list view with customizable items, while the separated list builder
/// allows the inclusion of separators between list items.
///
/// Usage:
/// ```
/// AnimatedBookList.builder(
///   itemBuilder: (context, index) => BookItemWidget(book: books[index]),
///   itemCount: books.length,
///   itemSize: 100,
///   scrollDirection: Axis.horizontal,
///   padding: EdgeInsets.all(8),
/// )
/// ```
/// or
/// ```
/// AnimatedBookList.separated(
///   itemBuilder: (context, index) => BookItemWidget(book: books[index]),
///   separatorBuilder: (context, index) => Divider(),
///   itemCount: books.length,
///   scrollDirection: Axis.vertical,
///   padding: EdgeInsets.symmetric(vertical: 8),
/// )
/// ```
class AnimatedBookList extends StatefulWidget {
  /// Creates an AnimatedBookList with a standard list builder.
  ///
  /// The [itemBuilder] and [itemCount] are required. The [itemSize] specifies
  /// the size of each item. Additional properties like [scrollDirection],
  /// [scrollController], and [padding] can be used to further customize
  /// the list.
  const AnimatedBookList.builder({
    required this.itemBuilder,
    required this.itemCount,
    required this.itemSize,
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.padding,
  }) : _separatorBuilder = null;

  /// Creates an AnimatedBookList with a separated list builder.
  ///
  /// The [itemBuilder] and [separatorBuilder] are required for item and
  /// separator customization. The [itemCount] specifies the number of items.
  /// Additional properties like [scrollDirection], [scrollController], and
  /// [padding] can be used for customization. The [itemSize] defaults to 0
  /// if not provided.
  const AnimatedBookList.separated({
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required this.itemCount,
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.padding,
    this.itemSize = 0,
  }) : _separatorBuilder = separatorBuilder;

  /// The builder function to create each item in the list.
  final AnimatedBookListBuilder itemBuilder;

  /// The builder function to create a separator between items in the list.
  /// Only used in separated list type.
  final IndexedWidgetBuilder? _separatorBuilder;

  /// The total number of items in the list.
  final int itemCount;

  /// Controller for scrolling behavior.
  final ScrollController? scrollController;

  /// The direction in which the list scrolls.
  final Axis scrollDirection;

  /// Padding around the entire list.
  final EdgeInsets? padding;

  /// The fixed size for each item in the list.
  final double itemSize;

  @override
  State<AnimatedBookList> createState() => _AnimatedBookListState();
}

/// The State class for [AnimatedBookList].
///
/// This class manages the list's behavior and layout, adjusting to changes
/// in widget properties and rebuilding the UI as needed.
class _AnimatedBookListState extends State<AnimatedBookList> {
  late IndexedWidgetBuilder? separatorBuilder = widget._separatorBuilder;
  late AnimatedBookListBuilder itemBuilder = widget.itemBuilder;
  late int itemCount = widget.itemCount;
  late Axis scrollDirection = widget.scrollDirection;
  late EdgeInsets? padding = widget.padding;
  late double itemSize = widget.itemSize;

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
    itemSize = widget.itemSize != itemSize ? widget.itemSize : itemSize;
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
        itemExtent: itemSize,
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
