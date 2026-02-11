import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaTransform', () {
    NapaMatrix4Compose createIdentityTransform() {
      return NapaMatrix4Compose(elements: [NapaMatrix4.identity()]);
    }

    test('constructs with required params', () {
      final transform = createIdentityTransform();
      final widget = NapaTransform(transform: transform);
      expect(widget.transform, same(transform));
      expect(widget.child, isNull);
    });

    test('widgetName returns Transform', () {
      expect(NapaTransform(transform: createIdentityTransform()).widgetName, 'Transform');
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaTransform.decode(null), isNull);
      });

      test('decodes with identity transform', () {
        final widget = NapaTransform.decode({
          '_name': 'Transform',
          'transform': [
            {'type': 'identity'},
          ],
        });
        expect(widget, isA<NapaTransform>());
        expect(widget!.transform.elements.length, 1);
      });

      test('decodes with translation transform', () {
        final widget = NapaTransform.decode({
          '_name': 'Transform',
          'transform': [
            {'type': 'translation', 'x': 10.0, 'y': 20.0, 'z': 0.0},
          ],
        });
        expect(widget, isA<NapaTransform>());
      });

      test('decodes with child', () {
        final widget = NapaTransform.decode({
          '_name': 'Transform',
          'transform': [
            {'type': 'identity'},
          ],
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Transform', () {
        final widget = NapaTransform(transform: createIdentityTransform()).toWidget();
        expect(widget, isA<Transform>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Transform',
        'transform': [
          {'type': 'identity'},
        ],
      });
      expect(widget, isA<NapaTransform>());
    });
  });
}
