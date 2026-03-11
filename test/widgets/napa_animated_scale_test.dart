import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedScale', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedScale(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.scale, isNull);
      expect(widget.alignment, Alignment.center);
      expect(widget.filterQuality, isNull);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedScale(
        scale: 1.5,
        alignment: Alignment.topLeft,
        filterQuality: FilterQuality.high,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.scale, 1.5);
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.filterQuality, FilterQuality.high);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedScale', () {
      expect(
        NapaAnimatedScale(duration: const Duration(milliseconds: 300)).widgetName,
        'AnimatedScale',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedScale(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedScale');
        expect(json['alignment'], {'x': 0.0, 'y': 0.0});
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json.containsKey('scale'), isFalse);
        expect(json.containsKey('filterQuality'), isFalse);
      });

      test('includes scale when set', () {
        final json = NapaAnimatedScale(
          scale: 1.5,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['scale'], 1.5);
      });

      test('includes filterQuality when set', () {
        final json = NapaAnimatedScale(
          filterQuality: FilterQuality.high,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['filterQuality'], 'high');
      });

      test('includes child when present', () {
        final json = NapaAnimatedScale(
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedScale.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedScale.decode({
          '_name': 'AnimatedScale',
          'scale': 1.5,
          'alignment': {'x': -1.0, 'y': -1.0},
          'filterQuality': 'high',
          'duration': 300000,
          'curve': 'linear',
        });
        expect(widget!.scale, 1.5);
        expect(widget.alignment, Alignment.topLeft);
        expect(widget.filterQuality, FilterQuality.high);
        expect(widget.duration, const Duration(milliseconds: 300));
      });

      test('decodes with child', () {
        final widget = NapaAnimatedScale.decode({
          '_name': 'AnimatedScale',
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
        final original = NapaAnimatedScale(
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedScale.decode(original.toJson())!;
        expect(decoded.scale, isNull);
        expect(decoded.alignment, Alignment.center);
        expect(decoded.filterQuality, isNull);
        expect(decoded.duration, const Duration(milliseconds: 300));
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedScale(
          scale: 1.5,
          alignment: Alignment.topLeft,
          filterQuality: FilterQuality.high,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedScale.decode(original.toJson())!;
        expect(decoded.scale, 1.5);
        expect(decoded.alignment, Alignment.topLeft);
        expect(decoded.filterQuality, FilterQuality.high);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedScale(
          scale: 1.0,
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedScale>());
        expect((widget as AnimatedScale).scale, 1.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedScale',
        'alignment': {'x': 0.0, 'y': 0.0},
        'duration': 300000,
        'curve': 'linear',
      });
      expect(widget, isA<NapaAnimatedScale>());
    });
  });
}
