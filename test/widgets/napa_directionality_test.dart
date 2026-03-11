import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaDirectionality', () {
    test('constructs with defaults', () {
      final widget = NapaDirectionality();
      expect(widget.textDirection, TextDirection.ltr);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaDirectionality(
        textDirection: TextDirection.rtl,
        child: child,
      );
      expect(widget.textDirection, TextDirection.rtl);
      expect(widget.child, same(child));
    });

    test('widgetName returns Directionality', () {
      expect(NapaDirectionality().widgetName, 'Directionality');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaDirectionality().toJson();
        expect(json['_name'], 'Directionality');
        expect(json['textDirection'], 'ltr');
      });

      test('includes child when present', () {
        final json = NapaDirectionality(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaDirectionality.decode(null), isNull);
      });

      test('decodes textDirection', () {
        final widget = NapaDirectionality.decode({
          '_name': 'Directionality',
          'textDirection': 'rtl',
        });
        expect(widget!.textDirection, TextDirection.rtl);
      });

      test('decodes with child', () {
        final widget = NapaDirectionality.decode({
          '_name': 'Directionality',
          'textDirection': 'ltr',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with rtl', () {
        final original = NapaDirectionality(
          textDirection: TextDirection.rtl,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaDirectionality.decode(original.toJson())!;
        expect(decoded.textDirection, TextDirection.rtl);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Directionality with correct textDirection', () {
        final widget = NapaDirectionality(
          textDirection: TextDirection.rtl,
        ).toWidget();
        expect(widget, isA<Directionality>());
        expect((widget as Directionality).textDirection, TextDirection.rtl);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Directionality',
        'textDirection': 'ltr',
      });
      expect(widget, isA<NapaDirectionality>());
    });
  });
}
