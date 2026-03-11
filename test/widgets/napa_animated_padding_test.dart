import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedPadding', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedPadding(
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.padding, const EdgeInsets.all(8.0));
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.padding, const EdgeInsets.symmetric(horizontal: 16.0));
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedPadding', () {
      expect(
        NapaAnimatedPadding(
          padding: EdgeInsets.zero,
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedPadding',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedPadding(
          padding: const EdgeInsets.all(8.0),
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedPadding');
        expect(json['padding'], {'left': 8.0, 'top': 8.0, 'right': 8.0, 'bottom': 8.0});
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
      });

      test('includes child when present', () {
        final json = NapaAnimatedPadding(
          padding: EdgeInsets.zero,
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedPadding.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedPadding.decode({
          '_name': 'AnimatedPadding',
          'padding': {'left': 8.0, 'top': 8.0, 'right': 8.0, 'bottom': 8.0},
          'duration': 300000,
          'curve': 'linear',
        });
        expect(widget!.padding, const EdgeInsets.all(8.0));
        expect(widget.duration, const Duration(milliseconds: 300));
        expect(widget.curve, Curves.linear);
      });

      test('decodes with child', () {
        final widget = NapaAnimatedPadding.decode({
          '_name': 'AnimatedPadding',
          'padding': {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0},
          'duration': 300000,
          'curve': 'linear',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedPadding(
          padding: const EdgeInsets.all(8.0),
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedPadding.decode(original.toJson())!;
        expect(decoded.padding, const EdgeInsets.all(8.0));
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.curve, Curves.linear);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedPadding.decode(original.toJson())!;
        expect(decoded.padding, const EdgeInsets.symmetric(horizontal: 16.0));
        expect(decoded.duration, const Duration(milliseconds: 500));
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedPadding(
          padding: const EdgeInsets.all(8.0),
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedPadding>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedPadding',
        'padding': {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0},
        'duration': 300000,
        'curve': 'linear',
      });
      expect(widget, isA<NapaAnimatedPadding>());
    });
  });
}
