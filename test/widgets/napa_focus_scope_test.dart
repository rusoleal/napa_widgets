import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaFocusScope', () {
    test('constructs with defaults', () {
      final widget = NapaFocusScope();
      expect(widget.autofocus, isFalse);
      expect(widget.canRequestFocus, isTrue);
      expect(widget.skipTraversal, isFalse);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaFocusScope(
        autofocus: true,
        canRequestFocus: false,
        skipTraversal: true,
        child: child,
      );
      expect(widget.autofocus, isTrue);
      expect(widget.canRequestFocus, isFalse);
      expect(widget.skipTraversal, isTrue);
      expect(widget.child, same(child));
    });

    test('widgetName returns FocusScope', () {
      expect(NapaFocusScope().widgetName, 'FocusScope');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaFocusScope().toJson();
        expect(json['_name'], 'FocusScope');
        expect(json['autofocus'], isFalse);
        expect(json['canRequestFocus'], isTrue);
        expect(json['skipTraversal'], isFalse);
        expect(json.containsKey('child'), isFalse);
      });

      test('includes child when present', () {
        final json = NapaFocusScope(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaFocusScope.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaFocusScope.decode({
          '_name': 'FocusScope',
          'autofocus': true,
          'canRequestFocus': false,
          'skipTraversal': true,
        });
        expect(widget!.autofocus, isTrue);
        expect(widget.canRequestFocus, isFalse);
        expect(widget.skipTraversal, isTrue);
      });

      test('decodes with child', () {
        final widget = NapaFocusScope.decode({
          '_name': 'FocusScope',
          'autofocus': false,
          'canRequestFocus': true,
          'skipTraversal': false,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaFocusScope();
        final decoded = NapaFocusScope.decode(original.toJson())!;
        expect(decoded.autofocus, isFalse);
        expect(decoded.canRequestFocus, isTrue);
        expect(decoded.skipTraversal, isFalse);
        expect(decoded.child, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaFocusScope(
          autofocus: true,
          canRequestFocus: false,
          skipTraversal: true,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaFocusScope.decode(original.toJson())!;
        expect(decoded.autofocus, isTrue);
        expect(decoded.canRequestFocus, isFalse);
        expect(decoded.skipTraversal, isTrue);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaFocusScope().toWidget();
        expect(widget, isA<FocusScope>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'FocusScope',
        'autofocus': false,
        'canRequestFocus': true,
        'skipTraversal': false,
      });
      expect(widget, isA<NapaFocusScope>());
    });
  });
}
