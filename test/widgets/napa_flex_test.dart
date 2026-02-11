import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NapaFlex', () {
    test('constructs with required direction', () {
      final widget = NapaFlex(direction: Axis.horizontal);
      expect(widget.direction, Axis.horizontal);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.crossAxisAlignment, CrossAxisAlignment.center);
      expect(widget.mainAxisAlignment, MainAxisAlignment.start);
      expect(widget.mainAxisSize, MainAxisSize.max);
      expect(widget.spacing, 0.0);
      expect(widget.textBaseline, isNull);
      expect(widget.textDirection, isNull);
      expect(widget.verticalDirection, VerticalDirection.down);
      expect(widget.children, isEmpty);
    });

    test('constructs with all params', () {
      final children = [createChildWidget(), createChildWidget()];
      final widget = NapaFlex(
        direction: Axis.vertical,
        clipBehavior: Clip.hardEdge,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 8.0,
        textBaseline: TextBaseline.alphabetic,
        textDirection: TextDirection.rtl,
        verticalDirection: VerticalDirection.up,
        children: children,
      );
      expect(widget.direction, Axis.vertical);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.crossAxisAlignment, CrossAxisAlignment.start);
      expect(widget.mainAxisAlignment, MainAxisAlignment.center);
      expect(widget.mainAxisSize, MainAxisSize.min);
      expect(widget.spacing, 8.0);
      expect(widget.textBaseline, TextBaseline.alphabetic);
      expect(widget.textDirection, TextDirection.rtl);
      expect(widget.verticalDirection, VerticalDirection.up);
      expect(widget.children.length, 2);
    });

    test('widgetName returns Flex', () {
      expect(NapaFlex(direction: Axis.horizontal).widgetName, 'Flex');
    });

    group('toJson', () {
      test('contains all fields', () {
        final json = NapaFlex(direction: Axis.horizontal).toJson();
        expect(json['_name'], 'Flex');
        expect(json['direction'], 'horizontal');
        expect(json['clipBehavior'], 'none');
        expect(json['crossAxisAlignment'], 'center');
        expect(json['mainAxisAlignment'], 'start');
        expect(json['mainAxisSize'], 'max');
        expect(json['spacing'], 0.0);
        expect(json['verticalDirection'], 'down');
        expect(json['children'], isA<List>());
      });

      test('excludes null textBaseline and textDirection', () {
        final json = NapaFlex(direction: Axis.horizontal).toJson();
        expect(json.containsKey('textBaseline'), isFalse);
        expect(json.containsKey('textDirection'), isFalse);
      });

      test('includes textBaseline when set', () {
        final json = NapaFlex(
          direction: Axis.horizontal,
          textBaseline: TextBaseline.alphabetic,
        ).toJson();
        expect(json['textBaseline'], 'alphabetic');
      });

      test('serializes children', () {
        final json = NapaFlex(
          direction: Axis.horizontal,
          children: [createChildWidget()],
        ).toJson();
        expect(json['children'], isA<List>());
        expect(json['children'].length, 1);
        expect(json['children'][0]['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('decode(null) crashes - no null guard', () {
        expect(NapaFlex.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaFlex.decode({
          '_name': 'Flex',
          'direction': 'vertical',
          'clipBehavior': 'hardEdge',
          'crossAxisAlignment': 'start',
          'mainAxisAlignment': 'center',
          'mainAxisSize': 'min',
          'spacing': 8.0,
          'textBaseline': 'alphabetic',
          'textDirection': 'rtl',
          'verticalDirection': 'up',
          'children': [createChildJson()],
        });
        expect(widget, isA<NapaFlex>());
        expect(widget!.direction, Axis.vertical);
        expect(widget.clipBehavior, Clip.hardEdge);
        expect(widget.spacing, 8.0);
        expect(widget.children.length, 1);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaFlex(direction: Axis.horizontal);
        final decoded = NapaFlex.decode(original.toJson())!;
        expect(decoded.direction, Axis.horizontal);
        expect(decoded.clipBehavior, Clip.none);
        expect(decoded.children, isEmpty);
      });

      test('round-trips with children', () {
        final original = NapaFlex(
          direction: Axis.vertical,
          spacing: 16.0,
          children: [NapaSizedBox(width: 10), NapaSizedBox(height: 20)],
        );
        final decoded = NapaFlex.decode(original.toJson())!;
        expect(decoded.direction, Axis.vertical);
        expect(decoded.spacing, 16.0);
        expect(decoded.children.length, 2);
      });
    });

    group('toWidget', () {
      test('returns Flex', () {
        final widget = NapaFlex(direction: Axis.horizontal).toWidget();
        expect(widget, isA<Flex>());
        expect((widget as Flex).direction, Axis.horizontal);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Flex',
        'direction': 'horizontal',
        'clipBehavior': 'none',
        'crossAxisAlignment': 'center',
        'mainAxisAlignment': 'start',
        'mainAxisSize': 'max',
        'spacing': 0.0,
        'verticalDirection': 'down',
        'children': [],
      });
      expect(widget, isA<NapaFlex>());
    });
  });

  group('NapaRow', () {
    test('constructs with defaults', () {
      final widget = NapaRow();
      expect(widget.direction, Axis.horizontal);
      expect(widget.crossAxisAlignment, CrossAxisAlignment.center);
      expect(widget.mainAxisAlignment, MainAxisAlignment.start);
    });

    test('widgetName returns Row', () {
      expect(NapaRow().widgetName, 'Row');
    });

    group('toJson', () {
      test('contains _name as Row', () {
        final json = NapaRow().toJson();
        expect(json['_name'], 'Row');
        expect(json['direction'], 'horizontal');
      });

      test('serializes children', () {
        final json = NapaRow(children: [createChildWidget()]).toJson();
        expect(json['children'].length, 1);
      });
    });

    group('decode', () {
      test('decode(null) - null guard', () {
        expect(NapaRow.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaRow.decode({
          '_name': 'Row',
          'crossAxisAlignment': 'start',
          'mainAxisAlignment': 'center',
          'mainAxisSize': 'min',
          'spacing': 4.0,
          'verticalDirection': 'down',
          'children': [createChildJson()],
        });
        expect(widget, isA<NapaRow>());
        expect(widget!.direction, Axis.horizontal);
        expect(widget.crossAxisAlignment, CrossAxisAlignment.start);
        expect(widget.children.length, 1);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaRow(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [NapaSizedBox(width: 10)],
        );
        final decoded = NapaRow.decode(original.toJson())!;
        expect(decoded.direction, Axis.horizontal);
        expect(decoded.mainAxisAlignment, MainAxisAlignment.center);
        expect(decoded.children.length, 1);
      });
    });

    group('toWidget', () {
      test('returns Row', () {
        final widget = NapaRow().toWidget();
        expect(widget, isA<Row>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Row',
        'crossAxisAlignment': 'center',
        'mainAxisAlignment': 'start',
        'mainAxisSize': 'max',
        'spacing': 0.0,
        'verticalDirection': 'down',
        'children': [],
      });
      expect(widget, isA<NapaRow>());
    });
  });

  group('NapaColumn', () {
    test('constructs with defaults', () {
      final widget = NapaColumn();
      expect(widget.direction, Axis.vertical);
    });

    test('widgetName returns Column', () {
      expect(NapaColumn().widgetName, 'Column');
    });

    group('toJson', () {
      test('contains _name as Column', () {
        final json = NapaColumn().toJson();
        expect(json['_name'], 'Column');
        expect(json['direction'], 'vertical');
      });
    });

    group('decode', () {
      test('decode(null) - null guard', () {
        expect(NapaColumn.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaColumn.decode({
          '_name': 'Column',
          'crossAxisAlignment': 'stretch',
          'mainAxisAlignment': 'end',
          'mainAxisSize': 'min',
          'spacing': 12.0,
          'verticalDirection': 'down',
          'children': [createChildJson(), createChildJson()],
        });
        expect(widget, isA<NapaColumn>());
        expect(widget!.direction, Axis.vertical);
        expect(widget.crossAxisAlignment, CrossAxisAlignment.stretch);
        expect(widget.mainAxisAlignment, MainAxisAlignment.end);
        expect(widget.children.length, 2);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaColumn(
          spacing: 8.0,
          children: [NapaSizedBox(height: 10)],
        );
        final decoded = NapaColumn.decode(original.toJson())!;
        expect(decoded.direction, Axis.vertical);
        expect(decoded.spacing, 8.0);
        expect(decoded.children.length, 1);
      });
    });

    group('toWidget', () {
      test('returns Column', () {
        final widget = NapaColumn().toWidget();
        expect(widget, isA<Column>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Column',
        'crossAxisAlignment': 'center',
        'mainAxisAlignment': 'start',
        'mainAxisSize': 'max',
        'spacing': 0.0,
        'verticalDirection': 'down',
        'children': [],
      });
      expect(widget, isA<NapaColumn>());
    });
  });
}
