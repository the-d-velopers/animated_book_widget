![banner](https://i.imgur.com/ppKK1L0.jpeg)

# Flutter Animated Book Widget

![build](https://github.com/the-d-velopers/animated_book_widget/actions/workflows/code_metrics.yml/badge.svg)
[![animated_book_widget](https://img.shields.io/pub/v/animated_book_widget?label=animated_book_widget)](https://pub.dev/packages/animated_book_widget)

A Flutter package allows you to effortlessly create a animated book widget UI with dynamic content rendering.

## Preview

<table>
    <tr>
        <td align="center">
            <figure>
                <figcaption><b>Use it as Grid View Card</b></figcaption>
                <hr/>
                <img src="https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExOXhzNWc3anE0YTJ2MTB1cGgzN2ViaXhxY25tZ25kMjZrZTc5b3FjZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/u1vjynNPintKSHixvx/giphy.gif" alt="The example app showing animated book widget animation" width="227"/>
            </figure>
        </td>
    </tr>
<tr><td></td></tr>
    <tr>
        <td align="center">
            <figure>
                <figcaption><b>Use it as List Card</b></figcaption>
                <hr/>
                <img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbGRma2FwcmUxNnJocG9vYXJodW8wc2I4YXdhcjdsZjllbzA1bTJneiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/K83J9B9U2mFKU9c1wZ/giphy.gif" alt="The example app showing card floating animation in mobile" width="227"/>
            </figure>
        </td>
    </tr>
</table>



## Installing

1.  Add dependency to `pubspec.yaml`

    Get the latest version from the 'Installing' tab on [pub.dev](https://pub.dev/packages/animated_book_widget/install)
    
```dart
dependencies:
    animated_book_widget: <latest_version>
```

2.  Import the package
```dart
import 'package:animated_book_widget/animated_book_widget.dart';
```

3.  Adding AnimatedBookWidget

*With required parameters*
```dart
    AnimatedBookWidget(
      cover: ColoredBox(
        color: Color(0xFF2D2D2D),
        child: Image.asset('assets/icons/dvelopers_icon.jpg'),
      ),
      content: ColoredBox(color: Color(0xFF0000FF)),
      size: const Size.fromWidth(160),
      padding: const EdgeInsets.only(right: 1), // 0(Zero) when you want to set the separation
    ),
```    

*With optional parameters*
```dart   
    AnimatedBookWidget(
      cover: ColoredBox(
        color: Color(0xFF2D2D2D),
        child: Image.asset('assets/icons/dvelopers_icon.jpg'),
      ),
      content: ColoredBox(color: Color(0xFF0000FF)),
      size: const Size.fromWidth(160),
      padding: const EdgeInsets.only(right: 10), // 0(Zero) when you want to set the separation
      blurRadius: 8,
      spreadRadius: .1,
      backgroundBlurOffset: Offset.zero,
      backgroundColor: color.withOpacity(.5),
      backgroundShadowColor: color.withOpacity(.075),
      curve: Curves.linear,
      animationDuration: Duration(milliseconds: 500),
      reverseAnimationDuration: Duration(milliseconds: 500)
    ),
``` 

*Separation between cards*

 + Default configuration
```dart
    ListView.separated(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemCount: 3,
      itemBuilder: (_, index) {
        final color = Colors.primaries[index % Colors.primaries.length];
        return AnimatedBookWidget(
          size: Size.fromWidth(160),
          cover: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            child: ColoredBox(
              color: Color(0xFF2D2D2D),
              child: Image.network('https://i.imgur.com/ooKoJzX.jpg'),
            ),
          ),
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
```    

 + Configuration with Builder
```dart
    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      clipBehavior: Clip.none,
      itemBuilder: (_, index) {
        final color = Colors.primaries[index % Colors.primaries.length];
        return AnimatedBookWidget(
          size: Size.fromWidth(160),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          cover: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            child: ColoredBox(
              color: Color(0xFF2D2D2D),
              child: Image.network('https://i.imgur.com/ooKoJzX.jpg'),
            ),
          ),
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
```    


## How to use
Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dartlang.org for a more complete example.

## Credit

- This package's book animation is inspired from this [Dribbble](https://dribbble.com/shots/6607801-) art.

## Main Contributors

<table>
  <tr>
    <td align="center"><a href="https://github.com/br-programmer"><img src="https://avatars.githubusercontent.com/u/30538983?s=100" width="100px;" alt=""/><br /><sub><b>
Brayan Cantos</b></sub></a></td>
    <td align="center"><a href="https://github.com/diegoveloper"><img src="https://avatars.githubusercontent.com/u/4898256?s=100" width="100px;" alt=""/><br /><sub><b>Diego Velásquez
</b></sub></a></td>
    <td align="center"><a href="https://github.com/ecarlosdev"><img src="https://avatars.githubusercontent.com/u/155333596?s=100" width="100px;" alt=""/><br /><sub><b>ecarlosdev</b></sub></a></td>
    <td align="center"><a href="https://github.com/jesuspedge"><img src="https://avatars.githubusercontent.com/u/74924269?s=100" width="100px;" alt=""/><br /><sub><b>Roger Bacab
</b></sub></a></td>
    <td align="center"><a href="https://github.com/paolojoaquinp"><img src="https://avatars.githubusercontent.com/u/70081671?s=100" width="100px;" alt=""/><br /><sub><b>Paolo Joaquin Pinto</b></sub></a></td>
    <td align="center"><a href="https://github.com/monster555"><img src="https://avatars.githubusercontent.com/u/32662133?s=100" width="100px;" alt=""/><br /><sub><b>Daniel Coyula</b></sub></a></td>
    <td align="center"><a href="https://github.com/williamscafdev"><img src="https://avatars.githubusercontent.com/u/45320786?s=100" width="100px;" alt=""/><br /><sub><b>Williams M. Torres</b></sub></a></td>
  </tr>
</table>
<br/>

## Awesome Mobile Libraries
- Check out our other available [d-veloper libraries](https://github.com/the-d-velopers)


## License

```
MIT License


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```