import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaFractionallySizedBox', () {
    test('constructs with defaults', () {
      final widget = NapaFractionallySizedBox();
      expect(widget.alignment, Alignment.center);
      expect(widget.widthFactor, isNull);
      expect(widget.heightFactor, isNull);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaFractionallySizedBox(
        alignment: Alignment.topLeft,
        widthFactor: 0.5,
        heightFactor: 0.75,
        child: child,
      );
      expect(widget.widthFactor, 0.5);
      expect(widget.heightFactor, 0.75);
      expect(widget.child, same(child));
    });

    test('widgetName returns FractionallySizedBox', () {
      expect(NapaFractionallySizedBox().widgetName, 'FractionallySizedBox');
    });

    group('toJson', () {
      test('contains required fields', () {
        final json = NapaFractionallySizedBox().toJson();
        expect(json['_name'], 'FractionallySizedBox');
        expect(json['alignment'], isA<Map>());
        expect(json.containsKey('widthFactor'), false);
        expect(json.containsKey('heightFactor'), false);
      });

      test('includes factors when set', () {
        final json = NapaFractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.8,
        ).toJson();
        expect(json['widthFactor'], 0.5);
        expect(json['heightFactor'], 0.8);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaFractionallySizedBox.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaFractionallySizedBox.decode({
          '_name': 'FractionallySizedBox',
          'alignment': testAlignmentCenterJson(),
          'widthFactor': 0.5,
          'heightFactor': 0.75,
        });
        expect(widget!.widthFactor, 0.5);
        expect(widget.heightFactor, 0.75);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with factors', () {
        final original = NapaFractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.8,
        );
        final decoded = NapaFractionallySizedBox.decode(original.toJson())!;
        expect(decoded.widthFactor, 0.5);
        expect(decoded.heightFactor, 0.8);
      });
    });

    group('toWidget', () {
      test('returns FractionallySizedBox with correct properties', () {
        final widget = NapaFractionallySizedBox(
          widthFactor: 0.5,
        ).toWidget();
        expect(widget, isA<FractionallySizedBox>());
        expect((widget as FractionallySizedBox).widthFactor, 0.5);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'FractionallySizedBox',
        'alignment': testAlignmentCenterJson(),
      });
      expect(widget, isA<NapaFractionallySizedBox>());
    });
  });
}
