import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaRotatedBox', () {
    test('constructs with required params', () {
      final widget = NapaRotatedBox(quarterTurns: 1);
      expect(widget.quarterTurns, 1);
      expect(widget.child, isNull);
    });

    test('widgetName returns RotatedBox', () {
      expect(NapaRotatedBox(quarterTurns: 0).widgetName, 'RotatedBox');
    });

    test('toString shows degrees', () {
      expect(NapaRotatedBox(quarterTurns: 1).toString(), 'RotatedBox(90°)');
      expect(NapaRotatedBox(quarterTurns: 2).toString(), 'RotatedBox(180°)');
      expect(NapaRotatedBox(quarterTurns: 4).toString(), 'RotatedBox(0°)');
    });

    group('toJson', () {
      test('contains _name and quarterTurns', () {
        final json = NapaRotatedBox(quarterTurns: 3).toJson();
        expect(json['_name'], 'RotatedBox');
        expect(json['quarterTurns'], 3);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaRotatedBox.decode(null), isNull);
      });

      test('decodes quarterTurns', () {
        final widget = NapaRotatedBox.decode({
          '_name': 'RotatedBox',
          'quarterTurns': 2,
        });
        expect(widget!.quarterTurns, 2);
      });

      test('decodes with child', () {
        final widget = NapaRotatedBox.decode({
          '_name': 'RotatedBox',
          'quarterTurns': 1,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaRotatedBox(
          quarterTurns: 3,
          child: NapaSizedBox(width: 5),
        );
        final decoded = NapaRotatedBox.decode(original.toJson())!;
        expect(decoded.quarterTurns, 3);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns RotatedBox with correct quarterTurns', () {
        final widget = NapaRotatedBox(quarterTurns: 2).toWidget();
        expect(widget, isA<RotatedBox>());
        expect((widget as RotatedBox).quarterTurns, 2);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'RotatedBox',
        'quarterTurns': 1,
      });
      expect(widget, isA<NapaRotatedBox>());
    });
  });
}
