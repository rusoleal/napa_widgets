import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaContainer', () {
    test('constructs with defaults', () {
      final widget = NapaContainer();
      expect(widget.alignment, isNull);
      expect(widget.padding, isNull);
      expect(widget.color, isNull);
      expect(widget.width, isNull);
      expect(widget.height, isNull);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.child, isNull);
    });

    test('constructs with dimensions', () {
      final widget = NapaContainer(width: 100, height: 200);
      expect(widget.width, 100);
      expect(widget.height, 200);
    });

    test('widgetName returns Container', () {
      expect(NapaContainer().widgetName, 'Container');
    });

    test('childMode is singleChild', () {
      expect(NapaContainer().childMode, NapaChildMode.singleChild);
    });

    group('toJson', () {
      test('contains _name and clipBehavior', () {
        final json = NapaContainer().toJson();
        expect(json['_name'], 'Container');
        expect(json['clipBehavior'], 'none');
      });

      test('excludes null optional fields', () {
        final json = NapaContainer().toJson();
        expect(json.containsKey('alignment'), isFalse);
        expect(json.containsKey('padding'), isFalse);
        expect(json.containsKey('color'), isFalse);
        expect(json.containsKey('width'), isFalse);
        expect(json.containsKey('height'), isFalse);
        expect(json.containsKey('child'), isFalse);
      });

      test('includes fields when set', () {
        final json = NapaContainer(
          width: 50,
          height: 75,
          clipBehavior: Clip.hardEdge,
          child: createChildWidget(),
        ).toJson();
        expect(json['width'], 50.0);
        expect(json['height'], 75.0);
        expect(json['clipBehavior'], 'hardEdge');
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('decode(null) - null guard', () {
        expect(NapaContainer.decode(null), isNull);
      });

      test('decodes with minimal data', () {
        final widget = NapaContainer.decode({
          'clipBehavior': 'none',
        });
        expect(widget, isA<NapaContainer>());
        expect(widget!.clipBehavior, Clip.none);
      });

      test('decodes with width and height', () {
        final widget = NapaContainer.decode({
          'width': 100.0,
          'height': 200.0,
          'clipBehavior': 'none',
        });
        expect(widget!.width, 100.0);
        expect(widget.height, 200.0);
      });

      test('decodes with child', () {
        final widget = NapaContainer.decode({
          'clipBehavior': 'none',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaContainer();
        final decoded = NapaContainer.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.none);
        expect(decoded.width, isNull);
        expect(decoded.height, isNull);
      });

      test('round-trips with dimensions', () {
        final original = NapaContainer(
          width: 100,
          height: 200,
          clipBehavior: Clip.hardEdge,
        );
        final decoded = NapaContainer.decode(original.toJson())!;
        expect(decoded.width, 100.0);
        expect(decoded.height, 200.0);
        expect(decoded.clipBehavior, Clip.hardEdge);
      });
    });

    group('toWidget', () {
      test('returns Container', () {
        final widget = NapaContainer().toWidget();
        expect(widget, isA<Container>());
      });

      test('passes width and height', () {
        final widget = NapaContainer(width: 50, height: 75).toWidget();
        final c = widget as Container;
        expect(c.constraints?.maxWidth, 50.0);
        expect(c.constraints?.maxHeight, 75.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Container',
        'clipBehavior': 'none',
      });
      expect(widget, isA<NapaContainer>());
    });
  });
}
