import 'package:animated_book_list/animated_book_list.dart';
import 'package:flutter/material.dart';
//Imports the animated_book_list package in your project

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final cover = ColoredBox(
      color: Color(0xFF2D2D2D),
      child: Image.asset('assets/icons/dvelopers_icon.jpg'),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  'assets/icons/dvelopers_icon.jpg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text('Animated Book List'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 225,
            child: AnimatedBookList.separated(
              itemBuilder: (_, index) {
                final color = Colors.primaries[index % Colors.primaries.length];
                return AnimatedBookWidget(
                  cover: cover,
                  content: ColoredBox(color: color),
                  size: const Size.fromWidth(160),
                );
              },
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 225,
            child: AnimatedBookList.builder(
              itemBuilder: (_, index) {
                final color = Colors.primaries[index % Colors.primaries.length];
                return AnimatedBookWidget(
                  cover: cover,
                  content: ColoredBox(color: color),
                  size: const Size.fromWidth(160),
                  padding: const EdgeInsets.only(right: 10),
                );
              },
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
