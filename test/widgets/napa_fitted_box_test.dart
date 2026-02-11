import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaFittedBox', () {
    test('constructs with defaults', () {
      final widget = NapaFittedBox();
      expect(widget.alignment, Alignment.center);
      expect(widget.clipBehavior, Clip.none);
      expect(widget.fit, BoxFit.contain);
    });

    test('constructs with all params', () {
      final widget = NapaFittedBox(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.hardEdge,
        fit: BoxFit.cover,
        child: createChildWidget(),
      );
      expect(widget.alignment, Alignment.topLeft);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.fit, BoxFit.cover);
    });

    test('widgetName returns FittedBox', () {
      expect(NapaFittedBox().widgetName, 'FittedBox');
    });

    group('toJson', () {
      test('contains all fields', () {
        final json = NapaFittedBox().toJson();
        expect(json['_name'], 'FittedBox');
        expect(json['alignment'], testAlignmentCenterJson());
        expect(json['clipBehavior'], 'none');
        expect(json['fit'], 'contain');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaFittedBox.decode(null), isNull);
      });

      test('returns null for non-Map input', () {
        expect(NapaFittedBox.decode('string'), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaFittedBox.decode({
          '_name': 'FittedBox',
          'alignment': testAlignmentTopLeftJson(),
          'clipBehavior': 'hardEdge',
          'fit': 'cover',
        });
        expect(widget!.clipBehavior, Clip.hardEdge);
        expect(widget.fit, BoxFit.cover);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaFittedBox();
        final decoded = NapaFittedBox.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.none);
        expect(decoded.fit, BoxFit.contain);
      });

      test('round-trips with all properties', () {
        final original = NapaFittedBox(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.antiAlias,
          fit: BoxFit.fill,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaFittedBox.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.fit, BoxFit.fill);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns FittedBox', () {
        final widget = NapaFittedBox(fit: BoxFit.cover).toWidget();
        expect(widget, isA<FittedBox>());
        expect((widget as FittedBox).fit, BoxFit.cover);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'FittedBox',
        'alignment': testAlignmentCenterJson(),
        'clipBehavior': 'none',
        'fit': 'contain',
      });
      expect(widget, isA<NapaFittedBox>());
    });
  });
}
