import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedSize', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedSize(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.alignment, Alignment.center);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.reverseDuration, isNull);
      expect(widget.curve, Curves.linear);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedSize(
        alignment: Alignment.topLeft,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        clipBehavior: Clip.antiAlias,
        child: child,
      );
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.reverseDuration, const Duration(milliseconds: 200));
      expect(widget.curve, Curves.easeIn);
      expect(widget.clipBehavior, Clip.antiAlias);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedSize', () {
      expect(
        NapaAnimatedSize(duration: const Duration(milliseconds: 300)).widgetName,
        'AnimatedSize',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedSize(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedSize');
        expect(json['alignment'], {'x': 0.0, 'y': 0.0});
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json['clipBehavior'], 'hardEdge');
        expect(json.containsKey('reverseDuration'), isFalse);
      });

      test('includes reverseDuration when set', () {
        final json = NapaAnimatedSize(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 200),
        ).toJson();
        expect(json['reverseDuration'], 200000);
      });

      test('includes child when present', () {
        final json = NapaAnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedSize.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedSize.decode({
          '_name': 'AnimatedSize',
          'alignment': {'x': -1.0, 'y': -1.0},
          'duration': 300000,
          'reverseDuration': 200000,
          'curve': 'linear',
          'clipBehavior': 'antiAlias',
        });
        expect(widget!.alignment, Alignment.topLeft);
        expect(widget.duration, const Duration(milliseconds: 300));
        expect(widget.reverseDuration, const Duration(milliseconds: 200));
        expect(widget.clipBehavior, Clip.antiAlias);
      });

      test('decodes with child', () {
        final widget = NapaAnimatedSize.decode({
          '_name': 'AnimatedSize',
          'alignment': {'x': 0.0, 'y': 0.0},
          'duration': 300000,
          'curve': 'linear',
          'clipBehavior': 'hardEdge',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedSize(
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedSize.decode(original.toJson())!;
        expect(decoded.alignment, Alignment.center);
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.curve, Curves.linear);
        expect(decoded.clipBehavior, Clip.hardEdge);
        expect(decoded.reverseDuration, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedSize(
          alignment: Alignment.topLeft,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          clipBehavior: Clip.antiAlias,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedSize.decode(original.toJson())!;
        expect(decoded.alignment, Alignment.topLeft);
        expect(decoded.duration, const Duration(milliseconds: 500));
        expect(decoded.reverseDuration, const Duration(milliseconds: 200));
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedSize(
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedSize>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedSize',
        'alignment': {'x': 0.0, 'y': 0.0},
        'duration': 300000,
        'curve': 'linear',
        'clipBehavior': 'hardEdge',
      });
      expect(widget, isA<NapaAnimatedSize>());
    });
  });
}
