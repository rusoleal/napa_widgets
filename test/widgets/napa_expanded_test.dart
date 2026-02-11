import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaExpanded', () {
    test('constructs with required child', () {
      final widget = NapaExpanded(child: createChildWidget());
      expect(widget.flex, 1);
      expect(widget.child, isA<NapaSizedBox>());
    });

    test('constructs with custom flex', () {
      final widget = NapaExpanded(flex: 3, child: createChildWidget());
      expect(widget.flex, 3);
    });

    test('widgetName returns Expanded', () {
      expect(NapaExpanded(child: createChildWidget()).widgetName, 'Expanded');
    });

    group('toJson', () {
      test('contains _name and flex', () {
        final json = NapaExpanded(child: createChildWidget()).toJson();
        expect(json['_name'], 'Expanded');
        expect(json['flex'], 1);
        expect(json['child'], isA<Map>());
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaExpanded.decode(null), isNull);
      });

      test('decodes with flex and child', () {
        final widget = NapaExpanded.decode({
          '_name': 'Expanded',
          'flex': 2,
          'child': createChildJson(),
        });
        expect(widget, isA<NapaExpanded>());
        expect((widget as NapaExpanded).flex, 2);
        expect(widget.child, isA<NapaSizedBox>());
      });

      test('falls back to NapaContainer when child is null', () {
        final widget = NapaExpanded.decode({
          '_name': 'Expanded',
          'flex': 1,
        });
        expect(widget, isA<NapaExpanded>());
        expect((widget as NapaExpanded).child, isA<NapaContainer>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaExpanded(
          flex: 2,
          child: NapaSizedBox(width: 10),
        );
        final json = original.toJson();
        final decoded = NapaExpanded.decode(json)!;
        expect((decoded as NapaExpanded).flex, 2);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Expanded', () {
        final widget = NapaExpanded(child: createChildWidget()).toWidget();
        expect(widget, isA<Expanded>());
        expect((widget as Expanded).flex, 1);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Expanded',
        'flex': 1,
        'child': createChildJson(),
      });
      expect(widget, isA<NapaExpanded>());
    });
  });
}
