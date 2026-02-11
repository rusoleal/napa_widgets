import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NapaStack', () {
    test('constructs with defaults', () {
      final widget = NapaStack();
      expect(widget.alignment, AlignmentDirectional.topStart);
      expect(widget.fit, StackFit.loose);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.children, isEmpty);
    });

    test('constructs with all params', () {
      final widget = NapaStack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [createChildWidget()],
      );
      expect(widget.alignment, Alignment.center);
      expect(widget.fit, StackFit.expand);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.children.length, 1);
    });

    test('widgetName returns Stack', () {
      expect(NapaStack().widgetName, 'Stack');
    });

    group('toJson', () {
      test('contains all fields', () {
        final json = NapaStack().toJson();
        expect(json['_name'], 'Stack');
        expect(json['clipBehavior'], 'hardEdge');
        expect(json['fit'], 'loose');
        expect(json['alignment'], isA<Map>());
        expect(json['children'], isA<List>());
      });

      test('excludes null textDirection', () {
        final json = NapaStack().toJson();
        expect(json.containsKey('textDirection'), isFalse);
      });

      test('serializes children', () {
        final json = NapaStack(
          children: [createChildWidget(), createChildWidget()],
        ).toJson();
        expect(json['children'].length, 2);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaStack.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaStack.decode({
          '_name': 'Stack',
          'alignment': testAlignmentCenterJson(),
          'clipBehavior': 'none',
          'fit': 'expand',
          'children': [createChildJson()],
        });
        expect(widget!.clipBehavior, Clip.none);
        expect(widget.fit, StackFit.expand);
        expect(widget.children.length, 1);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaStack();
        final decoded = NapaStack.decode(original.toJson())!;
        expect(decoded.fit, StackFit.loose);
        expect(decoded.clipBehavior, Clip.hardEdge);
        expect(decoded.children, isEmpty);
      });

      test('round-trips with children', () {
        final original = NapaStack(
          fit: StackFit.expand,
          children: [
            NapaPositioned(left: 10, child: NapaSizedBox(width: 50)),
          ],
        );
        final decoded = NapaStack.decode(original.toJson())!;
        expect(decoded.fit, StackFit.expand);
        expect(decoded.children.length, 1);
        expect(decoded.children[0], isA<NapaPositioned>());
      });
    });

    group('toWidget', () {
      test('returns Stack', () {
        final widget = NapaStack().toWidget();
        expect(widget, isA<Stack>());
      });

      test('passes children', () {
        final widget = NapaStack(
          children: [NapaSizedBox(width: 10)],
        ).toWidget();
        expect(widget, isA<Stack>());
        expect((widget as Stack).children.length, 1);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Stack',
        'alignment': testAlignmentTopLeftJson(),
        'clipBehavior': 'hardEdge',
        'fit': 'loose',
        'children': [],
      });
      expect(widget, isA<NapaStack>());
    });
  });
}
