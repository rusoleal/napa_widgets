import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaUnconstrainedBox', () {
    test('constructs with defaults', () {
      final widget = NapaUnconstrainedBox();
      expect(widget.alignment, Alignment.center);
      expect(widget.constrainedAxis, isNull);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaUnconstrainedBox(
        alignment: Alignment.topLeft,
        constrainedAxis: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        child: child,
      );
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.constrainedAxis, Axis.horizontal);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.child, same(child));
    });

    test('widgetName returns UnconstrainedBox', () {
      expect(NapaUnconstrainedBox().widgetName, 'UnconstrainedBox');
    });

    group('toJson', () {
      test('contains required fields', () {
        final json = NapaUnconstrainedBox().toJson();
        expect(json['_name'], 'UnconstrainedBox');
        expect(json['alignment'], isA<Map>());
        expect(json['clipBehavior'], 'none');
        expect(json.containsKey('constrainedAxis'), false);
      });

      test('includes constrainedAxis when set', () {
        final json = NapaUnconstrainedBox(
          constrainedAxis: Axis.vertical,
        ).toJson();
        expect(json['constrainedAxis'], 'vertical');
      });

      test('includes child when present', () {
        final json = NapaUnconstrainedBox(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaUnconstrainedBox.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaUnconstrainedBox.decode({
          '_name': 'UnconstrainedBox',
          'alignment': testAlignmentTopLeftJson(),
          'constrainedAxis': 'horizontal',
          'clipBehavior': 'hardEdge',
        });
        expect(widget!.constrainedAxis, Axis.horizontal);
        expect(widget.clipBehavior, Clip.hardEdge);
      });

      test('decodes with child', () {
        final widget = NapaUnconstrainedBox.decode({
          '_name': 'UnconstrainedBox',
          'alignment': testAlignmentCenterJson(),
          'clipBehavior': 'none',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaUnconstrainedBox();
        final decoded = NapaUnconstrainedBox.decode(original.toJson())!;
        expect(decoded.constrainedAxis, isNull);
        expect(decoded.clipBehavior, Clip.none);
      });

      test('round-trips with all properties', () {
        final original = NapaUnconstrainedBox(
          constrainedAxis: Axis.vertical,
          clipBehavior: Clip.antiAlias,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaUnconstrainedBox.decode(original.toJson())!;
        expect(decoded.constrainedAxis, Axis.vertical);
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns UnconstrainedBox', () {
        final widget = NapaUnconstrainedBox(
          constrainedAxis: Axis.horizontal,
        ).toWidget();
        expect(widget, isA<UnconstrainedBox>());
        expect((widget as UnconstrainedBox).constrainedAxis, Axis.horizontal);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'UnconstrainedBox',
        'alignment': testAlignmentCenterJson(),
        'clipBehavior': 'none',
      });
      expect(widget, isA<NapaUnconstrainedBox>());
    });
  });
}
