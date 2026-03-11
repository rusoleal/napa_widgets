import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedOpacity', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedOpacity(
        opacity: 0.5,
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.opacity, 0.5);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.alwaysIncludeSemantics, false);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedOpacity(
        opacity: 0.8,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        alwaysIncludeSemantics: true,
        child: child,
      );
      expect(widget.opacity, 0.8);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.alwaysIncludeSemantics, true);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedOpacity', () {
      expect(
        NapaAnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedOpacity',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedOpacity(
          opacity: 0.5,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedOpacity');
        expect(json['opacity'], 0.5);
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json['alwaysIncludeSemantics'], false);
      });

      test('includes child when present', () {
        final json = NapaAnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedOpacity.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedOpacity.decode({
          '_name': 'AnimatedOpacity',
          'opacity': 0.7,
          'duration': 300000,
          'curve': 'linear',
          'alwaysIncludeSemantics': true,
        });
        expect(widget!.opacity, 0.7);
        expect(widget.duration, const Duration(milliseconds: 300));
        expect(widget.alwaysIncludeSemantics, true);
      });

      test('decodes with child', () {
        final widget = NapaAnimatedOpacity.decode({
          '_name': 'AnimatedOpacity',
          'opacity': 1.0,
          'duration': 300000,
          'curve': 'linear',
          'alwaysIncludeSemantics': false,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedOpacity(
          opacity: 0.5,
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedOpacity.decode(original.toJson())!;
        expect(decoded.opacity, 0.5);
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.curve, Curves.linear);
        expect(decoded.alwaysIncludeSemantics, false);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedOpacity(
          opacity: 0.8,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          alwaysIncludeSemantics: true,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedOpacity.decode(original.toJson())!;
        expect(decoded.opacity, 0.8);
        expect(decoded.duration, const Duration(milliseconds: 500));
        expect(decoded.alwaysIncludeSemantics, true);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedOpacity(
          opacity: 0.5,
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedOpacity>());
        expect((widget as AnimatedOpacity).opacity, 0.5);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedOpacity',
        'opacity': 1.0,
        'duration': 300000,
        'curve': 'linear',
        'alwaysIncludeSemantics': false,
      });
      expect(widget, isA<NapaAnimatedOpacity>());
    });
  });
}
