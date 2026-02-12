import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

void main() {
  group('NapaText', () {
    test('constructs with required text', () {
      final widget = NapaText('hello');
      expect(widget.text, 'hello');
      expect(widget.style, isNull);
      expect(widget.textAlign, isNull);
      expect(widget.maxLines, isNull);
    });

    test('constructs with optional params', () {
      final widget = NapaText(
        'hello',
        textAlign: TextAlign.center,
        maxLines: 2,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      );
      expect(widget.textAlign, TextAlign.center);
      expect(widget.maxLines, 2);
      expect(widget.softWrap, false);
      expect(widget.overflow, TextOverflow.ellipsis);
    });

    test('widgetName returns Text', () {
      expect(NapaText('hi').widgetName, 'Text');
    });

    test('toString contains text', () {
      expect(NapaText('hello').toString(), 'Text("hello")');
    });

    group('toJson', () {
      test('contains _name and text', () {
        final json = NapaText('hello').toJson();
        expect(json['_name'], 'Text');
        expect(json['text'], 'hello');
      });

      test('excludes null optional fields', () {
        final json = NapaText('hi').toJson();
        expect(json.containsKey('style'), isFalse);
        expect(json.containsKey('textAlign'), isFalse);
        expect(json.containsKey('maxLines'), isFalse);
        expect(json.containsKey('overflow'), isFalse);
      });

      test('includes optional fields when set', () {
        final json = NapaText(
          'hi',
          textAlign: TextAlign.center,
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          semanticsLabel: 'label',
        ).toJson();
        expect(json['textAlign'], 'center');
        expect(json['maxLines'], 3);
        expect(json['softWrap'], true);
        expect(json['overflow'], 'ellipsis');
        expect(json['semanticsLabel'], 'label');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaText.decode(null), isNull);
      });

      test('decodes text', () {
        final widget = NapaText.decode({
          '_name': 'Text',
          'text': 'world',
        });
        expect(widget!.text, 'world');
      });

      test('decodes with optional fields', () {
        final widget = NapaText.decode({
          '_name': 'Text',
          'text': 'hello',
          'textAlign': 'right',
          'maxLines': 5,
          'softWrap': false,
          'overflow': 'fade',
        });
        expect(widget!.textAlign, TextAlign.right);
        expect(widget.maxLines, 5);
        expect(widget.softWrap, false);
        expect(widget.overflow, TextOverflow.fade);
      });

      test('decodes with style', () {
        final widget = NapaText.decode({
          '_name': 'Text',
          'text': 'styled',
          'style': {
            'inherit': true,
            'fontSize': 16.0,
          },
        });
        expect(widget!.style, isA<NapaTextStyle>());
        expect(widget.style!.fontSize, 16.0);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with text only', () {
        final original = NapaText('hello');
        final decoded = NapaText.decode(original.toJson())!;
        expect(decoded.text, 'hello');
      });

      test('round-trips with optional properties', () {
        final original = NapaText(
          'hello',
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: false,
        );
        final decoded = NapaText.decode(original.toJson())!;
        expect(decoded.text, 'hello');
        expect(decoded.textAlign, TextAlign.center);
        expect(decoded.maxLines, 2);
        expect(decoded.softWrap, false);
      });
    });

    group('toWidget', () {
      test('returns Text with correct text', () {
        final widget = NapaText('hello').toWidget();
        expect(widget, isA<Text>());
        expect((widget as Text).data, 'hello');
      });

      test('passes optional properties', () {
        final widget = NapaText(
          'hello',
          textAlign: TextAlign.center,
          maxLines: 2,
        ).toWidget();
        final t = widget as Text;
        expect(t.textAlign, TextAlign.center);
        expect(t.maxLines, 2);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'Text',
        'text': 'dispatch test',
      });
      expect(widget, isA<NapaText>());
      expect((widget as NapaText).text, 'dispatch test');
    });
  });
}
