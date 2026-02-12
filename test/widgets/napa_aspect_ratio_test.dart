import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

void main() {
  group('NapaAspectRatio', () {
    test('constructs with default aspectRatio', () {
      final widget = NapaAspectRatio();
      expect(widget.aspectRatio, 1.0);
    });

    test('constructs with custom aspectRatio', () {
      final widget = NapaAspectRatio(aspectRatio: 16 / 9);
      expect(widget.aspectRatio, closeTo(1.778, 0.001));
    });

    test('widgetName returns AspectRatio', () {
      expect(NapaAspectRatio().widgetName, 'AspectRatio');
    });

    group('toJson', () {
      test('contains _name and aspectRatio', () {
        final json = NapaAspectRatio(aspectRatio: 2.0).toJson();
        expect(json['_name'], 'AspectRatio');
        expect(json['aspectRatio'], 2.0);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaAspectRatio.decode(null), isNull);
      });

      test('decodes aspectRatio', () {
        final widget = NapaAspectRatio.decode({
          '_name': 'AspectRatio',
          'aspectRatio': 0.5,
        });
        expect(widget!.aspectRatio, 0.5);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaAspectRatio(
          aspectRatio: 4 / 3,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaAspectRatio.decode(original.toJson())!;
        expect(decoded.aspectRatio, closeTo(4 / 3, 0.001));
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns AspectRatio', () {
        final widget = NapaAspectRatio(aspectRatio: 2.0).toWidget();
        expect(widget, isA<AspectRatio>());
        expect((widget as AspectRatio).aspectRatio, 2.0);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'AspectRatio',
        'aspectRatio': 1.5,
      });
      expect(widget, isA<NapaAspectRatio>());
    });
  });
}
