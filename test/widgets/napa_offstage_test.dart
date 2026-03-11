import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaOffstage', () {
    test('constructs with defaults', () {
      final widget = NapaOffstage();
      expect(widget.offstage, true);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaOffstage(offstage: false, child: child);
      expect(widget.offstage, false);
      expect(widget.child, same(child));
    });

    test('widgetName returns Offstage', () {
      expect(NapaOffstage().widgetName, 'Offstage');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaOffstage(offstage: false).toJson();
        expect(json['_name'], 'Offstage');
        expect(json['offstage'], false);
      });

      test('includes child when present', () {
        final json = NapaOffstage(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaOffstage.decode(null), isNull);
      });

      test('decodes offstage property', () {
        final widget = NapaOffstage.decode({
          '_name': 'Offstage',
          'offstage': false,
        });
        expect(widget!.offstage, false);
      });

      test('decodes with child', () {
        final widget = NapaOffstage.decode({
          '_name': 'Offstage',
          'offstage': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaOffstage();
        final decoded = NapaOffstage.decode(original.toJson())!;
        expect(decoded.offstage, true);
      });

      test('round-trips with all properties', () {
        final original = NapaOffstage(
          offstage: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaOffstage.decode(original.toJson())!;
        expect(decoded.offstage, false);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Offstage with correct properties', () {
        final widget = NapaOffstage(offstage: false).toWidget();
        expect(widget, isA<Offstage>());
        expect((widget as Offstage).offstage, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Offstage',
        'offstage': true,
      });
      expect(widget, isA<NapaOffstage>());
    });
  });
}
