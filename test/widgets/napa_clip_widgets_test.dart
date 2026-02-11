import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaClipOval', () {
    test('constructs with defaults', () {
      final widget = NapaClipOval();
      expect(widget.clipBehavior, Clip.antiAlias);
      expect(widget.clipper, isNull);
      expect(widget.child, isNull);
    });

    test('widgetName returns ClipOval', () {
      expect(NapaClipOval().widgetName, 'ClipOval');
    });

    group('toJson', () {
      test('contains _name and clipBehavior', () {
        final json = NapaClipOval().toJson();
        expect(json['_name'], 'ClipOval');
        expect(json['clipBehavior'], 'antiAlias');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaClipOval.decode(null), isNull);
      });

      test('decodes clipBehavior', () {
        final widget = NapaClipOval.decode({
          '_name': 'ClipOval',
          'clipBehavior': 'hardEdge',
        });
        expect(widget!.clipBehavior, Clip.hardEdge);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaClipOval(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaClipOval.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.antiAliasWithSaveLayer);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ClipOval', () {
        final widget = NapaClipOval().toWidget();
        expect(widget, isA<ClipOval>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ClipOval',
        'clipBehavior': 'antiAlias',
      });
      expect(widget, isA<NapaClipOval>());
    });
  });

  group('NapaClipPath', () {
    test('constructs with defaults', () {
      final widget = NapaClipPath();
      expect(widget.clipBehavior, Clip.antiAlias);
    });

    test('widgetName returns ClipPath', () {
      expect(NapaClipPath().widgetName, 'ClipPath');
    });

    group('toJson', () {
      test('contains _name and clipBehavior', () {
        final json = NapaClipPath().toJson();
        expect(json['_name'], 'ClipPath');
        expect(json['clipBehavior'], 'antiAlias');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaClipPath.decode(null), isNull);
      });

      test('decodes clipBehavior', () {
        final widget = NapaClipPath.decode({
          '_name': 'ClipPath',
          'clipBehavior': 'hardEdge',
        });
        expect(widget!.clipBehavior, Clip.hardEdge);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaClipPath(
          clipBehavior: Clip.antiAlias,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaClipPath.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ClipPath', () {
        final widget = NapaClipPath().toWidget();
        expect(widget, isA<ClipPath>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ClipPath',
        'clipBehavior': 'antiAlias',
      });
      expect(widget, isA<NapaClipPath>());
    });
  });

  group('NapaClipRect', () {
    test('constructs with defaults', () {
      final widget = NapaClipRect();
      expect(widget.clipBehavior, Clip.hardEdge);
    });

    test('widgetName returns ClipRect', () {
      expect(NapaClipRect().widgetName, 'ClipRect');
    });

    group('toJson', () {
      test('default clipBehavior is hardEdge', () {
        final json = NapaClipRect().toJson();
        expect(json['clipBehavior'], 'hardEdge');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaClipRect.decode(null), isNull);
      });

      test('decodes clipBehavior', () {
        final widget = NapaClipRect.decode({
          '_name': 'ClipRect',
          'clipBehavior': 'antiAlias',
        });
        expect(widget!.clipBehavior, Clip.antiAlias);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaClipRect(
          clipBehavior: Clip.hardEdge,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaClipRect.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.hardEdge);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ClipRect', () {
        final widget = NapaClipRect().toWidget();
        expect(widget, isA<ClipRect>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ClipRect',
        'clipBehavior': 'hardEdge',
      });
      expect(widget, isA<NapaClipRect>());
    });
  });

  group('NapaClipRRect', () {
    test('constructs with defaults', () {
      final widget = NapaClipRRect();
      expect(widget.borderRadius, BorderRadius.zero);
      expect(widget.clipBehavior, Clip.antiAlias);
    });

    test('widgetName returns ClipRRect', () {
      expect(NapaClipRRect().widgetName, 'ClipRRect');
    });

    group('toJson', () {
      test('contains borderRadius and clipBehavior', () {
        final json = NapaClipRRect().toJson();
        expect(json['_name'], 'ClipRRect');
        expect(json['clipBehavior'], 'antiAlias');
        expect(json['borderRadius'], testBorderRadiusZeroJson());
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaClipRRect.decode(null), isNull);
      });

      test('decodes borderRadius and clipBehavior', () {
        final widget = NapaClipRRect.decode({
          '_name': 'ClipRRect',
          'borderRadius': testBorderRadiusJson(),
          'clipBehavior': 'hardEdge',
        });
        expect(widget!.clipBehavior, Clip.hardEdge);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaClipRRect(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaClipRRect.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.antiAliasWithSaveLayer);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ClipRRect', () {
        final widget = NapaClipRRect().toWidget();
        expect(widget, isA<ClipRRect>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ClipRRect',
        'borderRadius': testBorderRadiusZeroJson(),
        'clipBehavior': 'antiAlias',
      });
      expect(widget, isA<NapaClipRRect>());
    });
  });

  group('NapaClipRSuperellipse', () {
    test('constructs with defaults', () {
      final widget = NapaClipRSuperellipse();
      expect(widget.borderRadius, BorderRadius.zero);
      expect(widget.clipBehavior, Clip.antiAlias);
    });

    test('widgetName returns ClipRSuperellipse', () {
      expect(NapaClipRSuperellipse().widgetName, 'ClipRSuperellipse');
    });

    group('toJson', () {
      test('contains borderRadius and clipBehavior', () {
        final json = NapaClipRSuperellipse().toJson();
        expect(json['_name'], 'ClipRSuperellipse');
        expect(json['clipBehavior'], 'antiAlias');
        expect(json['borderRadius'], testBorderRadiusZeroJson());
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaClipRSuperellipse.decode(null), isNull);
      });

      test('decodes borderRadius and clipBehavior', () {
        final widget = NapaClipRSuperellipse.decode({
          '_name': 'ClipRSuperellipse',
          'borderRadius': testBorderRadiusJson(),
          'clipBehavior': 'hardEdge',
        });
        expect(widget!.clipBehavior, Clip.hardEdge);
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaClipRSuperellipse(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaClipRSuperellipse.decode(original.toJson())!;
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ClipRSuperellipse', () {
        final widget = NapaClipRSuperellipse().toWidget();
        expect(widget, isA<ClipRSuperellipse>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'ClipRSuperellipse',
        'borderRadius': testBorderRadiusZeroJson(),
        'clipBehavior': 'antiAlias',
      });
      expect(widget, isA<NapaClipRSuperellipse>());
    });
  });
}
