import 'package:flutter/material.dart';

import 'examples.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool horizontalView = true;

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () => setState(() => horizontalView = !horizontalView),
            icon: Icon(horizontalView
                ? Icons.view_column_rounded
                : Icons.table_rows_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: horizontalView ? Axis.vertical : Axis.horizontal,
          children: [
            Text(
              'Inspiration Example:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 225,
                width: 160,
                child: InspirationExample(horizontalView: horizontalView),
              ),
            ),
            Text(
              'Books example:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 225,
                width: 160,
                child: BooksExample(horizontalView: horizontalView),
              ),
            ),
            Text(
              'Pokemons example:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 225,
                width: 160,
                child: PokemonsExample(horizontalView: horizontalView),
              ),
            ),
            Text(
              'Separated example:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 225,
                width: 160,
                child: SeparatedExample(horizontalView: horizontalView),
              ),
            ),
            Text(
              'Build example:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 225,
                width: 160,
                child: BuildExample(horizontalView: horizontalView),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
