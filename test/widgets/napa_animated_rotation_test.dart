import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedRotation', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedRotation(
        turns: 0.5,
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.turns, 0.5);
      expect(widget.alignment, Alignment.center);
      expect(widget.filterQuality, isNull);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedRotation(
        turns: 1.0,
        alignment: Alignment.topLeft,
        filterQuality: FilterQuality.high,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.turns, 1.0);
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.filterQuality, FilterQuality.high);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedRotation', () {
      expect(
        NapaAnimatedRotation(
          turns: 0.0,
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedRotation',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedRotation(
          turns: 0.5,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedRotation');
        expect(json['turns'], 0.5);
        expect(json['alignment'], {'x': 0.0, 'y': 0.0});
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json.containsKey('filterQuality'), isFalse);
      });

      test('includes filterQuality when set', () {
        final json = NapaAnimatedRotation(
          turns: 0.0,
          filterQuality: FilterQuality.medium,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['filterQuality'], 'medium');
      });

      test('includes child when present', () {
        final json = NapaAnimatedRotation(
          turns: 0.0,
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedRotation.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedRotation.decode({
          '_name': 'AnimatedRotation',
          'turns': 0.5,
          'alignment': {'x': -1.0, 'y': -1.0},
          'filterQuality': 'high',
          'duration': 300000,
          'curve': 'linear',
        });
        expect(widget!.turns, 0.5);
        expect(widget.alignment, Alignment.topLeft);
        expect(widget.filterQuality, FilterQuality.high);
        expect(widget.duration, const Duration(milliseconds: 300));
      });

      test('decodes with child', () {
        final widget = NapaAnimatedRotation.decode({
          '_name': 'AnimatedRotation',
          'turns': 0.0,
          'alignment': {'x': 0.0, 'y': 0.0},
          'duration': 300000,
          'curve': 'linear',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedRotation(
          turns: 0.5,
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedRotation.decode(original.toJson())!;
        expect(decoded.turns, 0.5);
        expect(decoded.alignment, Alignment.center);
        expect(decoded.filterQuality, isNull);
        expect(decoded.duration, const Duration(milliseconds: 300));
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedRotation(
          turns: 1.0,
          alignment: Alignment.topLeft,
          filterQuality: FilterQuality.high,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedRotation.decode(original.toJson())!;
        expect(decoded.turns, 1.0);
        expect(decoded.alignment, Alignment.topLeft);
        expect(decoded.filterQuality, FilterQuality.high);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedRotation(
          turns: 0.5,
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedRotation>());
        expect((widget as AnimatedRotation).turns, 0.5);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedRotation',
        'turns': 0.0,
        'alignment': {'x': 0.0, 'y': 0.0},
        'duration': 300000,
        'curve': 'linear',
      });
      expect(widget, isA<NapaAnimatedRotation>());
    });
  });
}
