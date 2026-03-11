import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedCrossFade', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.firstChild, isNull);
      expect(widget.secondChild, isNull);
      expect(widget.crossFadeState, CrossFadeState.showFirst);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.reverseDuration, isNull);
      expect(widget.firstCurve, Curves.linear);
      expect(widget.secondCurve, Curves.linear);
      expect(widget.sizeCurve, Curves.linear);
      expect(widget.alignment, Alignment.topCenter);
    });

    test('constructs with all params', () {
      final first = createChildWidget();
      final second = createChildWidget();
      final widget = NapaAnimatedCrossFade(
        firstChild: first,
        secondChild: second,
        crossFadeState: CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 200),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        sizeCurve: Curves.easeInOut,
        alignment: Alignment.center,
      );
      expect(widget.firstChild, same(first));
      expect(widget.secondChild, same(second));
      expect(widget.crossFadeState, CrossFadeState.showSecond);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.reverseDuration, const Duration(milliseconds: 200));
      expect(widget.firstCurve, Curves.easeIn);
      expect(widget.secondCurve, Curves.easeOut);
      expect(widget.sizeCurve, Curves.easeInOut);
      expect(widget.alignment, Alignment.center);
    });

    test('widgetName returns AnimatedCrossFade', () {
      expect(
        NapaAnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedCrossFade',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedCrossFade');
        expect(json['crossFadeState'], 'showFirst');
        expect(json['duration'], 300000);
        expect(json['firstCurve'], 'linear');
        expect(json['secondCurve'], 'linear');
        expect(json['sizeCurve'], 'linear');
        expect(json['alignment'], {'x': 0.0, 'y': -1.0});
        expect(json.containsKey('reverseDuration'), isFalse);
      });

      test('includes crossFadeState showSecond', () {
        final json = NapaAnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: CrossFadeState.showSecond,
        ).toJson();
        expect(json['crossFadeState'], 'showSecond');
      });

      test('includes children when present', () {
        final json = NapaAnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: createChildWidget(),
          secondChild: createChildWidget(),
        ).toJson();
        expect(json['firstChild']['_name'], 'SizedBox');
        expect(json['secondChild']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedCrossFade.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedCrossFade.decode({
          '_name': 'AnimatedCrossFade',
          'crossFadeState': 'showSecond',
          'duration': 500000,
          'reverseDuration': 200000,
          'firstCurve': 'easeIn',
          'secondCurve': 'easeOut',
          'sizeCurve': 'linear',
          'alignment': {'x': 0.0, 'y': 0.0},
        });
        expect(widget!.crossFadeState, CrossFadeState.showSecond);
        expect(widget.duration, const Duration(milliseconds: 500));
        expect(widget.reverseDuration, const Duration(milliseconds: 200));
        expect(widget.firstCurve, Curves.easeIn);
        expect(widget.secondCurve, Curves.easeOut);
        expect(widget.alignment, Alignment.center);
      });

      test('decodes with children', () {
        final widget = NapaAnimatedCrossFade.decode({
          '_name': 'AnimatedCrossFade',
          'crossFadeState': 'showFirst',
          'duration': 300000,
          'firstCurve': 'linear',
          'secondCurve': 'linear',
          'sizeCurve': 'linear',
          'alignment': {'x': 0.0, 'y': -1.0},
          'firstChild': createChildJson(),
          'secondChild': createChildJson(),
        });
        expect(widget!.firstChild, isA<NapaSizedBox>());
        expect(widget.secondChild, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedCrossFade.decode(original.toJson())!;
        expect(decoded.crossFadeState, CrossFadeState.showFirst);
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.firstCurve, Curves.linear);
        expect(decoded.reverseDuration, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedCrossFade(
          firstChild: NapaSizedBox(width: 10),
          secondChild: NapaSizedBox(height: 20),
          crossFadeState: CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 200),
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeOut,
          sizeCurve: Curves.easeInOut,
          alignment: Alignment.center,
        );
        final decoded = NapaAnimatedCrossFade.decode(original.toJson())!;
        expect(decoded.crossFadeState, CrossFadeState.showSecond);
        expect(decoded.duration, const Duration(milliseconds: 500));
        expect(decoded.reverseDuration, const Duration(milliseconds: 200));
        expect(decoded.firstChild, isA<NapaSizedBox>());
        expect(decoded.secondChild, isA<NapaSizedBox>());
        expect(decoded.alignment, Alignment.center);
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedCrossFade>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedCrossFade',
        'crossFadeState': 'showFirst',
        'duration': 300000,
        'firstCurve': 'linear',
        'secondCurve': 'linear',
        'sizeCurve': 'linear',
        'alignment': {'x': 0.0, 'y': -1.0},
      });
      expect(widget, isA<NapaAnimatedCrossFade>());
    });
  });
}
