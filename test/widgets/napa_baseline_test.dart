import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaBaseline', () {
    test('constructs with defaults', () {
      final widget = NapaBaseline();
      expect(widget.baseline, 0.0);
      expect(widget.baselineType, TextBaseline.alphabetic);
    });

    test('constructs with all params', () {
      final widget = NapaBaseline(
        baseline: 24.0,
        baselineType: TextBaseline.ideographic,
        child: createChildWidget(),
      );
      expect(widget.baseline, 24.0);
      expect(widget.baselineType, TextBaseline.ideographic);
    });

    test('widgetName returns Baseline', () {
      expect(NapaBaseline().widgetName, 'Baseline');
    });

    group('toJson', () {
      test('contains all fields', () {
        final json = NapaBaseline(baseline: 16.0).toJson();
        expect(json['_name'], 'Baseline');
        expect(json['baseline'], 16.0);
        expect(json['baselineType'], 'alphabetic');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaBaseline.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaBaseline.decode({
          '_name': 'Baseline',
          'baseline': 32.0,
          'baselineType': 'ideographic',
        });
        expect(widget!.baseline, 32.0);
        expect(widget.baselineType, TextBaseline.ideographic);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaBaseline(
          baseline: 20.0,
          baselineType: TextBaseline.ideographic,
          child: NapaSizedBox(height: 10),
        );
        final decoded = NapaBaseline.decode(original.toJson())!;
        expect(decoded.baseline, 20.0);
        expect(decoded.baselineType, TextBaseline.ideographic);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Baseline with correct properties', () {
        final widget = NapaBaseline(
          baseline: 16.0,
          baselineType: TextBaseline.alphabetic,
        ).toWidget();
        expect(widget, isA<Baseline>());
        final b = widget as Baseline;
        expect(b.baseline, 16.0);
        expect(b.baselineType, TextBaseline.alphabetic);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Baseline',
        'baseline': 10.0,
        'baselineType': 'alphabetic',
      });
      expect(widget, isA<NapaBaseline>());
    });
  });
}
