import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaImageFiltered', () {
    test('constructs with required params', () {
      final widget = NapaImageFiltered(imageFilter: testImageFilter());
      expect(widget.imageFilter, isA<NapaImageFilterBlur>());
      expect(widget.enabled, true);
    });

    test('constructs with all params', () {
      final widget = NapaImageFiltered(
        imageFilter: testImageFilter(),
        enabled: false,
        child: createChildWidget(),
      );
      expect(widget.enabled, false);
      expect(widget.child, isA<NapaSizedBox>());
    });

    test('widgetName returns ImageFiltered', () {
      expect(NapaImageFiltered(imageFilter: testImageFilter()).widgetName, 'ImageFiltered');
    });

    group('toJson', () {
      test('contains all fields', () {
        final json = NapaImageFiltered(imageFilter: testImageFilter()).toJson();
        expect(json['_name'], 'ImageFiltered');
        expect(json['imageFilter'], testImageFilterJson());
        expect(json['enabled'], true);
      });

      test('includes child when present', () {
        final json = NapaImageFiltered(
          imageFilter: testImageFilter(),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaImageFiltered.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaImageFiltered.decode({
          '_name': 'ImageFiltered',
          'imageFilter': testImageFilterJson(),
          'enabled': false,
        });
        expect(widget!.imageFilter, isA<NapaImageFilterBlur>());
        expect(widget.enabled, false);
      });

      test('decodes with child', () {
        final widget = NapaImageFiltered.decode({
          '_name': 'ImageFiltered',
          'imageFilter': testImageFilterJson(),
          'enabled': true,
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips correctly', () {
        final original = NapaImageFiltered(
          imageFilter: testImageFilter(),
          enabled: false,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaImageFiltered.decode(original.toJson())!;
        expect(decoded.imageFilter, isA<NapaImageFilterBlur>());
        expect(decoded.enabled, false);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns ImageFiltered', () {
        final widget = NapaImageFiltered(imageFilter: testImageFilter()).toWidget();
        expect(widget, isA<ImageFiltered>());
      });
    });
  });
}
