import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaRepaintBoundary', () {
    test('constructs with no child', () {
      final widget = NapaRepaintBoundary();
      expect(widget.child, isNull);
    });

    test('constructs with child', () {
      final child = createChildWidget();
      final widget = NapaRepaintBoundary(child: child);
      expect(widget.child, same(child));
    });

    test('widgetName returns RepaintBoundary', () {
      expect(NapaRepaintBoundary().widgetName, 'RepaintBoundary');
    });

    group('toJson', () {
      test('contains _name', () {
        final json = NapaRepaintBoundary().toJson();
        expect(json['_name'], 'RepaintBoundary');
      });

      test('excludes child when null', () {
        final json = NapaRepaintBoundary().toJson();
        expect(json.containsKey('child'), isFalse);
      });

      test('includes child when present', () {
        final widget = NapaRepaintBoundary(child: createChildWidget());
        final json = widget.toJson();
        expect(json['child'], isA<Map>());
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaRepaintBoundary.decode(null), isNull);
      });

      test('decodes without child', () {
        final widget = NapaRepaintBoundary.decode({'_name': 'RepaintBoundary'});
        expect(widget, isA<NapaRepaintBoundary>());
        expect(widget!.child, isNull);
      });

      test('decodes with child', () {
        final widget = NapaRepaintBoundary.decode({
          '_name': 'RepaintBoundary',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips without child', () {
        final original = NapaRepaintBoundary();
        final json = original.toJson();
        final decoded = NapaRepaintBoundary.decode(json)!;
        expect(decoded.widgetName, original.widgetName);
        expect(decoded.child, isNull);
      });

      test('round-trips with child', () {
        final original = NapaRepaintBoundary(child: NapaSizedBox(width: 5));
        final json = original.toJson();
        final decoded = NapaRepaintBoundary.decode(json)!;
        expect(decoded.child, isA<NapaSizedBox>());
        expect((decoded.child as NapaSizedBox).width, 5.0);
      });
    });

    group('toWidget', () {
      test('returns RepaintBoundary', () {
        final widget = NapaRepaintBoundary().toWidget();
        expect(widget, isA<RepaintBoundary>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({'_name': 'RepaintBoundary'});
      expect(widget, isA<NapaRepaintBoundary>());
    });
  });
}
