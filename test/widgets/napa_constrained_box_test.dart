import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaConstrainedBox', () {
    test('constructs with required params', () {
      final widget = NapaConstrainedBox(constraints: const BoxConstraints());
      expect(widget.constraints, const BoxConstraints());
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      const constraints = BoxConstraints(
        minWidth: 10,
        maxWidth: 100,
        minHeight: 20,
        maxHeight: 200,
      );
      final widget = NapaConstrainedBox(constraints: constraints, child: child);
      expect(widget.constraints, constraints);
      expect(widget.child, same(child));
    });

    test('widgetName returns ConstrainedBox', () {
      expect(
        NapaConstrainedBox(constraints: const BoxConstraints()).widgetName,
        'ConstrainedBox',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        const constraints = BoxConstraints(
          minWidth: 10,
          maxWidth: 100,
          minHeight: 20,
          maxHeight: 200,
        );
        final json = NapaConstrainedBox(constraints: constraints).toJson();
        expect(json['_name'], 'ConstrainedBox');
        expect(json['constraints']['minWidth'], 10.0);
        expect(json['constraints']['maxWidth'], 100.0);
        expect(json['constraints']['minHeight'], 20.0);
        expect(json['constraints']['maxHeight'], 200.0);
      });

      test('includes child when present', () {
        final json = NapaConstrainedBox(
          constraints: const BoxConstraints(),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaConstrainedBox.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaConstrainedBox.decode({
          '_name': 'ConstrainedBox',
          'constraints': {
            'minWidth': 5.0,
            'maxWidth': 50.0,
            'minHeight': 10.0,
            'maxHeight': 100.0,
          },
        });
        expect(widget!.constraints.minWidth, 5.0);
        expect(widget.constraints.maxWidth, 50.0);
        expect(widget.constraints.minHeight, 10.0);
        expect(widget.constraints.maxHeight, 100.0);
      });

      test('decodes with child', () {
        final widget = NapaConstrainedBox.decode({
          '_name': 'ConstrainedBox',
          'constraints': {
            'minWidth': 0.0,
            'maxWidth': double.infinity,
            'minHeight': 0.0,
            'maxHeight': double.infinity,
          },
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with constraints', () {
        const constraints = BoxConstraints(
          minWidth: 10,
          maxWidth: 200,
          minHeight: 5,
          maxHeight: 100,
        );
        final original = NapaConstrainedBox(constraints: constraints);
        final decoded = NapaConstrainedBox.decode(original.toJson())!;
        expect(decoded.constraints, constraints);
      });
    });

    group('toWidget', () {
      test('returns ConstrainedBox with correct properties', () {
        const constraints = BoxConstraints.tightFor(width: 100, height: 50);
        final widget = NapaConstrainedBox(constraints: constraints).toWidget();
        expect(widget, isA<ConstrainedBox>());
        expect((widget as ConstrainedBox).constraints, constraints);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ConstrainedBox',
        'constraints': {
          'minWidth': 0.0,
          'maxWidth': double.infinity,
          'minHeight': 0.0,
          'maxHeight': double.infinity,
        },
      });
      expect(widget, isA<NapaConstrainedBox>());
    });
  });
}
