import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaOpacity', () {
    test('constructs with required params', () {
      final widget = NapaOpacity(opacity: 0.5);
      expect(widget.opacity, 0.5);
      expect(widget.alwaysIncludeSemantics, false);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaOpacity(
        opacity: 0.75,
        alwaysIncludeSemantics: true,
        child: child,
      );
      expect(widget.opacity, 0.75);
      expect(widget.alwaysIncludeSemantics, true);
      expect(widget.child, same(child));
    });

    test('widgetName returns Opacity', () {
      expect(NapaOpacity(opacity: 1.0).widgetName, 'Opacity');
    });

    test('toString contains percentage', () {
      expect(NapaOpacity(opacity: 0.5).toString(), 'Opacity(50%)');
      expect(NapaOpacity(opacity: 1.0).toString(), 'Opacity(100%)');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaOpacity(opacity: 0.5).toJson();
        expect(json['_name'], 'Opacity');
        expect(json['opacity'], 0.5);
        expect(json['alwaysIncludeSemantics'], false);
      });

      test('includes child when present', () {
        final json = NapaOpacity(
          opacity: 1.0,
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaOpacity.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaOpacity.decode({
          '_name': 'Opacity',
          'opacity': 0.3,
          'alwaysIncludeSemantics': true,
        });
        expect(widget!.opacity, 0.3);
        expect(widget.alwaysIncludeSemantics, true);
      });

      test('decodes with child', () {
        final widget = NapaOpacity.decode({
          '_name': 'Opacity',
          'opacity': 1.0,
          'alwaysIncludeSemantics': false,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaOpacity(opacity: 0.5);
        final decoded = NapaOpacity.decode(original.toJson())!;
        expect(decoded.opacity, 0.5);
        expect(decoded.alwaysIncludeSemantics, false);
      });

      test('round-trips with all properties', () {
        final original = NapaOpacity(
          opacity: 0.8,
          alwaysIncludeSemantics: true,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaOpacity.decode(original.toJson())!;
        expect(decoded.opacity, 0.8);
        expect(decoded.alwaysIncludeSemantics, true);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Opacity with correct properties', () {
        final widget = NapaOpacity(opacity: 0.5).toWidget();
        expect(widget, isA<Opacity>());
        final o = widget as Opacity;
        expect(o.opacity, 0.5);
        expect(o.alwaysIncludeSemantics, false);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Opacity',
        'opacity': 0.7,
        'alwaysIncludeSemantics': false,
      });
      expect(widget, isA<NapaOpacity>());
    });
  });
}
