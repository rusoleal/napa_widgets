import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaPhysicalModel', () {
    test('constructs with defaults', () {
      final widget = NapaPhysicalModel(color: testColor());
      expect(widget.shape, BoxShape.rectangle);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.elevation, 0.0);
      expect(widget.color, testColor());
      expect(widget.shadowColor, const Color(0xFF000000));
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaPhysicalModel(
        shape: BoxShape.circle,
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        color: testColor(),
        shadowColor: const Color(0xFFFFFFFF),
        child: child,
      );
      expect(widget.shape, BoxShape.circle);
      expect(widget.clipBehavior, Clip.antiAlias);
      expect(widget.elevation, 4.0);
      expect(widget.color, testColor());
      expect(widget.shadowColor, const Color(0xFFFFFFFF));
      expect(widget.child, same(child));
    });

    test('widgetName returns PhysicalModel', () {
      expect(NapaPhysicalModel(color: testColor()).widgetName, 'PhysicalModel');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaPhysicalModel(color: testColor()).toJson();
        expect(json['_name'], 'PhysicalModel');
        expect(json['shape'], 'rectangle');
        expect(json['clipBehavior'], 'none');
        expect(json['elevation'], 0.0);
        expect(json['color'], {'r': 1.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'});
        expect(json.containsKey('shadowColor'), isTrue);
      });

      test('includes child when present', () {
        final json = NapaPhysicalModel(
          color: testColor(),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaPhysicalModel.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaPhysicalModel.decode({
          '_name': 'PhysicalModel',
          'shape': 'circle',
          'clipBehavior': 'antiAlias',
          'elevation': 4.0,
          'color': {'r': 1.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'},
          'shadowColor': {'r': 1.0, 'g': 1.0, 'b': 1.0, 'a': 1.0, 'colorSpace': 'sRGB'},
        });
        expect(widget!.shape, BoxShape.circle);
        expect(widget.clipBehavior, Clip.antiAlias);
        expect(widget.elevation, 4.0);
      });

      test('decodes with child', () {
        final widget = NapaPhysicalModel.decode({
          '_name': 'PhysicalModel',
          'shape': 'rectangle',
          'clipBehavior': 'none',
          'elevation': 0.0,
          'color': {'r': 1.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'},
          'shadowColor': {'r': 0.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'},
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaPhysicalModel(color: testColor());
        final decoded = NapaPhysicalModel.decode(original.toJson())!;
        expect(decoded.shape, BoxShape.rectangle);
        expect(decoded.clipBehavior, Clip.none);
        expect(decoded.elevation, 0.0);
      });

      test('round-trips with all properties', () {
        final original = NapaPhysicalModel(
          shape: BoxShape.circle,
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          color: testColor(),
          shadowColor: const Color(0xFFFFFFFF),
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaPhysicalModel.decode(original.toJson())!;
        expect(decoded.shape, BoxShape.circle);
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.elevation, 4.0);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaPhysicalModel(
          color: testColor(),
          elevation: 2.0,
        ).toWidget();
        expect(widget, isA<PhysicalModel>());
        expect((widget as PhysicalModel).elevation, 2.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'PhysicalModel',
        'shape': 'rectangle',
        'clipBehavior': 'none',
        'elevation': 0.0,
        'color': {'r': 1.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'},
        'shadowColor': {'r': 0.0, 'g': 0.0, 'b': 0.0, 'a': 1.0, 'colorSpace': 'sRGB'},
      });
      expect(widget, isA<NapaPhysicalModel>());
    });
  });
}
