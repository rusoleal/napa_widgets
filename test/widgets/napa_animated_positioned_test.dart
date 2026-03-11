import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedPositioned', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedPositioned(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.left, isNull);
      expect(widget.top, isNull);
      expect(widget.right, isNull);
      expect(widget.bottom, isNull);
      expect(widget.width, isNull);
      expect(widget.height, isNull);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedPositioned(
        left: 10.0,
        top: 20.0,
        right: 30.0,
        bottom: 40.0,
        width: 100.0,
        height: 200.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.left, 10.0);
      expect(widget.top, 20.0);
      expect(widget.right, 30.0);
      expect(widget.bottom, 40.0);
      expect(widget.width, 100.0);
      expect(widget.height, 200.0);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedPositioned', () {
      expect(
        NapaAnimatedPositioned(
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedPositioned',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedPositioned(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedPositioned');
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json.containsKey('left'), isFalse);
        expect(json.containsKey('top'), isFalse);
        expect(json.containsKey('right'), isFalse);
        expect(json.containsKey('bottom'), isFalse);
        expect(json.containsKey('width'), isFalse);
        expect(json.containsKey('height'), isFalse);
      });

      test('includes position values when set', () {
        final json = NapaAnimatedPositioned(
          left: 10.0,
          top: 20.0,
          right: 30.0,
          bottom: 40.0,
          width: 100.0,
          height: 200.0,
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['left'], 10.0);
        expect(json['top'], 20.0);
        expect(json['right'], 30.0);
        expect(json['bottom'], 40.0);
        expect(json['width'], 100.0);
        expect(json['height'], 200.0);
      });

      test('includes child when present', () {
        final json = NapaAnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedPositioned.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedPositioned.decode({
          '_name': 'AnimatedPositioned',
          'left': 10.0,
          'top': 20.0,
          'duration': 300000,
          'curve': 'linear',
        });
        expect(widget!.left, 10.0);
        expect(widget.top, 20.0);
        expect(widget.duration, const Duration(milliseconds: 300));
        expect(widget.right, isNull);
      });

      test('decodes with child', () {
        final widget = NapaAnimatedPositioned.decode({
          '_name': 'AnimatedPositioned',
          'duration': 300000,
          'curve': 'linear',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedPositioned(
          duration: const Duration(milliseconds: 300),
        );
        final decoded = NapaAnimatedPositioned.decode(original.toJson())!;
        expect(decoded.left, isNull);
        expect(decoded.top, isNull);
        expect(decoded.duration, const Duration(milliseconds: 300));
        expect(decoded.curve, Curves.linear);
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedPositioned(
          left: 10.0,
          top: 20.0,
          right: 30.0,
          bottom: 40.0,
          width: 100.0,
          height: 200.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedPositioned.decode(original.toJson())!;
        expect(decoded.left, 10.0);
        expect(decoded.top, 20.0);
        expect(decoded.right, 30.0);
        expect(decoded.bottom, 40.0);
        expect(decoded.width, 100.0);
        expect(decoded.height, 200.0);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedPositioned(
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedPositioned>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedPositioned',
        'duration': 300000,
        'curve': 'linear',
      });
      expect(widget, isA<NapaAnimatedPositioned>());
    });
  });
}
