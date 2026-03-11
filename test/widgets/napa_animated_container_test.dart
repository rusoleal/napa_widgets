import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAnimatedContainer', () {
    test('constructs with defaults', () {
      final widget = NapaAnimatedContainer(
        duration: const Duration(milliseconds: 300),
      );
      expect(widget.alignment, isNull);
      expect(widget.padding, isNull);
      expect(widget.color, isNull);
      expect(widget.width, isNull);
      expect(widget.height, isNull);
      expect(widget.constraints, isNull);
      expect(widget.margin, isNull);
      expect(widget.transform, isNull);
      expect(widget.transformAlignment, isNull);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.duration, const Duration(milliseconds: 300));
      expect(widget.curve, Curves.linear);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaAnimatedContainer(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        color: testColor(),
        width: 100.0,
        height: 200.0,
        margin: const EdgeInsets.all(4.0),
        clipBehavior: Clip.antiAlias,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: child,
      );
      expect(widget.alignment, Alignment.center);
      expect(widget.padding, const EdgeInsets.all(8.0));
      expect(widget.color, testColor());
      expect(widget.width, 100.0);
      expect(widget.height, 200.0);
      expect(widget.margin, const EdgeInsets.all(4.0));
      expect(widget.clipBehavior, Clip.antiAlias);
      expect(widget.duration, const Duration(milliseconds: 500));
      expect(widget.curve, Curves.easeIn);
      expect(widget.child, same(child));
    });

    test('widgetName returns AnimatedContainer', () {
      expect(
        NapaAnimatedContainer(
          duration: const Duration(milliseconds: 300),
        ).widgetName,
        'AnimatedContainer',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaAnimatedContainer(
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['_name'], 'AnimatedContainer');
        expect(json['duration'], 300000);
        expect(json['curve'], 'linear');
        expect(json['clipBehavior'], 'none');
        expect(json.containsKey('alignment'), isFalse);
        expect(json.containsKey('padding'), isFalse);
        expect(json.containsKey('color'), isFalse);
        expect(json.containsKey('width'), isFalse);
        expect(json.containsKey('height'), isFalse);
      });

      test('includes optional fields when set', () {
        final json = NapaAnimatedContainer(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          color: testColor(),
          width: 100.0,
          height: 200.0,
          margin: const EdgeInsets.all(4.0),
          duration: const Duration(milliseconds: 300),
        ).toJson();
        expect(json['alignment'], {'x': 0.0, 'y': 0.0});
        expect(json['padding'], {'left': 8.0, 'top': 8.0, 'right': 8.0, 'bottom': 8.0});
        expect(json['color'], {'r': 1.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'});
        expect(json['width'], 100.0);
        expect(json['height'], 200.0);
        expect(json['margin'], {'left': 4.0, 'top': 4.0, 'right': 4.0, 'bottom': 4.0});
      });

      test('includes child when present', () {
        final json = NapaAnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAnimatedContainer.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaAnimatedContainer.decode({
          '_name': 'AnimatedContainer',
          'width': 100.0,
          'height': 200.0,
          'clipBehavior': 'antiAlias',
          'duration': 300000,
          'curve': 'linear',
          'constraints': {'minWidth': 0.0, 'maxWidth': double.infinity, 'minHeight': 0.0, 'maxHeight': double.infinity},
        });
        expect(widget!.width, 100.0);
        expect(widget.height, 200.0);
        expect(widget.clipBehavior, Clip.antiAlias);
        expect(widget.duration, const Duration(milliseconds: 300));
      });

      test('decodes with child', () {
        final widget = NapaAnimatedContainer.decode({
          '_name': 'AnimatedContainer',
          'clipBehavior': 'none',
          'duration': 300000,
          'curve': 'linear',
          'constraints': {'minWidth': 0.0, 'maxWidth': double.infinity, 'minHeight': 0.0, 'maxHeight': double.infinity},
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: const BoxConstraints(),
        );
        final decoded = NapaAnimatedContainer.decode(original.toJson())!;
        expect(decoded.alignment, isNull);
        expect(decoded.color, isNull);
        expect(decoded.clipBehavior, Clip.none);
        expect(decoded.duration, const Duration(milliseconds: 300));
      });

      test('round-trips with all properties', () {
        final original = NapaAnimatedContainer(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          color: testColor(),
          width: 100.0,
          height: 200.0,
          constraints: const BoxConstraints(),
          clipBehavior: Clip.antiAlias,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAnimatedContainer.decode(original.toJson())!;
        expect(decoded.alignment, Alignment.center);
        expect(decoded.width, 100.0);
        expect(decoded.height, 200.0);
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaAnimatedContainer(
          duration: const Duration(milliseconds: 300),
        ).toWidget();
        expect(widget, isA<AnimatedContainer>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AnimatedContainer',
        'clipBehavior': 'none',
        'duration': 300000,
        'curve': 'linear',
        'constraints': {'minWidth': 0.0, 'maxWidth': double.infinity, 'minHeight': 0.0, 'maxHeight': double.infinity},
      });
      expect(widget, isA<NapaAnimatedContainer>());
    });
  });
}
