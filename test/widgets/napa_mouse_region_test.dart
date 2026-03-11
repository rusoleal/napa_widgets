import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaMouseRegion', () {
    test('constructs with defaults', () {
      final widget = NapaMouseRegion();
      expect(widget.cursor, MouseCursor.defer);
      expect(widget.opaque, true);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaMouseRegion(
        cursor: SystemMouseCursors.click,
        opaque: false,
        child: child,
      );
      expect(widget.cursor, SystemMouseCursors.click);
      expect(widget.opaque, false);
      expect(widget.child, same(child));
    });

    test('widgetName returns MouseRegion', () {
      expect(NapaMouseRegion().widgetName, 'MouseRegion');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaMouseRegion().toJson();
        expect(json['_name'], 'MouseRegion');
        expect(json['cursor'], 'defer');
        expect(json['opaque'], true);
      });

      test('serializes named cursor', () {
        final json = NapaMouseRegion(cursor: SystemMouseCursors.click).toJson();
        expect(json['cursor'], 'click');
      });

      test('includes child when present', () {
        final json = NapaMouseRegion(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaMouseRegion.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaMouseRegion.decode({
          '_name': 'MouseRegion',
          'cursor': 'click',
          'opaque': false,
        });
        expect(widget!.cursor, SystemMouseCursors.click);
        expect(widget.opaque, false);
      });

      test('decodes defer cursor', () {
        final widget = NapaMouseRegion.decode({
          '_name': 'MouseRegion',
          'cursor': 'defer',
          'opaque': true,
        });
        expect(widget!.cursor, MouseCursor.defer);
      });

      test('decodes with child', () {
        final widget = NapaMouseRegion.decode({
          '_name': 'MouseRegion',
          'cursor': 'defer',
          'opaque': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with cursor', () {
        final original = NapaMouseRegion(
          cursor: SystemMouseCursors.grab,
          opaque: false,
        );
        final decoded = NapaMouseRegion.decode(original.toJson())!;
        expect(decoded.cursor, SystemMouseCursors.grab);
        expect(decoded.opaque, false);
      });
    });

    group('toWidget', () {
      test('returns MouseRegion with correct properties', () {
        final widget = NapaMouseRegion(opaque: false).toWidget();
        expect(widget, isA<MouseRegion>());
        expect((widget as MouseRegion).opaque, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'MouseRegion',
        'cursor': 'defer',
        'opaque': true,
      });
      expect(widget, isA<NapaMouseRegion>());
    });
  });
}
