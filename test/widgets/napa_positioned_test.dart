import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaPositioned', () {
    test('constructs with required child', () {
      final widget = NapaPositioned(child: createChildWidget());
      expect(widget.left, isNull);
      expect(widget.top, isNull);
      expect(widget.right, isNull);
      expect(widget.bottom, isNull);
      expect(widget.width, isNull);
      expect(widget.height, isNull);
    });

    test('constructs with all params', () {
      final widget = NapaPositioned(
        left: 10,
        top: 20,
        right: 30,
        bottom: 40,
        width: 50,
        height: 60,
        child: createChildWidget(),
      );
      expect(widget.left, 10);
      expect(widget.top, 20);
      expect(widget.right, 30);
      expect(widget.bottom, 40);
      expect(widget.width, 50);
      expect(widget.height, 60);
    });

    test('widgetName returns Positioned', () {
      expect(NapaPositioned(child: createChildWidget()).widgetName, 'Positioned');
    });

    group('toJson', () {
      test('contains _name and child, excludes null positions', () {
        final json = NapaPositioned(child: createChildWidget()).toJson();
        expect(json['_name'], 'Positioned');
        expect(json['child'], isA<Map>());
        expect(json.containsKey('left'), isFalse);
        expect(json.containsKey('top'), isFalse);
      });

      test('includes position values when set', () {
        final json = NapaPositioned(
          left: 10,
          top: 20,
          child: createChildWidget(),
        ).toJson();
        expect(json['left'], 10.0);
        expect(json['top'], 20.0);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaPositioned.decode(null), isNull);
      });

      test('decodes with position values', () {
        final widget = NapaPositioned.decode({
          '_name': 'Positioned',
          'left': 5.0,
          'top': 10.0,
          'right': 15.0,
          'bottom': 20.0,
          'width': 100.0,
          'height': 200.0,
          'child': createChildJson(),
        });
        expect(widget!.left, 5.0);
        expect(widget.top, 10.0);
        expect(widget.right, 15.0);
        expect(widget.bottom, 20.0);
        expect(widget.width, 100.0);
        expect(widget.height, 200.0);
      });

      test('decodes without position values', () {
        final widget = NapaPositioned.decode({
          '_name': 'Positioned',
          'child': createChildJson(),
        });
        expect(widget!.left, isNull);
        expect(widget.top, isNull);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with positions', () {
        final original = NapaPositioned(
          left: 10,
          top: 20,
          width: 100,
          height: 200,
          child: NapaSizedBox(width: 50),
        );
        final decoded = NapaPositioned.decode(original.toJson())!;
        expect(decoded.left, 10.0);
        expect(decoded.top, 20.0);
        expect(decoded.width, 100.0);
        expect(decoded.height, 200.0);
        expect(decoded.child, isA<NapaSizedBox>());
      });

      test('round-trips without positions', () {
        final original = NapaPositioned(child: NapaSizedBox());
        final decoded = NapaPositioned.decode(original.toJson())!;
        expect(decoded.left, isNull);
        expect(decoded.top, isNull);
        expect(decoded.right, isNull);
        expect(decoded.bottom, isNull);
      });
    });

    group('toWidget', () {
      test('returns Positioned', () {
        final widget = NapaPositioned(
          left: 10,
          top: 20,
          child: createChildWidget(),
        ).toWidget();
        expect(widget, isA<Positioned>());
        final p = widget as Positioned;
        expect(p.left, 10.0);
        expect(p.top, 20.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Positioned',
        'child': createChildJson(),
      });
      expect(widget, isA<NapaPositioned>());
    });
  });
}
