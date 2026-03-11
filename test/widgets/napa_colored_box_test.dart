import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaColoredBox', () {
    test('constructs with required params', () {
      final widget = NapaColoredBox(color: testColor());
      expect(widget.color, testColor());
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaColoredBox(color: testColor(), child: child);
      expect(widget.color, testColor());
      expect(widget.child, same(child));
    });

    test('widgetName returns ColoredBox', () {
      expect(NapaColoredBox(color: testColor()).widgetName, 'ColoredBox');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaColoredBox(color: testColor()).toJson();
        expect(json['_name'], 'ColoredBox');
        expect(json['color'], testColorJson());
      });

      test('includes child when present', () {
        final json = NapaColoredBox(
          color: testColor(),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaColoredBox.decode(null), isNull);
      });

      test('decodes color', () {
        final widget = NapaColoredBox.decode({
          '_name': 'ColoredBox',
          'color': testColorJson(),
        });
        expect(widget!.color, testColor());
      });

      test('decodes with child', () {
        final widget = NapaColoredBox.decode({
          '_name': 'ColoredBox',
          'color': testColorJson(),
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaColoredBox(color: testColor());
        final decoded = NapaColoredBox.decode(original.toJson())!;
        expect(decoded.color, testColor());
        expect(decoded.child, isNull);
      });

      test('round-trips with child', () {
        final original = NapaColoredBox(
          color: testColor(),
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaColoredBox.decode(original.toJson())!;
        expect(decoded.color, testColor());
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ColoredBox with correct color', () {
        final widget = NapaColoredBox(color: testColor()).toWidget();
        expect(widget, isA<ColoredBox>());
        expect((widget as ColoredBox).color, testColor());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ColoredBox',
        'color': testColorJson(),
      });
      expect(widget, isA<NapaColoredBox>());
    });
  });
}
