import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaLimitedBox', () {
    test('constructs with defaults', () {
      final widget = NapaLimitedBox();
      expect(widget.maxWidth, double.infinity);
      expect(widget.maxHeight, double.infinity);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaLimitedBox(maxWidth: 200, maxHeight: 100, child: child);
      expect(widget.maxWidth, 200);
      expect(widget.maxHeight, 100);
      expect(widget.child, same(child));
    });

    test('widgetName returns LimitedBox', () {
      expect(NapaLimitedBox().widgetName, 'LimitedBox');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaLimitedBox(maxWidth: 200, maxHeight: 100).toJson();
        expect(json['_name'], 'LimitedBox');
        expect(json['maxWidth'], 200.0);
        expect(json['maxHeight'], 100.0);
      });

      test('includes child when present', () {
        final json = NapaLimitedBox(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaLimitedBox.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaLimitedBox.decode({
          '_name': 'LimitedBox',
          'maxWidth': 150.0,
          'maxHeight': 80.0,
        });
        expect(widget!.maxWidth, 150.0);
        expect(widget.maxHeight, 80.0);
      });

      test('decodes with child', () {
        final widget = NapaLimitedBox.decode({
          '_name': 'LimitedBox',
          'maxWidth': double.infinity,
          'maxHeight': double.infinity,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with values', () {
        final original = NapaLimitedBox(maxWidth: 300, maxHeight: 150);
        final decoded = NapaLimitedBox.decode(original.toJson())!;
        expect(decoded.maxWidth, 300.0);
        expect(decoded.maxHeight, 150.0);
      });
    });

    group('toWidget', () {
      test('returns LimitedBox with correct properties', () {
        final widget = NapaLimitedBox(maxWidth: 100, maxHeight: 50).toWidget();
        expect(widget, isA<LimitedBox>());
        expect((widget as LimitedBox).maxWidth, 100.0);
        expect(widget.maxHeight, 50.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'LimitedBox',
        'maxWidth': double.infinity,
        'maxHeight': double.infinity,
      });
      expect(widget, isA<NapaLimitedBox>());
    });
  });
}
