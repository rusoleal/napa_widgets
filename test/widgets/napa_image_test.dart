import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NapaImage', () {
    test('constructs with defaults', () {
      final widget = NapaImage();
      expect(widget.alignment, Alignment.center);
      expect(widget.centerSlice, isNull);
      expect(widget.color, isNull);
      expect(widget.colorBlendMode, isNull);
      expect(widget.excludeFromSemantics, false);
      expect(widget.filterQuality, FilterQuality.medium);
      expect(widget.fit, isNull);
      expect(widget.gaplessPlayback, false);
      expect(widget.height, isNull);
      expect(widget.isAntiAlias, false);
      expect(widget.matchTextDirection, false);
      expect(widget.opacity, isNull);
      expect(widget.repeat, ImageRepeat.noRepeat);
      expect(widget.width, isNull);
      expect(widget.data, isNull);
    });

    test('constructs with custom params', () {
      final imageData = ImageWrapper('test.png', testImageData());
      final widget = NapaImage(
        alignment: Alignment.topLeft,
        excludeFromSemantics: true,
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        height: 200,
        isAntiAlias: true,
        matchTextDirection: true,
        opacity: 0.8,
        repeat: ImageRepeat.repeat,
        width: 100,
        data: imageData,
      );
      expect(widget.excludeFromSemantics, true);
      expect(widget.filterQuality, FilterQuality.high);
      expect(widget.fit, BoxFit.cover);
      expect(widget.height, 200);
      expect(widget.width, 100);
      expect(widget.opacity, 0.8);
      expect(widget.data, isNotNull);
    });

    test('widgetName returns Image', () {
      expect(NapaImage().widgetName, 'Image');
    });

    group('toJson', () {
      test('contains _name and required fields', () {
        final json = NapaImage().toJson();
        expect(json['_name'], 'Image');
        expect(json['alignment'], isA<Map>());
        expect(json['excludeFromSemantics'], false);
        expect(json['filterQuality'], 'medium');
        expect(json['gaplessPlayback'], false);
        expect(json['isAntiAlias'], false);
        expect(json['matchTextDirection'], false);
        expect(json['repeat'], 'noRepeat');
      });

      test('excludes null optional fields', () {
        final json = NapaImage().toJson();
        expect(json.containsKey('centerSlice'), isFalse);
        expect(json.containsKey('color'), isFalse);
        expect(json.containsKey('fit'), isFalse);
        expect(json.containsKey('height'), isFalse);
        expect(json.containsKey('width'), isFalse);
        expect(json.containsKey('opacity'), isFalse);
        expect(json.containsKey('data'), isFalse);
      });

      test('includes optional fields when set', () {
        final json = NapaImage(
          fit: BoxFit.cover,
          width: 100,
          height: 200,
          opacity: 0.5,
        ).toJson();
        expect(json['fit'], 'cover');
        expect(json['width'], 100.0);
        expect(json['height'], 200.0);
        expect(json['opacity'], 0.5);
      });

      test('serializes image data', () {
        final imageData = ImageWrapper('test.png', testImageData());
        final json = NapaImage(data: imageData).toJson();
        expect(json['data'], isA<Map>());
        expect(json['data']['name'], 'test.png');
        expect(json['data']['data'], base64Encode(testImageData()));
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaImage.decode(null), isNull);
      });

      test('decodes with defaults', () {
        final widget = NapaImage.decode({
          '_name': 'Image',
          'alignment': testAlignmentCenterJson(),
          'excludeFromSemantics': false,
          'filterQuality': 'medium',
          'gaplessPlayback': false,
          'isAntiAlias': false,
          'matchTextDirection': false,
          'repeat': 'noRepeat',
        });
        expect(widget, isA<NapaImage>());
        expect(widget!.excludeFromSemantics, false);
        expect(widget.filterQuality, FilterQuality.medium);
      });

      test('decodes with optional fields', () {
        final widget = NapaImage.decode({
          '_name': 'Image',
          'alignment': testAlignmentCenterJson(),
          'excludeFromSemantics': false,
          'filterQuality': 'high',
          'fit': 'cover',
          'gaplessPlayback': true,
          'height': 200.0,
          'isAntiAlias': true,
          'matchTextDirection': false,
          'opacity': 0.8,
          'repeat': 'repeat',
          'width': 100.0,
        });
        expect(widget!.filterQuality, FilterQuality.high);
        expect(widget.fit, BoxFit.cover);
        expect(widget.height, 200.0);
        expect(widget.width, 100.0);
        expect(widget.opacity, 0.8);
      });

      test('decodes with image data', () {
        final encoded = base64Encode(testImageData());
        final widget = NapaImage.decode({
          '_name': 'Image',
          'alignment': testAlignmentCenterJson(),
          'excludeFromSemantics': false,
          'filterQuality': 'medium',
          'gaplessPlayback': false,
          'isAntiAlias': false,
          'matchTextDirection': false,
          'repeat': 'noRepeat',
          'data': {'name': 'test.png', 'data': encoded},
        });
        expect(widget!.data, isNotNull);
        expect(widget.data!.name, 'test.png');
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaImage();
        final decoded = NapaImage.decode(original.toJson())!;
        expect(decoded.excludeFromSemantics, false);
        expect(decoded.filterQuality, FilterQuality.medium);
        expect(decoded.repeat, ImageRepeat.noRepeat);
      });

      test('round-trips with optional fields', () {
        final original = NapaImage(
          fit: BoxFit.cover,
          width: 100,
          height: 200,
          opacity: 0.7,
        );
        final decoded = NapaImage.decode(original.toJson())!;
        expect(decoded.fit, BoxFit.cover);
        expect(decoded.width, 100.0);
        expect(decoded.height, 200.0);
        expect(decoded.opacity, 0.7);
      });
    });

    group('toWidget', () {
      test('returns Container when data is null', () {
        final widget = NapaImage().toWidget();
        expect(widget, isA<Container>());
      });

      // Note: Image.memory with invalid data would throw in a real test
      // so we only test the null-data fallback path.
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Image',
        'alignment': testAlignmentCenterJson(),
        'excludeFromSemantics': false,
        'filterQuality': 'medium',
        'gaplessPlayback': false,
        'isAntiAlias': false,
        'matchTextDirection': false,
        'repeat': 'noRepeat',
      });
      expect(widget, isA<NapaImage>());
    });
  });
}
