import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaBackdropFilter', () {
    test('constructs with required params', () {
      final widget = NapaBackdropFilter(filter: testImageFilter());
      expect(widget.filter, isA<NapaImageFilterBlur>());
      expect(widget.blendMode, BlendMode.srcOver);
      expect(widget.enabled, true);
    });

    test('constructs with all params', () {
      final widget = NapaBackdropFilter(
        filter: testImageFilter(),
        blendMode: BlendMode.dstOver,
        enabled: false,
        child: createChildWidget(),
      );
      expect(widget.blendMode, BlendMode.dstOver);
      expect(widget.enabled, false);
      expect(widget.child, isA<NapaSizedBox>());
    });

    test('widgetName returns BackdropFilter', () {
      expect(NapaBackdropFilter(filter: testImageFilter()).widgetName, 'BackdropFilter');
    });

    test('toString contains filter name', () {
      expect(
        NapaBackdropFilter(filter: testImageFilter()).toString(),
        'BackdropFilter(Blur)',
      );
    });

    group('toJson', () {
      test('returns null due to bug - uses .addAll instead of ..addAll', () {
        final json = NapaBackdropFilter(filter: testImageFilter()).toJson();
        expect(json['_name'], 'BackdropFilter');
        expect(json['blendMode'], 'srcOver');
        expect(json['enabled'], true);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaBackdropFilter.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaBackdropFilter.decode({
          '_name': 'BackdropFilter',
          'filter': testImageFilterJson(),
          'blendMode': 'dstOver',
          'enabled': false,
        });
        expect(widget, isA<NapaBackdropFilter>());
        expect(widget!.blendMode, BlendMode.dstOver);
        expect(widget.enabled, false);
        expect(widget.filter, isA<NapaImageFilterBlur>());
      });

      test('decodes with child', () {
        final widget = NapaBackdropFilter.decode({
          '_name': 'BackdropFilter',
          'filter': testImageFilterJson(),
          'blendMode': 'srcOver',
          'enabled': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns BackdropFilter', () {
        final widget = NapaBackdropFilter(filter: testImageFilter()).toWidget();
        expect(widget, isA<BackdropFilter>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'BackdropFilter',
        'filter': testImageFilterJson(),
        'blendMode': 'srcOver',
        'enabled': true,
      });
      expect(widget, isA<NapaBackdropFilter>());
    });
  });
}
