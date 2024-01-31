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
              horizontalView ? 'Inspiration Example:' : 'Inspiration\nExample:',
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
              horizontalView ? 'Books example:' : 'Books\nexample:',
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
              horizontalView ? 'Pokemons example:' : 'Pokemons\nexample:',
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
              horizontalView ? 'Cds example:' : 'Cds\nexample:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox.square(
                dimension: 225,
                child: CdsExample(horizontalView: horizontalView),
              ),
            ),
            Text(
              horizontalView ? 'Blue Rays example:' : 'Blue\nRays\nexample:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 225,
                width: 160,
                child: BlueRaysExample(horizontalView: horizontalView),
              ),
            ),
            Text(
              horizontalView ? 'Separated example:' : 'Separated\nexample:',
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
              horizontalView ? 'Build example:' : 'Build\nexample:',
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
