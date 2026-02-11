import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NapaCustomPaint', () {
    test('constructs with defaults', () {
      final widget = NapaCustomPaint();
      expect(widget.painter, isNull);
      expect(widget.foregroundPainter, isNull);
      expect(widget.size, Size.zero);
      expect(widget.isComplex, false);
      expect(widget.willChange, false);
      expect(widget.child, isNull);
    });

    test('constructs with params', () {
      final painter = NapaCustomPainter(script: '');
      final widget = NapaCustomPaint(
        painter: painter,
        size: const Size(100, 200),
        isComplex: true,
        willChange: true,
        child: createChildWidget(),
      );
      expect(widget.painter, same(painter));
      expect(widget.size, const Size(100, 200));
      expect(widget.isComplex, true);
      expect(widget.willChange, true);
      expect(widget.child, isA<NapaSizedBox>());
    });

    test('widgetName returns CustomPaint', () {
      expect(NapaCustomPaint().widgetName, 'CustomPaint');
    });

    group('toJson', () {
      test('contains _name and required fields', () {
        final json = NapaCustomPaint().toJson();
        expect(json['_name'], 'CustomPaint');
        expect(json['size'], isA<Map>());
        expect(json['isComplex'], false);
        expect(json['willChange'], false);
      });

      test('excludes null painter and foregroundPainter', () {
        final json = NapaCustomPaint().toJson();
        expect(json.containsKey('painter'), isFalse);
        expect(json.containsKey('foregroundPainter'), isFalse);
      });

      test('includes painter when set', () {
        final painter = NapaCustomPainter(script: '');
        final json = NapaCustomPaint(painter: painter).toJson();
        expect(json['painter'], isA<Map>());
        expect(json['painter']['scriptType'], 'lua');
        expect(json['painter']['script'], '');
      });
    });

    group('NapaCustomPainter', () {
      test('constructs with defaults', () {
        final painter = NapaCustomPainter();
        expect(painter.script, '');
      });

      test('toJson serializes correctly', () {
        final painter = NapaCustomPainter(script: '');
        final json = painter.toJson();
        expect(json['scriptType'], 'lua');
        expect(json['script'], '');
      });

      test('decode returns null for null', () {
        expect(NapaCustomPainter.decode(null), isNull);
      });

      test('decode restores painter', () {
        final painter = NapaCustomPainter.decode({
          'scriptType': 'lua',
          'script': '',
        });
        expect(painter, isA<NapaCustomPainter>());
        expect(painter!.script, '');
      });

      test('getPainter returns a CustomPainter', () {
        final painter = NapaCustomPainter(script: '');
        expect(painter.getPainter(), isA<CustomPainter>());
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaCustomPaint.decode(null), isNull);
      });

      test('decodes basic properties', () {
        final widget = NapaCustomPaint.decode({
          '_name': 'CustomPaint',
          'isComplex': true,
          'willChange': true,
          'size': {'width': 50.0, 'height': 100.0},
          'painter': {'scriptType': 'lua', 'script': ''},
          'foregroundPainter': {'scriptType': 'lua', 'script': ''},
        });
        expect(widget, isA<NapaCustomPaint>());
        expect(widget!.isComplex, true);
        expect(widget.willChange, true);
        expect(widget.size, const Size(50, 100));
        expect(widget.painter, isA<NapaCustomPainter>());
        expect(widget.foregroundPainter, isA<NapaCustomPainter>());
      });
    });

    group('toWidget', () {
      test('returns CustomPaint', () {
        final widget = NapaCustomPaint().toWidget();
        expect(widget, isA<CustomPaint>());
      });

      test('passes size', () {
        final widget = NapaCustomPaint(
          size: const Size(100, 200),
        ).toWidget();
        expect(widget, isA<CustomPaint>());
        final cp = widget as CustomPaint;
        expect(cp.size, const Size(100, 200));
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'CustomPaint',
        'isComplex': false,
        'willChange': false,
        'size': {'width': 0.0, 'height': 0.0},
      });
      expect(widget, isA<NapaCustomPaint>());
    });
  });
}
