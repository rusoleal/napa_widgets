import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedSwitcher', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.reverseDuration, isNull);
      expect(widget.switchInCurve, Curves.linear);
      expect(widget.switchOutCurve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: child,
      );
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.reverseDuration, const Duration(milliseconds: 200));
      expect(widget.switchInCurve, Curves.easeIn);
      expect(widget.switchOutCurve, Curves.easeOut);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedSwitcher', () {
      expect(
        NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedSwitcher',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedSwitcher');
        expect(json['duration'], 300000);
        expect(json['switchInCurve'], 'linear');
        expect(json['switchOutCurve'], 'linear');
        expect(json.containsKey('reverseDuration'), isFalse);
        expect(json.containsKey('child'), isFalse);
      });

      test('includes reverseDuration when set', () {
        final json = NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 200),
        ).toJson();
        expect(json['reverseDuration'], 200000);
      });

      test('includes child when present', () {
        final json = NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedSwitcher.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedSwitcher.decode({
          '_name': 'AnimatedSwitcher',
          'duration': 500000,
          'reverseDuration': 200000,
          'switchInCurve': 'easeIn',
          'switchOutCurve': 'easeOut',
        });
        expect(widget!.duration, const Duration(milliseconds: 500));
        expect(widget.reverseDuration, const Duration(milliseconds: 200));
        expect(widget.switchInCurve, Curves.easeIn);
        expect(widget.switchOutCurve, Curves.easeOut);
      });

      test('decodes with child', () {
        final widget = NapaAnimatedSwitcher.decode({
          '_name': 'AnimatedSwitcher',
          'duration': 300000,
          'switchInCurve': 'linear',
          'switchOutCurve': 'linear',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedSwitcher.decode(original.toJson())!;
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.switchInCurve, Curves.linear);
        expect(decoded.switchOutCurve, Curves.linear);
        expect(decoded.reverseDuration, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedSwitcher.decode(original.toJson())!;
        expect(decoded.duration, const Duration(milliseconds: 500));
        expect(decoded.reverseDuration, const Duration(milliseconds: 200));
        expect(decoded.switchInCurve, Curves.easeIn);
        expect(decoded.switchOutCurve, Curves.easeOut);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedSwitcher>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedSwitcher',
        'duration': 300000,
        'switchInCurve': 'linear',
        'switchOutCurve': 'linear',
      });
      expect(widget, isA<NapaAnimatedSwitcher>());
    });
  });
}
