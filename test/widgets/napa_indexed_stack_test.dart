import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaIndexedStack', () {
    test('constructs with defaults', () {
      final widget = NapaIndexedStack();
      expect(widget.index, 0);
      expect(widget.alignment, AlignmentDirectional.topStart);
      expect(widget.sizing, StackFit.loose);
      expect(widget.children, isEmpty);
    });

    test('constructs with all params', () {
      final children = [createChildWidget(), createChildWidget()];
      final widget = NapaIndexedStack(
        index: 1,
        alignment: Alignment.center,
        sizing: StackFit.expand,
        children: children,
      );
      expect(widget.index, 1);
      expect(widget.sizing, StackFit.expand);
      expect(widget.children.length, 2);
    });

    test('widgetName returns IndexedStack', () {
      expect(NapaIndexedStack().widgetName, 'IndexedStack');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaIndexedStack(index: 1).toJson();
        expect(json['_name'], 'IndexedStack');
        expect(json['index'], 1);
        expect(json['alignment'], isA<Map>());
        expect(json['sizing'], 'loose');
        expect(json['children'], isA<List>());
      });

      test('includes children', () {
        final json = NapaIndexedStack(
          children: [createChildWidget(), createChildWidget()],
        ).toJson();
        expect(json['children'].length, 2);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaIndexedStack.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaIndexedStack.decode({
          '_name': 'IndexedStack',
          'index': 2,
          'alignment': testAlignmentCenterJson(),
          'sizing': 'expand',
          'children': [],
        });
        expect(widget!.index, 2);
        expect(widget.sizing, StackFit.expand);
      });

      test('decodes children', () {
        final widget = NapaIndexedStack.decode({
          '_name': 'IndexedStack',
          'index': 0,
          'alignment': testAlignmentCenterJson(),
          'sizing': 'loose',
          'children': [createChildJson(), createChildJson()],
        });
        expect(widget!.children.length, 2);
        expect(widget.children.first, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaIndexedStack(index: 1);
        final decoded = NapaIndexedStack.decode(original.toJson())!;
        expect(decoded.index, 1);
        expect(decoded.sizing, StackFit.loose);
      });

      test('round-trips with children', () {
        final original = NapaIndexedStack(
          index: 0,
          sizing: StackFit.expand,
          children: [NapaSizedBox(width: 10), NapaSizedBox(height: 20)],
        );
        final decoded = NapaIndexedStack.decode(original.toJson())!;
        expect(decoded.index, 0);
        expect(decoded.sizing, StackFit.expand);
        expect(decoded.children.length, 2);
      });
    });

    group('toWidget', () {
      test('returns IndexedStack with correct properties', () {
        final widget = NapaIndexedStack(
          index: 1,
          children: [createChildWidget(), createChildWidget()],
        ).toWidget();
        expect(widget, isA<IndexedStack>());
        expect((widget as IndexedStack).index, 1);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'IndexedStack',
        'index': 0,
        'alignment': testAlignmentCenterJson(),
        'sizing': 'loose',
        'children': [],
      });
      expect(widget, isA<NapaIndexedStack>());
    });
  });
}
