import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaPadding', () {
    test('constructs with required params', () {
      final widget = NapaPadding(padding: testEdgeInsets());
      expect(widget.padding, testEdgeInsets());
      expect(widget.child, isNull);
    });

    test('constructs with child', () {
      final child = createChildWidget();
      final widget = NapaPadding(padding: testEdgeInsets(), child: child);
      expect(widget.child, same(child));
    });

    test('widgetName returns Padding', () {
      expect(NapaPadding(padding: EdgeInsets.zero).widgetName, 'Padding');
    });

    group('toJson', () {
      test('contains _name and padding', () {
        final json = NapaPadding(padding: testEdgeInsets()).toJson();
        expect(json['_name'], 'Padding');
        expect(json['padding'], testEdgeInsetsJson());
      });

      test('includes child when present', () {
        final json = NapaPadding(
          padding: testEdgeInsets(),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaPadding.decode(null), isNull);
      });

      test('decodes padding', () {
        final widget = NapaPadding.decode({
          '_name': 'Padding',
          'padding': testEdgeInsetsJson(),
        });
        expect(widget, isA<NapaPadding>());
        final resolved = widget!.padding.resolve(TextDirection.ltr);
        expect(resolved.left, 8.0);
        expect(resolved.top, 8.0);
      });

      test('decodes with child', () {
        final widget = NapaPadding.decode({
          '_name': 'Padding',
          'padding': testEdgeInsetsJson(),
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaPadding(
          padding: testEdgeInsets(),
          child: NapaSizedBox(width: 20),
        );
        final decoded = NapaPadding.decode(original.toJson())!;
        final resolved = decoded.padding.resolve(TextDirection.ltr);
        expect(resolved.left, 8.0);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Padding with correct properties', () {
        final widget = NapaPadding(padding: testEdgeInsets()).toWidget();
        expect(widget, isA<Padding>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Padding',
        'padding': testEdgeInsetsJson(),
      });
      expect(widget, isA<NapaPadding>());
    });
  });
}
