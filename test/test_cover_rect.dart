import 'package:flutter_test/flutter_test.dart';

import 'constants.dart';
import 'test_to.dart';

void testCoverRect() =>
    testTo('Verify if the Cover was rotated', (tester) async {
      // Get the rect before tap on the widget
      final cover = find.byKey(keyCover);

      final rectCoverInitial = tester.getRect(cover);

      final widthInitial = rectCoverInitial.width;
      final heightInitial = rectCoverInitial.height;
      final aspectRatioInitial = double.parse(
        (widthInitial / heightInitial).toStringAsFixed(2),
      );

      // Tap on the Animated Book Widget and then until there
      // are no longer any frames scheduled
      await tester.tap(find.byKey(keyWidget));
      await tester.pumpAndSettle();

// -----------------------------------------------------------------------------

      // Get the rect after tap on the widget
      final rectCoverFinal = tester.getRect(cover);

      final widthFinal = rectCoverFinal.width;
      final heightFinal = rectCoverFinal.height;
      final aspectRatioFinal = double.parse(
        (widthFinal / heightFinal).toStringAsFixed(2),
      );

      // Verify that the aspect ratio at the end is greater than
      // the initial one, as an identifier that the widget was tapped,
      // and the Cover was rotated
      expect(aspectRatioFinal < aspectRatioInitial, true);
    });
