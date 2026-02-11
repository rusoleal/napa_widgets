import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaFlexible', () {
    test('constructs with defaults', () {
      final widget = NapaFlexible(child: createChildWidget());
      expect(widget.flex, 1);
      expect(widget.fit, FlexFit.loose);
    });

    test('constructs with all params', () {
      final widget = NapaFlexible(
        flex: 3,
        fit: FlexFit.tight,
        child: createChildWidget(),
      );
      expect(widget.flex, 3);
      expect(widget.fit, FlexFit.tight);
    });

    test('widgetName returns Flexible', () {
      expect(NapaFlexible(child: createChildWidget()).widgetName, 'Flexible');
    });

    group('toJson', () {
      test('contains _name, child, flex, fit', () {
        final json = NapaFlexible(child: createChildWidget()).toJson();
        expect(json['_name'], 'Flexible');
        expect(json['flex'], 1);
        expect(json['fit'], 'loose');
        expect(json['child'], isA<Map>());
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaFlexible.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaFlexible.decode({
          '_name': 'Flexible',
          'flex': 2,
          'fit': 'tight',
          'child': createChildJson(),
        });
        expect(widget!.flex, 2);
        expect(widget.fit, FlexFit.tight);
        expect(widget.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaFlexible(
          flex: 3,
          fit: FlexFit.tight,
          child: NapaSizedBox(width: 20),
        );
        final decoded = NapaFlexible.decode(original.toJson())!;
        expect(decoded.flex, 3);
        expect(decoded.fit, FlexFit.tight);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Flexible', () {
        final widget = NapaFlexible(child: createChildWidget()).toWidget();
        expect(widget, isA<Flexible>());
        final f = widget as Flexible;
        expect(f.flex, 1);
        expect(f.fit, FlexFit.loose);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Flexible',
        'flex': 1,
        'fit': 'loose',
        'child': createChildJson(),
      });
      expect(widget, isA<NapaFlexible>());
    });
  });
}
