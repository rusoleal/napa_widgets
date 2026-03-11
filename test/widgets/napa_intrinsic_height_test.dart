import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaIntrinsicHeight', () {
    test('constructs with no params', () {
      final widget = NapaIntrinsicHeight();
      expect(widget.child, isNull);
    });

    test('constructs with child', () {
      final child = createChildWidget();
      final widget = NapaIntrinsicHeight(child: child);
      expect(widget.child, same(child));
    });

    test('widgetName returns IntrinsicHeight', () {
      expect(NapaIntrinsicHeight().widgetName, 'IntrinsicHeight');
    });

    group('toJson', () {
      test('contains _name field', () {
        final json = NapaIntrinsicHeight().toJson();
        expect(json['_name'], 'IntrinsicHeight');
      });

      test('includes child when present', () {
        final json = NapaIntrinsicHeight(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaIntrinsicHeight.decode(null), isNull);
      });

      test('decodes without child', () {
        final widget = NapaIntrinsicHeight.decode({'_name': 'IntrinsicHeight'});
        expect(widget, isNotNull);
        expect(widget!.child, isNull);
      });

      test('decodes with child', () {
        final widget = NapaIntrinsicHeight.decode({
          '_name': 'IntrinsicHeight',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with child', () {
        final original = NapaIntrinsicHeight(child: NapaSizedBox(width: 10));
        final decoded = NapaIntrinsicHeight.decode(original.toJson())!;
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns IntrinsicHeight', () {
        expect(NapaIntrinsicHeight().toWidget(), isA<IntrinsicHeight>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({'_name': 'IntrinsicHeight'});
      expect(widget, isA<NapaIntrinsicHeight>());
    });
  });
}
