import 'package:animated_book_list/animated_book_list.dart';
import 'package:flutter/material.dart';

///Creating a class object
class PokemonBook {
  String urlImage;
  String pokemonName;

  PokemonBook({required this.urlImage, required this.pokemonName});
}

///Simulates a background query with response a List of objects
List<PokemonBook> pokemonBooks = [
  PokemonBook(
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png',
      pokemonName: 'Squirtle'),
  PokemonBook(
      urlImage:
          'https://assets.stickpng.com/images/580b57fcd9996e24bc43c31a.png',
      pokemonName: 'Bulbasaur'),
  PokemonBook(
      urlImage:
          'https://i.pinimg.com/originals/f2/95/76/f295769d9bd3c34ffc552e837f5304ae.png',
      pokemonName: 'Charmander'),
];

///Widget class example
class PokemonsExample extends StatelessWidget {
  final bool horizontalView;

  PokemonsExample({
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
      itemCount: pokemonBooks.length,

      ///Item constructor
      itemBuilder: (_, index) {
        ///For each object we return a widget with the data.
        return AnimatedBookWidget(
          //Size perameter
          size: horizontalView ? Size.fromWidth(160) : Size.fromHeight(225),

          ///Cover parameter
          cover: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red.shade300, Colors.red],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'PoKéMoN?',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    radius: 70,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7),
                        BlendMode.modulate,
                      ),
                      child: Image.network(
                        pokemonBooks[index].urlImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Content parameter
          content: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade300, Colors.blue],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  pokemonBooks[index].pokemonName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  radius: 70,
                  child: Image.network(
                    pokemonBooks[index].urlImage,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
