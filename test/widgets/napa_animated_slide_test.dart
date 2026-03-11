import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedSlide', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedSlide(
        offset: const Offset(0.5, 0.0),
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.offset, const Offset(0.5, 0.0));
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedSlide(
        offset: const Offset(0.5, 1.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.offset, const Offset(0.5, 1.0));
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedSlide', () {
      expect(
        NapaAnimatedSlide(
          offset: Offset.zero,
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedSlide',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedSlide(
          offset: const Offset(0.5, 0.0),
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedSlide');
        expect(json['offset'], {'dx': 0.5, 'dy': 0.0});
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
      });

      test('includes child when present', () {
        final json = NapaAnimatedSlide(
          offset: Offset.zero,
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedSlide.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedSlide.decode({
          '_name': 'AnimatedSlide',
          'offset': {'dx': 0.5, 'dy': 1.0},
          'duration': 300000,
          'curve': 'linear',
        });
        expect(widget!.offset, const Offset(0.5, 1.0));
        expect(widget.duration, const Duration(milliseconds: 300));
        expect(widget.curve, Curves.linear);
      });

      test('decodes with child', () {
        final widget = NapaAnimatedSlide.decode({
          '_name': 'AnimatedSlide',
          'offset': {'dx': 0.0, 'dy': 0.0},
          'duration': 300000,
          'curve': 'linear',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedSlide(
          offset: const Offset(0.5, 0.0),
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedSlide.decode(original.toJson())!;
        expect(decoded.offset, const Offset(0.5, 0.0));
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.curve, Curves.linear);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedSlide(
          offset: const Offset(0.5, 1.0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedSlide.decode(original.toJson())!;
        expect(decoded.offset, const Offset(0.5, 1.0));
        expect(decoded.duration, const Duration(milliseconds: 500));
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedSlide(
          offset: const Offset(0.5, 0.0),
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedSlide>());
        expect((widget as AnimatedSlide).offset, const Offset(0.5, 0.0));
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedSlide',
        'offset': {'dx': 0.0, 'dy': 0.0},
        'duration': 300000,
        'curve': 'linear',
      });
      expect(widget, isA<NapaAnimatedSlide>());
    });
  });
}
