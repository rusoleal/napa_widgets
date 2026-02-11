import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaAlign', () {
    test('constructs with defaults', () {
      final widget = NapaAlign();
      expect(widget.alignment, Alignment.center);
      expect(widget.widthFactor, isNull);
      expect(widget.heightFactor, isNull);
    });

    test('constructs with all params', () {
      final widget = NapaAlign(
        alignment: Alignment.topLeft,
        widthFactor: 2.0,
        heightFactor: 3.0,
        child: createChildWidget(),
      );
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.widthFactor, 2.0);
      expect(widget.heightFactor, 3.0);
      expect(widget.child, isA<NapaSizedBox>());
    });

    test('widgetName returns Align', () {
      expect(NapaAlign().widgetName, 'Align');
    });

    group('toJson', () {
      test('contains _name and alignment', () {
        final json = NapaAlign().toJson();
        expect(json['_name'], 'Align');
        expect(json['alignment'], testAlignmentCenterJson());
      });

      test('excludes null widthFactor and heightFactor', () {
        final json = NapaAlign().toJson();
        expect(json.containsKey('widthFactor'), isFalse);
        expect(json.containsKey('heightFactor'), isFalse);
      });

      test('includes widthFactor and heightFactor when set', () {
        final json = NapaAlign(widthFactor: 2.0, heightFactor: 3.0).toJson();
        expect(json['widthFactor'], 2.0);
        expect(json['heightFactor'], 3.0);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAlign.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaAlign.decode({
          '_name': 'Align',
          'alignment': testAlignmentTopLeftJson(),
          'widthFactor': 1.5,
          'heightFactor': 2.5,
        });
        expect(widget, isA<NapaAlign>());
        expect(widget!.widthFactor, 1.5);
        expect(widget.heightFactor, 2.5);
      });

      test('decodes with child', () {
        final widget = NapaAlign.decode({
          '_name': 'Align',
          'alignment': testAlignmentCenterJson(),
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaAlign();
        final decoded = NapaAlign.decode(original.toJson())!;
        expect(decoded.widthFactor, isNull);
        expect(decoded.heightFactor, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaAlign(
          alignment: Alignment.bottomRight,
          widthFactor: 2.0,
          heightFactor: 3.0,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAlign.decode(original.toJson())!;
        expect(decoded.widthFactor, 2.0);
        expect(decoded.heightFactor, 3.0);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Align', () {
        final widget = NapaAlign(alignment: Alignment.topLeft).toWidget();
        expect(widget, isA<Align>());
        expect((widget as Align).alignment, Alignment.topLeft);
      });

      test('passes widthFactor and heightFactor', () {
        final widget =
            NapaAlign(widthFactor: 2.0, heightFactor: 3.0).toWidget();
        final align = widget as Align;
        expect(align.widthFactor, 2.0);
        expect(align.heightFactor, 3.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Align',
        'alignment': testAlignmentCenterJson(),
      });
      expect(widget, isA<NapaAlign>());
    });
  });
}
