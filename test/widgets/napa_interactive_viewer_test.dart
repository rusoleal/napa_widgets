import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaInteractiveViewer', () {
    test('constructs with defaults', () {
      final widget = NapaInteractiveViewer();
      expect(widget.boundaryMargin, EdgeInsets.zero);
      expect(widget.constrained, true);
      expect(widget.maxScale, 2.5);
      expect(widget.minScale, 0.8);
      expect(widget.panEnabled, true);
      expect(widget.scaleEnabled, true);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaInteractiveViewer(
        boundaryMargin: const EdgeInsets.all(16.0),
        constrained: false,
        maxScale: 5.0,
        minScale: 0.5,
        panEnabled: false,
        scaleEnabled: false,
        child: child,
      );
      expect(widget.boundaryMargin, const EdgeInsets.all(16.0));
      expect(widget.constrained, false);
      expect(widget.maxScale, 5.0);
      expect(widget.minScale, 0.5);
      expect(widget.panEnabled, false);
      expect(widget.scaleEnabled, false);
      expect(widget.child, same(child));
    });

    test('widgetName returns InteractiveViewer', () {
      expect(NapaInteractiveViewer().widgetName, 'InteractiveViewer');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaInteractiveViewer().toJson();
        expect(json['_name'], 'InteractiveViewer');
        expect(json['boundaryMargin'], {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0});
        expect(json['constrained'], true);
        expect(json['maxScale'], 2.5);
        expect(json['minScale'], 0.8);
        expect(json['panEnabled'], true);
        expect(json['scaleEnabled'], true);
      });

      test('includes child when present', () {
        final json = NapaInteractiveViewer(
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaInteractiveViewer.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaInteractiveViewer.decode({
          '_name': 'InteractiveViewer',
          'boundaryMargin': {'left': 16.0, 'top': 16.0, 'right': 16.0, 'bottom': 16.0},
          'constrained': false,
          'maxScale': 5.0,
          'minScale': 0.5,
          'panEnabled': false,
          'scaleEnabled': false,
        });
        expect(widget!.boundaryMargin, const EdgeInsets.all(16.0));
        expect(widget.constrained, false);
        expect(widget.maxScale, 5.0);
        expect(widget.minScale, 0.5);
        expect(widget.panEnabled, false);
        expect(widget.scaleEnabled, false);
      });

      test('decodes with child', () {
        final widget = NapaInteractiveViewer.decode({
          '_name': 'InteractiveViewer',
          'boundaryMargin': {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0},
          'constrained': true,
          'maxScale': 2.5,
          'minScale': 0.8,
          'panEnabled': true,
          'scaleEnabled': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaInteractiveViewer();
        final decoded = NapaInteractiveViewer.decode(original.toJson())!;
        expect(decoded.boundaryMargin, EdgeInsets.zero);
        expect(decoded.constrained, true);
        expect(decoded.maxScale, 2.5);
        expect(decoded.minScale, 0.8);
        expect(decoded.panEnabled, true);
        expect(decoded.scaleEnabled, true);
      });

      test('round-trips with all properties', () {
        final original = NapaInteractiveViewer(
          boundaryMargin: const EdgeInsets.all(16.0),
          constrained: false,
          maxScale: 5.0,
          minScale: 0.5,
          panEnabled: false,
          scaleEnabled: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaInteractiveViewer.decode(original.toJson())!;
        expect(decoded.boundaryMargin, const EdgeInsets.all(16.0));
        expect(decoded.constrained, false);
        expect(decoded.maxScale, 5.0);
        expect(decoded.minScale, 0.5);
        expect(decoded.panEnabled, false);
        expect(decoded.scaleEnabled, false);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaInteractiveViewer().toWidget();
        expect(widget, isA<InteractiveViewer>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'InteractiveViewer',
        'boundaryMargin': {'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0},
        'constrained': true,
        'maxScale': 2.5,
        'minScale': 0.8,
        'panEnabled': true,
        'scaleEnabled': true,
      });
      expect(widget, isA<NapaInteractiveViewer>());
    });
  });
}
