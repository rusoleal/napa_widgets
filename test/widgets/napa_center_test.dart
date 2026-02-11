import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaCenter', () {
    test('constructs with defaults', () {
      final widget = NapaCenter();
      expect(widget.alignment, Alignment.center);
      expect(widget.widthFactor, isNull);
      expect(widget.heightFactor, isNull);
    });

    test('widgetName returns Center', () {
      expect(NapaCenter().widgetName, 'Center');
    });

    group('toJson', () {
      test('contains _name but not alignment', () {
        final json = NapaCenter().toJson();
        expect(json['_name'], 'Center');
        expect(json.containsKey('alignment'), isFalse);
      });

      test('includes widthFactor and heightFactor when set', () {
        final json = NapaCenter(widthFactor: 2.0, heightFactor: 3.0).toJson();
        expect(json['widthFactor'], 2.0);
        expect(json['heightFactor'], 3.0);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaCenter.decode(null), isNull);
      });

      test('decodes with widthFactor and heightFactor', () {
        final widget = NapaCenter.decode({
          '_name': 'Center',
          'widthFactor': 1.5,
          'heightFactor': 2.5,
        });
        expect(widget!.widthFactor, 1.5);
        expect(widget.heightFactor, 2.5);
      });

      test('decodes with child', () {
        final widget = NapaCenter.decode({
          '_name': 'Center',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaCenter();
        final decoded = NapaCenter.decode(original.toJson())!;
        expect(decoded.widthFactor, isNull);
        expect(decoded.heightFactor, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaCenter(
          widthFactor: 2.0,
          heightFactor: 3.0,
          child: NapaSizedBox(width: 5),
        );
        final decoded = NapaCenter.decode(original.toJson())!;
        expect(decoded.widthFactor, 2.0);
        expect(decoded.heightFactor, 3.0);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Center (not Align)', () {
        final widget = NapaCenter().toWidget();
        expect(widget, isA<Center>());
      });

      test('passes widthFactor and heightFactor', () {
        final widget = NapaCenter(widthFactor: 2.0).toWidget();
        final c = widget as Center;
        expect(c.widthFactor, 2.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({'_name': 'Center'});
      expect(widget, isA<NapaCenter>());
    });
  });
}
