import 'package:animated_book_list/animated_book_list.dart';
import 'package:flutter/material.dart';

///Widget class example
class SeparatedExample extends StatelessWidget {
  final bool horizontalView;

  SeparatedExample({
    super.key,
    required this.horizontalView,
  });

  @override
  Widget build(BuildContext context) {
    ///List of all objects
    return AnimatedBookList.separated(
      ///Scroll axis
      scrollDirection: horizontalView ? Axis.horizontal : Axis.vertical,

      ///Separator of list
      separatorBuilder: (context, index) => horizontalView
          ? const SizedBox(width: 20)
          : const SizedBox(height: 20),

      ///Number of items on the list
      itemCount: 3,

      ///Item constructor
      itemBuilder: (_, index) {
        final color = Colors.primaries[index % Colors.primaries.length];

        ///For each object we return a widget with the data.
        return AnimatedBookWidget(
          ///Size perameter
          size: horizontalView ? Size.fromWidth(160) : Size.fromHeight(225),

          ///Cover parameter
          cover: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            child: ColoredBox(
              color: Color(0xFF2D2D2D),
              child: Image.asset('assets/icons/dvelopers_icon.jpg'),
            ),
          ),

          ///Content parameter
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
