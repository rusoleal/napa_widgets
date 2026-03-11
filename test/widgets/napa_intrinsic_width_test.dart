import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaIntrinsicWidth', () {
    test('constructs with defaults', () {
      final widget = NapaIntrinsicWidth();
      expect(widget.stepWidth, isNull);
      expect(widget.stepHeight, isNull);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaIntrinsicWidth(
        stepWidth: 10.0,
        stepHeight: 20.0,
        child: child,
      );
      expect(widget.stepWidth, 10.0);
      expect(widget.stepHeight, 20.0);
      expect(widget.child, same(child));
    });

    test('widgetName returns IntrinsicWidth', () {
      expect(NapaIntrinsicWidth().widgetName, 'IntrinsicWidth');
    });

    group('toJson', () {
      test('omits null steps', () {
        final json = NapaIntrinsicWidth().toJson();
        expect(json['_name'], 'IntrinsicWidth');
        expect(json.containsKey('stepWidth'), false);
        expect(json.containsKey('stepHeight'), false);
      });

      test('includes steps when set', () {
        final json = NapaIntrinsicWidth(
          stepWidth: 10.0,
          stepHeight: 20.0,
        ).toJson();
        expect(json['stepWidth'], 10.0);
        expect(json['stepHeight'], 20.0);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaIntrinsicWidth.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaIntrinsicWidth.decode({
          '_name': 'IntrinsicWidth',
          'stepWidth': 10.0,
          'stepHeight': 20.0,
        });
        expect(widget!.stepWidth, 10.0);
        expect(widget.stepHeight, 20.0);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with steps', () {
        final original = NapaIntrinsicWidth(stepWidth: 10, stepHeight: 20);
        final decoded = NapaIntrinsicWidth.decode(original.toJson())!;
        expect(decoded.stepWidth, 10.0);
        expect(decoded.stepHeight, 20.0);
      });
    });

    group('toWidget', () {
      test('returns IntrinsicWidth with correct properties', () {
        final widget = NapaIntrinsicWidth(stepWidth: 10, stepHeight: 5).toWidget();
        expect(widget, isA<IntrinsicWidth>());
        expect((widget as IntrinsicWidth).stepWidth, 10.0);
        expect(widget.stepHeight, 5.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({'_name': 'IntrinsicWidth'});
      expect(widget, isA<NapaIntrinsicWidth>());
    });
  });
}
