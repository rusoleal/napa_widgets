import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaSemantics', () {
    test('constructs with defaults', () {
      final widget = NapaSemantics();
      expect(widget.container, isFalse);
      expect(widget.explicitChildNodes, isFalse);
      expect(widget.excludeSemantics, isFalse);
      expect(widget.enabled, isNull);
      expect(widget.checked, isNull);
      expect(widget.label, isNull);
      expect(widget.value, isNull);
      expect(widget.hint, isNull);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaSemantics(
        container: true,
        explicitChildNodes: true,
        excludeSemantics: true,
        enabled: true,
        checked: false,
        selected: true,
        button: false,
        link: true,
        header: false,
        textField: true,
        readOnly: false,
        focusable: true,
        focused: false,
        hidden: true,
        image: false,
        liveRegion: true,
        obscured: false,
        multiline: true,
        scopesRoute: false,
        namesRoute: true,
        label: 'test label',
        value: 'test value',
        hint: 'test hint',
        child: child,
      );
      expect(widget.container, isTrue);
      expect(widget.explicitChildNodes, isTrue);
      expect(widget.excludeSemantics, isTrue);
      expect(widget.enabled, isTrue);
      expect(widget.checked, isFalse);
      expect(widget.label, 'test label');
      expect(widget.value, 'test value');
      expect(widget.hint, 'test hint');
      expect(widget.child, same(child));
    });

    test('widgetName returns Semantics', () {
      expect(NapaSemantics().widgetName, 'Semantics');
    });

    group('toJson', () {
      test('contains required fields', () {
        final json = NapaSemantics().toJson();
        expect(json['_name'], 'Semantics');
        expect(json['container'], isFalse);
        expect(json['explicitChildNodes'], isFalse);
        expect(json['excludeSemantics'], isFalse);
        expect(json.containsKey('enabled'), isFalse);
        expect(json.containsKey('label'), isFalse);
        expect(json.containsKey('child'), isFalse);
      });

      test('includes optional fields when set', () {
        final json = NapaSemantics(
          enabled: true,
          checked: false,
          label: 'hello',
          value: 'world',
          hint: 'tap',
          child: createChildWidget(),
        ).toJson();
        expect(json['enabled'], isTrue);
        expect(json['checked'], isFalse);
        expect(json['label'], 'hello');
        expect(json['value'], 'world');
        expect(json['hint'], 'tap');
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaSemantics.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaSemantics.decode({
          '_name': 'Semantics',
          'container': true,
          'explicitChildNodes': true,
          'excludeSemantics': true,
          'enabled': false,
          'label': 'test',
          'hint': 'hint',
        });
        expect(widget!.container, isTrue);
        expect(widget.explicitChildNodes, isTrue);
        expect(widget.excludeSemantics, isTrue);
        expect(widget.enabled, isFalse);
        expect(widget.label, 'test');
        expect(widget.hint, 'hint');
      });

      test('decodes with child', () {
        final widget = NapaSemantics.decode({
          '_name': 'Semantics',
          'container': false,
          'explicitChildNodes': false,
          'excludeSemantics': false,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaSemantics();
        final decoded = NapaSemantics.decode(original.toJson())!;
        expect(decoded.container, isFalse);
        expect(decoded.explicitChildNodes, isFalse);
        expect(decoded.excludeSemantics, isFalse);
        expect(decoded.enabled, isNull);
        expect(decoded.label, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaSemantics(
          container: true,
          explicitChildNodes: true,
          excludeSemantics: true,
          enabled: true,
          label: 'hello',
          value: 'world',
          hint: 'tap',
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaSemantics.decode(original.toJson())!;
        expect(decoded.container, isTrue);
        expect(decoded.enabled, isTrue);
        expect(decoded.label, 'hello');
        expect(decoded.value, 'world');
        expect(decoded.hint, 'tap');
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaSemantics().toWidget();
        expect(widget, isA<Semantics>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Semantics',
        'container': false,
        'explicitChildNodes': false,
        'excludeSemantics': false,
      });
      expect(widget, isA<NapaSemantics>());
    });
  });
}
