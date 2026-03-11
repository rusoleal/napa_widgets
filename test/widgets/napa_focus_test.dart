import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaFocus', () {
    test('constructs with defaults', () {
      final widget = NapaFocus();
      expect(widget.autofocus, isFalse);
      expect(widget.canRequestFocus, isTrue);
      expect(widget.skipTraversal, isFalse);
      expect(widget.descendantsAreFocusable, isTrue);
      expect(widget.descendantsAreTraversable, isTrue);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaFocus(
        autofocus: true,
        canRequestFocus: false,
        skipTraversal: true,
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
        child: child,
      );
      expect(widget.autofocus, isTrue);
      expect(widget.canRequestFocus, isFalse);
      expect(widget.skipTraversal, isTrue);
      expect(widget.descendantsAreFocusable, isFalse);
      expect(widget.descendantsAreTraversable, isFalse);
      expect(widget.child, same(child));
    });

    test('widgetName returns Focus', () {
      expect(NapaFocus().widgetName, 'Focus');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaFocus().toJson();
        expect(json['_name'], 'Focus');
        expect(json['autofocus'], isFalse);
        expect(json['canRequestFocus'], isTrue);
        expect(json['skipTraversal'], isFalse);
        expect(json['descendantsAreFocusable'], isTrue);
        expect(json['descendantsAreTraversable'], isTrue);
        expect(json.containsKey('child'), isFalse);
      });

      test('includes child when present', () {
        final json = NapaFocus(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaFocus.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaFocus.decode({
          '_name': 'Focus',
          'autofocus': true,
          'canRequestFocus': false,
          'skipTraversal': true,
          'descendantsAreFocusable': false,
          'descendantsAreTraversable': false,
        });
        expect(widget!.autofocus, isTrue);
        expect(widget.canRequestFocus, isFalse);
        expect(widget.skipTraversal, isTrue);
        expect(widget.descendantsAreFocusable, isFalse);
        expect(widget.descendantsAreTraversable, isFalse);
      });

      test('decodes with child', () {
        final widget = NapaFocus.decode({
          '_name': 'Focus',
          'autofocus': false,
          'canRequestFocus': true,
          'skipTraversal': false,
          'descendantsAreFocusable': true,
          'descendantsAreTraversable': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaFocus();
        final decoded = NapaFocus.decode(original.toJson())!;
        expect(decoded.autofocus, isFalse);
        expect(decoded.canRequestFocus, isTrue);
        expect(decoded.skipTraversal, isFalse);
        expect(decoded.descendantsAreFocusable, isTrue);
        expect(decoded.descendantsAreTraversable, isTrue);
        expect(decoded.child, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaFocus(
          autofocus: true,
          canRequestFocus: false,
          skipTraversal: true,
          descendantsAreFocusable: false,
          descendantsAreTraversable: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaFocus.decode(original.toJson())!;
        expect(decoded.autofocus, isTrue);
        expect(decoded.canRequestFocus, isFalse);
        expect(decoded.skipTraversal, isTrue);
        expect(decoded.descendantsAreFocusable, isFalse);
        expect(decoded.descendantsAreTraversable, isFalse);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaFocus().toWidget();
        expect(widget, isA<Focus>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Focus',
        'autofocus': false,
        'canRequestFocus': true,
        'skipTraversal': false,
        'descendantsAreFocusable': true,
        'descendantsAreTraversable': true,
      });
      expect(widget, isA<NapaFocus>());
    });
  });
}
