import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaListener', () {
    test('constructs with defaults', () {
      final widget = NapaListener();
      expect(widget.behavior, HitTestBehavior.deferToChild);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaListener(
        behavior: HitTestBehavior.opaque,
        child: child,
      );
      expect(widget.behavior, HitTestBehavior.opaque);
      expect(widget.child, same(child));
    });

    test('widgetName returns Listener', () {
      expect(NapaListener().widgetName, 'Listener');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaListener().toJson();
        expect(json['_name'], 'Listener');
        expect(json['behavior'], 'deferToChild');
      });

      test('includes child when present', () {
        final json = NapaListener(child: createChildWidget()).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaListener.decode(null), isNull);
      });

      test('decodes behavior', () {
        final widget = NapaListener.decode({
          '_name': 'Listener',
          'behavior': 'opaque',
        });
        expect(widget!.behavior, HitTestBehavior.opaque);
      });

      test('decodes with child', () {
        final widget = NapaListener.decode({
          '_name': 'Listener',
          'behavior': 'deferToChild',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with all properties', () {
        final original = NapaListener(
          behavior: HitTestBehavior.translucent,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaListener.decode(original.toJson())!;
        expect(decoded.behavior, HitTestBehavior.translucent);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns Listener with correct behavior', () {
        final widget = NapaListener(behavior: HitTestBehavior.opaque).toWidget();
        expect(widget, isA<Listener>());
        expect((widget as Listener).behavior, HitTestBehavior.opaque);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Listener',
        'behavior': 'deferToChild',
      });
      expect(widget, isA<NapaListener>());
    });
  });
}
