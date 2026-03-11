import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaMergeSemantics', () {
    test('constructs with defaults', () {
      final widget = NapaMergeSemantics();
      expect(widget.child, isNull);
    });

    test('constructs with child', () {
      final child = createChildWidget();
      final widget = NapaMergeSemantics(child: child);
      expect(widget.child, same(child));
    });

    test('widgetName returns MergeSemantics', () {
      expect(NapaMergeSemantics().widgetName, 'MergeSemantics');
    });

    group('toJson', () {
      test('contains _name field', () {
        final json = NapaMergeSemantics().toJson();
        expect(json['_name'], 'MergeSemantics');
      });

      test('includes child when present', () {
        final json = NapaMergeSemantics(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaMergeSemantics.decode(null), isNull);
      });

      test('decodes without child', () {
        final widget = NapaMergeSemantics.decode({'_name': 'MergeSemantics'});
        expect(widget, isA<NapaMergeSemantics>());
        expect(widget!.child, isNull);
      });

      test('decodes with child', () {
        final widget = NapaMergeSemantics.decode({
          '_name': 'MergeSemantics',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaMergeSemantics();
        final decoded = NapaMergeSemantics.decode(original.toJson())!;
        expect(decoded.child, isNull);
      });

      test('round-trips with child', () {
        final original = NapaMergeSemantics(child: NapaSizedBox(width: 10));
        final decoded = NapaMergeSemantics.decode(original.toJson())!;
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaMergeSemantics().toWidget();
        expect(widget, isA<MergeSemantics>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({'_name': 'MergeSemantics'});
      expect(widget, isA<NapaMergeSemantics>());
    });
  });
}
