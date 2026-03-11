import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedAlign', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedAlign(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.alignment, Alignment.center);
      expect(widget.widthFactor, isNull);
      expect(widget.heightFactor, isNull);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedAlign(
        alignment: Alignment.topLeft,
        widthFactor: 0.5,
        heightFactor: 0.8,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.widthFactor, 0.5);
      expect(widget.heightFactor, 0.8);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedAlign', () {
      expect(
        NapaAnimatedAlign(duration: const Duration(milliseconds: 300)).widgetName,
        'AnimatedAlign',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedAlign(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedAlign');
        expect(json['alignment'], {'x': 0.0, 'y': 0.0});
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json.containsKey('widthFactor'), isFalse);
        expect(json.containsKey('heightFactor'), isFalse);
      });

      test('includes optional factors when set', () {
        final json = NapaAnimatedAlign(
          widthFactor: 0.5,
          heightFactor: 0.8,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['widthFactor'], 0.5);
        expect(json['heightFactor'], 0.8);
      });

      test('includes child when present', () {
        final json = NapaAnimatedAlign(
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedAlign.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedAlign.decode({
          '_name': 'AnimatedAlign',
          'alignment': {'x': -1.0, 'y': -1.0},
          'widthFactor': 0.5,
          'heightFactor': 0.8,
          'duration': 300000,
          'curve': 'linear',
        });
        expect(widget!.alignment, Alignment.topLeft);
        expect(widget.widthFactor, 0.5);
        expect(widget.heightFactor, 0.8);
        expect(widget.duration, const Duration(milliseconds: 300));
      });

      test('decodes with child', () {
        final widget = NapaAnimatedAlign.decode({
          '_name': 'AnimatedAlign',
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
        final original = NapaAnimatedAlign(
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedAlign.decode(original.toJson())!;
        expect(decoded.alignment, Alignment.center);
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.curve, Curves.linear);
        expect(decoded.widthFactor, isNull);
        expect(decoded.heightFactor, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedAlign(
          alignment: Alignment.topLeft,
          widthFactor: 0.5,
          heightFactor: 0.8,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedAlign.decode(original.toJson())!;
        expect(decoded.alignment, Alignment.topLeft);
        expect(decoded.widthFactor, 0.5);
        expect(decoded.heightFactor, 0.8);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedAlign(
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedAlign>());
        expect((widget as AnimatedAlign).alignment, Alignment.center);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedAlign',
        'alignment': {'x': 0.0, 'y': 0.0},
        'duration': 300000,
        'curve': 'linear',
      });
      expect(widget, isA<NapaAnimatedAlign>());
    });
  });
}
