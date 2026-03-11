import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaIgnorePointer', () {
    test('constructs with defaults', () {
      final widget = NapaIgnorePointer();
      expect(widget.ignoring, true);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaIgnorePointer(ignoring: false, child: child);
      expect(widget.ignoring, false);
      expect(widget.child, same(child));
    });

    test('widgetName returns IgnorePointer', () {
      expect(NapaIgnorePointer().widgetName, 'IgnorePointer');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaIgnorePointer(ignoring: false).toJson();
        expect(json['_name'], 'IgnorePointer');
        expect(json['ignoring'], false);
      });

      test('includes child when present', () {
        final json = NapaIgnorePointer(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaIgnorePointer.decode(null), isNull);
      });

      test('decodes ignoring property', () {
        final widget = NapaIgnorePointer.decode({
          '_name': 'IgnorePointer',
          'ignoring': false,
        });
        expect(widget!.ignoring, false);
      });

      test('decodes with child', () {
        final widget = NapaIgnorePointer.decode({
          '_name': 'IgnorePointer',
          'ignoring': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaIgnorePointer();
        final decoded = NapaIgnorePointer.decode(original.toJson())!;
        expect(decoded.ignoring, true);
      });

      test('round-trips with all properties', () {
        final original = NapaIgnorePointer(
          ignoring: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaIgnorePointer.decode(original.toJson())!;
        expect(decoded.ignoring, false);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns IgnorePointer with correct properties', () {
        final widget = NapaIgnorePointer(ignoring: false).toWidget();
        expect(widget, isA<IgnorePointer>());
        expect((widget as IgnorePointer).ignoring, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'IgnorePointer',
        'ignoring': true,
      });
      expect(widget, isA<NapaIgnorePointer>());
    });
  });
}
