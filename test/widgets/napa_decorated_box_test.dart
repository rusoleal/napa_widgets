import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaDecoratedBox', () {
    test('constructs with required params', () {
      const decoration = BoxDecoration();
      final widget = NapaDecoratedBox(decoration: decoration);
      expect(widget.decoration, same(decoration));
      expect(widget.position, DecorationPosition.background);
    });

    test('constructs with all params', () {
      const decoration = BoxDecoration();
      final widget = NapaDecoratedBox(
        decoration: decoration,
        position: DecorationPosition.foreground,
        child: createChildWidget(),
      );
      expect(widget.position, DecorationPosition.foreground);
      expect(widget.child, isA<NapaSizedBox>());
    });

    test('widgetName returns DecoratedBox', () {
      expect(NapaDecoratedBox(decoration: const BoxDecoration()).widgetName, 'DecoratedBox');
    });

    group('toJson', () {
      test('contains _name, decoration, and position', () {
        final json = NapaDecoratedBox(decoration: const BoxDecoration()).toJson();
        expect(json['_name'], 'DecoratedBox');
        expect(json['position'], 'background');
        expect(json['decoration'], isA<Map>());
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaDecoratedBox.decode(null), isNull);
      });

      test('decodes with BoxDecoration', () {
        final widget = NapaDecoratedBox.decode({
          '_name': 'DecoratedBox',
          'decoration': {
            '_type': 'BoxDecoration',
            'shape': 'rectangle',
          },
          'position': 'foreground',
        });
        expect(widget, isA<NapaDecoratedBox>());
        expect(widget!.position, DecorationPosition.foreground);
        expect(widget.decoration, isA<BoxDecoration>());
      });
    });

    group('toWidget', () {
      test('returns DecoratedBox', () {
        final widget = NapaDecoratedBox(
          decoration: const BoxDecoration(),
        ).toWidget();
        expect(widget, isA<DecoratedBox>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'DecoratedBox',
        'decoration': {
          '_type': 'BoxDecoration',
          'shape': 'rectangle',
        },
        'position': 'background',
      });
      expect(widget, isA<NapaDecoratedBox>());
    });
  });
}
