import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaExcludeSemantics', () {
    test('constructs with defaults', () {
      final widget = NapaExcludeSemantics();
      expect(widget.excluding, true);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaExcludeSemantics(excluding: false, child: child);
      expect(widget.excluding, false);
      expect(widget.child, same(child));
    });

    test('widgetName returns ExcludeSemantics', () {
      expect(NapaExcludeSemantics().widgetName, 'ExcludeSemantics');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaExcludeSemantics(excluding: false).toJson();
        expect(json['_name'], 'ExcludeSemantics');
        expect(json['excluding'], false);
      });

      test('includes child when present', () {
        final json = NapaExcludeSemantics(
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaExcludeSemantics.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaExcludeSemantics.decode({
          '_name': 'ExcludeSemantics',
          'excluding': false,
        });
        expect(widget!.excluding, false);
      });

      test('decodes with child', () {
        final widget = NapaExcludeSemantics.decode({
          '_name': 'ExcludeSemantics',
          'excluding': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaExcludeSemantics();
        final decoded = NapaExcludeSemantics.decode(original.toJson())!;
        expect(decoded.excluding, true);
      });

      test('round-trips with all properties', () {
        final original = NapaExcludeSemantics(
          excluding: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaExcludeSemantics.decode(original.toJson())!;
        expect(decoded.excluding, false);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaExcludeSemantics(excluding: false).toWidget();
        expect(widget, isA<ExcludeSemantics>());
        expect((widget as ExcludeSemantics).excluding, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ExcludeSemantics',
        'excluding': true,
      });
      expect(widget, isA<NapaExcludeSemantics>());
    });
  });
}
