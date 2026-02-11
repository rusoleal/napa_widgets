import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaSizedBox', () {
    test('constructs with defaults', () {
      final widget = NapaSizedBox();
      expect(widget.width, isNull);
      expect(widget.height, isNull);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaSizedBox(width: 100, height: 200, child: child);
      expect(widget.width, 100);
      expect(widget.height, 200);
      expect(widget.child, same(child));
    });

    test('widgetName returns SizedBox', () {
      expect(NapaSizedBox().widgetName, 'SizedBox');
    });

    group('toJson', () {
      test('contains _name', () {
        final json = NapaSizedBox().toJson();
        expect(json['_name'], 'SizedBox');
      });

      test('excludes null width and height', () {
        final json = NapaSizedBox().toJson();
        expect(json.containsKey('width'), isFalse);
        expect(json.containsKey('height'), isFalse);
      });

      test('includes width and height when set', () {
        final json = NapaSizedBox(width: 50, height: 75).toJson();
        expect(json['width'], 50.0);
        expect(json['height'], 75.0);
      });

      test('includes child when present', () {
        final json = NapaSizedBox(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaSizedBox.decode(null), isNull);
      });

      test('decodes with width and height', () {
        final widget = NapaSizedBox.decode({
          '_name': 'SizedBox',
          'width': 100.0,
          'height': 200.0,
        });
        expect(widget!.width, 100.0);
        expect(widget.height, 200.0);
      });

      test('decodes with null dimensions', () {
        final widget = NapaSizedBox.decode({'_name': 'SizedBox'});
        expect(widget!.width, isNull);
        expect(widget.height, isNull);
      });

      test('decodes with child', () {
        final widget = NapaSizedBox.decode({
          '_name': 'SizedBox',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaSizedBox();
        final decoded = NapaSizedBox.decode(original.toJson())!;
        expect(decoded.width, isNull);
        expect(decoded.height, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaSizedBox(
          width: 42,
          height: 84,
          child: NapaRepaintBoundary(),
        );
        final decoded = NapaSizedBox.decode(original.toJson())!;
        expect(decoded.width, 42.0);
        expect(decoded.height, 84.0);
        expect(decoded.child, isA<NapaRepaintBoundary>());
      });
    });

    group('toWidget', () {
      test('returns SizedBox', () {
        final widget = NapaSizedBox(width: 10, height: 20).toWidget();
        expect(widget, isA<SizedBox>());
        final sb = widget as SizedBox;
        expect(sb.width, 10.0);
        expect(sb.height, 20.0);
      });

      test('passes child', () {
        final widget = NapaSizedBox(child: NapaRepaintBoundary()).toWidget();
        expect(widget, isA<SizedBox>());
        expect((widget as SizedBox).child, isA<RepaintBoundary>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'SizedBox',
        'width': 10.0,
      });
      expect(widget, isA<NapaSizedBox>());
      expect((widget as NapaSizedBox).width, 10.0);
    });
  });
}
