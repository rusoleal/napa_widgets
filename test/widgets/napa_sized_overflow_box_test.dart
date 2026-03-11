import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaSizedOverflowBox', () {
    test('constructs with required params', () {
      final widget = NapaSizedOverflowBox(size: const Size(100, 50));
      expect(widget.alignment, Alignment.center);
      expect(widget.size, const Size(100, 50));
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaSizedOverflowBox(
        alignment: Alignment.topLeft,
        size: const Size(200, 100),
        child: child,
      );
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.size, const Size(200, 100));
      expect(widget.child, same(child));
    });

    test('widgetName returns SizedOverflowBox', () {
      expect(
        NapaSizedOverflowBox(size: const Size(0, 0)).widgetName,
        'SizedOverflowBox',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaSizedOverflowBox(size: const Size(100, 50)).toJson();
        expect(json['_name'], 'SizedOverflowBox');
        expect(json['alignment'], isA<Map>());
        expect(json['size']['width'], 100.0);
        expect(json['size']['height'], 50.0);
      });

      test('includes child when present', () {
        final json = NapaSizedOverflowBox(
          size: const Size(10, 10),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaSizedOverflowBox.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaSizedOverflowBox.decode({
          '_name': 'SizedOverflowBox',
          'alignment': testAlignmentCenterJson(),
          'size': testSizeJson(width: 100, height: 50),
        });
        expect(widget!.size, const Size(100, 50));
      });

      test('decodes with child', () {
        final widget = NapaSizedOverflowBox.decode({
          '_name': 'SizedOverflowBox',
          'alignment': testAlignmentCenterJson(),
          'size': testSizeJson(width: 10, height: 10),
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips', () {
        final original = NapaSizedOverflowBox(
          size: const Size(200, 100),
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaSizedOverflowBox.decode(original.toJson())!;
        expect(decoded.size, const Size(200, 100));
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns SizedOverflowBox with correct size', () {
        final widget = NapaSizedOverflowBox(size: const Size(100, 50)).toWidget();
        expect(widget, isA<SizedOverflowBox>());
        expect((widget as SizedOverflowBox).size, const Size(100, 50));
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'SizedOverflowBox',
        'alignment': testAlignmentCenterJson(),
        'size': testSizeJson(width: 10, height: 10),
      });
      expect(widget, isA<NapaSizedOverflowBox>());
    });
  });
}
