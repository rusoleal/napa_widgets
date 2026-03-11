import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAbsorbPointer', () {
    test('constructs with defaults', () {
      final widget = NapaAbsorbPointer();
      expect(widget.absorbing, true);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAbsorbPointer(absorbing: false, child: child);
      expect(widget.absorbing, false);
      expect(widget.child, same(child));
    });

    test('widgetName returns AbsorbPointer', () {
      expect(NapaAbsorbPointer().widgetName, 'AbsorbPointer');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAbsorbPointer(absorbing: false).toJson();
        expect(json['_name'], 'AbsorbPointer');
        expect(json['absorbing'], false);
      });

      test('includes child when present', () {
        final json = NapaAbsorbPointer(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAbsorbPointer.decode(null), isNull);
      });

      test('decodes absorbing property', () {
        final widget = NapaAbsorbPointer.decode({
          '_name': 'AbsorbPointer',
          'absorbing': false,
        });
        expect(widget!.absorbing, false);
      });

      test('decodes with child', () {
        final widget = NapaAbsorbPointer.decode({
          '_name': 'AbsorbPointer',
          'absorbing': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAbsorbPointer();
        final decoded = NapaAbsorbPointer.decode(original.toJson())!;
        expect(decoded.absorbing, true);
      });

      test('round-trips with all properties', () {
        final original = NapaAbsorbPointer(
          absorbing: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAbsorbPointer.decode(original.toJson())!;
        expect(decoded.absorbing, false);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns AbsorbPointer with correct properties', () {
        final widget = NapaAbsorbPointer(absorbing: false).toWidget();
        expect(widget, isA<AbsorbPointer>());
        expect((widget as AbsorbPointer).absorbing, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AbsorbPointer',
        'absorbing': true,
      });
      expect(widget, isA<NapaAbsorbPointer>());
    });
  });
}
