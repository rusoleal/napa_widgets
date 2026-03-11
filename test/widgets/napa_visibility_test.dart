import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaVisibility', () {
    test('constructs with defaults', () {
      final widget = NapaVisibility();
      expect(widget.visible, true);
      expect(widget.maintainState, false);
      expect(widget.maintainAnimation, false);
      expect(widget.maintainSize, false);
      expect(widget.maintainSemantics, false);
      expect(widget.maintainInteractivity, false);
      expect(widget.replacement, isA<NapaSizedBox>());
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final replacement = NapaSizedBox(width: 50, height: 50);
      final widget = NapaVisibility(
        visible: false,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        maintainSemantics: true,
        maintainInteractivity: true,
        replacement: replacement,
        child: child,
      );
      expect(widget.visible, false);
      expect(widget.maintainState, true);
      expect(widget.maintainAnimation, true);
      expect(widget.maintainSize, true);
      expect(widget.maintainSemantics, true);
      expect(widget.maintainInteractivity, true);
      expect(widget.replacement, same(replacement));
      expect(widget.child, same(child));
    });

    test('widgetName returns Visibility', () {
      expect(NapaVisibility().widgetName, 'Visibility');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaVisibility().toJson();
        expect(json['_name'], 'Visibility');
        expect(json['visible'], true);
        expect(json['maintainState'], false);
        expect(json['maintainAnimation'], false);
        expect(json['maintainSize'], false);
        expect(json['maintainSemantics'], false);
        expect(json['maintainInteractivity'], false);
        expect(json['replacement'], isA<Map>());
      });

      test('includes child when present', () {
        final json = NapaVisibility(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });

      test('omits child when absent', () {
        final json = NapaVisibility().toJson();
        expect(json.containsKey('child'), false);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaVisibility.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaVisibility.decode({
          '_name': 'Visibility',
          'visible': false,
          'maintainState': true,
          'maintainAnimation': true,
          'maintainSize': true,
          'maintainSemantics': true,
          'maintainInteractivity': true,
          'replacement': {'_name': 'SizedBox', 'width': 0.0, 'height': 0.0},
        });
        expect(widget!.visible, false);
        expect(widget.maintainState, true);
        expect(widget.maintainAnimation, true);
        expect(widget.maintainSize, true);
        expect(widget.maintainSemantics, true);
        expect(widget.maintainInteractivity, true);
      });

      test('decodes with child', () {
        final widget = NapaVisibility.decode({
          '_name': 'Visibility',
          'visible': true,
          'maintainState': false,
          'maintainAnimation': false,
          'maintainSize': false,
          'maintainSemantics': false,
          'maintainInteractivity': false,
          'replacement': {'_name': 'SizedBox', 'width': 0.0, 'height': 0.0},
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaVisibility();
        final decoded = NapaVisibility.decode(original.toJson())!;
        expect(decoded.visible, true);
        expect(decoded.maintainState, false);
      });

      test('round-trips with all properties', () {
        final original = NapaVisibility(
          visible: false,
          maintainState: true,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaVisibility.decode(original.toJson())!;
        expect(decoded.visible, false);
        expect(decoded.maintainState, true);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Visibility with correct properties', () {
        final widget = NapaVisibility(visible: false).toWidget();
        expect(widget, isA<Visibility>());
        expect((widget as Visibility).visible, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Visibility',
        'visible': true,
        'maintainState': false,
        'maintainAnimation': false,
        'maintainSize': false,
        'maintainSemantics': false,
        'maintainInteractivity': false,
        'replacement': {'_name': 'SizedBox', 'width': 0.0, 'height': 0.0},
      });
      expect(widget, isA<NapaVisibility>());
    });
  });
}
