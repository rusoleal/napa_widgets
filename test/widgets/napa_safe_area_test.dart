import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaSafeArea', () {
    test('constructs with defaults', () {
      final widget = NapaSafeArea();
      expect(widget.left, true);
      expect(widget.top, true);
      expect(widget.right, true);
      expect(widget.bottom, true);
      expect(widget.minimum, EdgeInsets.zero);
      expect(widget.maintainBottomViewPadding, false);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaSafeArea(
        left: false,
        top: false,
        right: false,
        bottom: false,
        minimum: const EdgeInsets.all(8),
        maintainBottomViewPadding: true,
        child: child,
      );
      expect(widget.left, false);
      expect(widget.top, false);
      expect(widget.maintainBottomViewPadding, true);
      expect(widget.child, same(child));
    });

    test('widgetName returns SafeArea', () {
      expect(NapaSafeArea().widgetName, 'SafeArea');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaSafeArea().toJson();
        expect(json['_name'], 'SafeArea');
        expect(json['left'], true);
        expect(json['top'], true);
        expect(json['right'], true);
        expect(json['bottom'], true);
        expect(json['minimum'], isA<Map>());
        expect(json['maintainBottomViewPadding'], false);
      });

      test('includes child when present', () {
        final json = NapaSafeArea(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaSafeArea.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaSafeArea.decode({
          '_name': 'SafeArea',
          'left': false,
          'top': true,
          'right': false,
          'bottom': true,
          'minimum': testEdgeInsetsJson(),
          'maintainBottomViewPadding': true,
        });
        expect(widget!.left, false);
        expect(widget.right, false);
        expect(widget.maintainBottomViewPadding, true);
      });

      test('decodes with child', () {
        final widget = NapaSafeArea.decode({
          '_name': 'SafeArea',
          'left': true,
          'top': true,
          'right': true,
          'bottom': true,
          'minimum': {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0},
          'maintainBottomViewPadding': false,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with all properties', () {
        final original = NapaSafeArea(
          left: false,
          bottom: false,
          maintainBottomViewPadding: true,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaSafeArea.decode(original.toJson())!;
        expect(decoded.left, false);
        expect(decoded.bottom, false);
        expect(decoded.maintainBottomViewPadding, true);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns SafeArea with correct properties', () {
        final widget = NapaSafeArea(left: false, bottom: false).toWidget();
        expect(widget, isA<SafeArea>());
        expect((widget as SafeArea).left, false);
        expect(widget.bottom, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'SafeArea',
        'left': true,
        'top': true,
        'right': true,
        'bottom': true,
        'minimum': {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0},
        'maintainBottomViewPadding': false,
      });
      expect(widget, isA<NapaSafeArea>());
    });
  });
}
