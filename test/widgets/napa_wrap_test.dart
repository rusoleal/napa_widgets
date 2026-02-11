import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NapaWrap', () {
    test('constructs with defaults', () {
      final widget = NapaWrap();
      expect(widget.alignment, WrapAlignment.start);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.crossAxisAlignment, WrapCrossAlignment.start);
      expect(widget.direction, Axis.horizontal);
      expect(widget.runAlignment, WrapAlignment.start);
      expect(widget.runSpacing, 0.0);
      expect(widget.spacing, 0.0);
      expect(widget.textDirection, isNull);
      expect(widget.verticalDirection, VerticalDirection.down);
      expect(widget.children, isEmpty);
    });

    test('constructs with all params', () {
      final widget = NapaWrap(
        alignment: WrapAlignment.center,
        clipBehavior: Clip.hardEdge,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.end,
        runSpacing: 4.0,
        spacing: 8.0,
        textDirection: TextDirection.rtl,
        verticalDirection: VerticalDirection.up,
        children: [createChildWidget()],
      );
      expect(widget.alignment, WrapAlignment.center);
      expect(widget.direction, Axis.vertical);
      expect(widget.spacing, 8.0);
      expect(widget.runSpacing, 4.0);
    });

    test('widgetName returns Wrap', () {
      expect(NapaWrap().widgetName, 'Wrap');
    });

    group('toJson', () {
      test('contains all fields', () {
        final json = NapaWrap().toJson();
        expect(json['_name'], 'Wrap');
        expect(json['alignment'], 'start');
        expect(json['clipBehavior'], 'none');
        expect(json['crossAxisAlignment'], 'start');
        expect(json['direction'], 'horizontal');
        expect(json['runAlignment'], 'start');
        expect(json['runSpacing'], 0.0);
        expect(json['spacing'], 0.0);
        expect(json['verticalDirection'], 'down');
        expect(json['children'], isA<List>());
      });

      test('excludes null textDirection', () {
        final json = NapaWrap().toJson();
        expect(json.containsKey('textDirection'), isFalse);
      });

      test('includes textDirection when set', () {
        final json = NapaWrap(textDirection: TextDirection.rtl).toJson();
        expect(json['textDirection'], 'rtl');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaWrap.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaWrap.decode({
          '_name': 'Wrap',
          'alignment': 'center',
          'clipBehavior': 'hardEdge',
          'crossAxisAlignment': 'center',
          'direction': 'vertical',
          'runAlignment': 'end',
          'runSpacing': 4.0,
          'spacing': 8.0,
          'verticalDirection': 'up',
          'children': [createChildJson()],
        });
        expect(widget!.alignment, WrapAlignment.center);
        expect(widget.direction, Axis.vertical);
        expect(widget.spacing, 8.0);
        expect(widget.children.length, 1);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaWrap();
        final decoded = NapaWrap.decode(original.toJson())!;
        expect(decoded.alignment, WrapAlignment.start);
        expect(decoded.spacing, 0.0);
        expect(decoded.children, isEmpty);
      });

      test('round-trips with children', () {
        final original = NapaWrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: [NapaSizedBox(width: 10), NapaSizedBox(width: 20)],
        );
        final decoded = NapaWrap.decode(original.toJson())!;
        expect(decoded.spacing, 16.0);
        expect(decoded.runSpacing, 8.0);
        expect(decoded.children.length, 2);
      });
    });

    group('toWidget', () {
      test('returns Wrap', () {
        final widget = NapaWrap().toWidget();
        expect(widget, isA<Wrap>());
      });

      test('passes children', () {
        final widget = NapaWrap(
          children: [NapaSizedBox(width: 10)],
        ).toWidget();
        expect(widget, isA<Wrap>());
        expect((widget as Wrap).children.length, 1);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Wrap',
        'alignment': 'start',
        'clipBehavior': 'none',
        'crossAxisAlignment': 'start',
        'direction': 'horizontal',
        'runAlignment': 'start',
        'runSpacing': 0.0,
        'spacing': 0.0,
        'verticalDirection': 'down',
        'children': [],
      });
      expect(widget, isA<NapaWrap>());
    });
  });
}
