import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaOverflowBox', () {
    test('constructs with defaults', () {
      final widget = NapaOverflowBox();
      expect(widget.alignment, Alignment.center);
      expect(widget.minWidth, isNull);
      expect(widget.maxWidth, isNull);
      expect(widget.minHeight, isNull);
      expect(widget.maxHeight, isNull);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaOverflowBox(
        alignment: Alignment.topLeft,
        minWidth: 0,
        maxWidth: 200,
        minHeight: 0,
        maxHeight: 100,
        child: child,
      );
      expect(widget.maxWidth, 200);
      expect(widget.maxHeight, 100);
      expect(widget.child, same(child));
    });

    test('widgetName returns OverflowBox', () {
      expect(NapaOverflowBox().widgetName, 'OverflowBox');
    });

    group('toJson', () {
      test('contains required fields', () {
        final json = NapaOverflowBox().toJson();
        expect(json['_name'], 'OverflowBox');
        expect(json['alignment'], isA<Map>());
        expect(json.containsKey('minWidth'), false);
        expect(json.containsKey('maxWidth'), false);
      });

      test('includes constraint values when set', () {
        final json = NapaOverflowBox(
          minWidth: 10,
          maxWidth: 200,
          minHeight: 5,
          maxHeight: 100,
        ).toJson();
        expect(json['minWidth'], 10.0);
        expect(json['maxWidth'], 200.0);
        expect(json['minHeight'], 5.0);
        expect(json['maxHeight'], 100.0);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaOverflowBox.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaOverflowBox.decode({
          '_name': 'OverflowBox',
          'alignment': testAlignmentCenterJson(),
          'minWidth': 10.0,
          'maxWidth': 200.0,
          'minHeight': 5.0,
          'maxHeight': 100.0,
        });
        expect(widget!.minWidth, 10.0);
        expect(widget.maxWidth, 200.0);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with constraint values', () {
        final original = NapaOverflowBox(
          minWidth: 10,
          maxWidth: 200,
          minHeight: 5,
          maxHeight: 100,
        );
        final decoded = NapaOverflowBox.decode(original.toJson())!;
        expect(decoded.minWidth, 10.0);
        expect(decoded.maxWidth, 200.0);
        expect(decoded.minHeight, 5.0);
        expect(decoded.maxHeight, 100.0);
      });
    });

    group('toWidget', () {
      test('returns OverflowBox', () {
        final widget = NapaOverflowBox(maxWidth: 200).toWidget();
        expect(widget, isA<OverflowBox>());
        expect((widget as OverflowBox).maxWidth, 200.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'OverflowBox',
        'alignment': testAlignmentCenterJson(),
      });
      expect(widget, isA<NapaOverflowBox>());
    });
  });
}
