import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter/material.dart';

/// Widget class example.
class BuildExample extends StatelessWidget {
  const BuildExample({
    required this.horizontalView,
    super.key,
  });

  final bool horizontalView;

  Size get heightSize => const Size.fromHeight(225);

  Size get widthSize => const Size.fromWidth(160);

  @override
  Widget build(BuildContext context) {
    /// List of all objects.
    return ListView.builder(
      /// Physics.
      physics: const BouncingScrollPhysics(),

      /// Scroll axis.
      scrollDirection: horizontalView ? Axis.horizontal : Axis.vertical,

      /// Number of items on the list.
      itemCount: 3,

      /// None clip.
      clipBehavior: Clip.none,

      /// Item constructor.
      itemBuilder: (_, index) {
        final color = Colors.primaries[index % Colors.primaries.length];

        /// For each object we return a widget with the data..
        return AnimatedBookWidget(
          /// Size perameter.
          size: horizontalView ? widthSize : heightSize,

          //Padding parameter
          padding: horizontalView
              ? const EdgeInsets.symmetric(horizontal: 5)
              : const EdgeInsets.symmetric(vertical: 5),

          /// Cover parameter.
          cover: ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(10)),
            child: ColoredBox(
              color: const Color(0xFF2D2D2D),
              child: Image.asset('assets/icons/dvelopers_icon.jpg'),
            ),
          ),

          /// Content parameter.
          content: ColoredBox(
            color: color,
            child: Center(
              child: Text(
                'D-VELOPERS',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
