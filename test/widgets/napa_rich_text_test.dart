import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

void main() {
  group('NapaTextSpan', () {
    test('constructs with defaults', () {
      final span = NapaTextSpan();
      expect(span.text, isNull);
      expect(span.style, isNull);
      expect(span.semanticsLabel, isNull);
      expect(span.children, isNull);
    });

    test('constructs with all params', () {
      final child = NapaTextSpan(text: 'child');
      final span = NapaTextSpan(
        text: 'hello',
        semanticsLabel: 'label',
        children: [child],
      );
      expect(span.text, 'hello');
      expect(span.semanticsLabel, 'label');
      expect(span.children, hasLength(1));
    });

    test('textSpan getter returns TextSpan', () {
      final span = NapaTextSpan(text: 'hello');
      expect(span.textSpan, isA<TextSpan>());
      expect(span.textSpan.text, 'hello');
    });

    group('toJson', () {
      test('empty span produces empty map', () {
        final json = NapaTextSpan().toJson();
        expect(json, isEmpty);
      });

      test('includes text when set', () {
        final json = NapaTextSpan(text: 'hello').toJson();
        expect(json['text'], 'hello');
      });

      test('includes semanticsLabel when set', () {
        final json = NapaTextSpan(semanticsLabel: 'label').toJson();
        expect(json['semanticsLabel'], 'label');
      });

      test('includes children when set', () {
        final json = NapaTextSpan(
          children: [NapaTextSpan(text: 'child')],
        ).toJson();
        expect(json['children'], hasLength(1));
        expect(json['children'][0]['text'], 'child');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaTextSpan.decode(null), isNull);
      });

      test('decodes text', () {
        final span = NapaTextSpan.decode({'text': 'hello'});
        expect(span!.text, 'hello');
      });

      test('decodes children', () {
        final span = NapaTextSpan.decode({
          'text': 'parent',
          'children': [
            {'text': 'child1'},
            {'text': 'child2'},
          ],
        });
        expect(span!.children, hasLength(2));
        expect(span.children![0].text, 'child1');
      });
    });

    group('JSON round-trip', () {
      test('round-trips with text', () {
        final original = NapaTextSpan(text: 'hello', semanticsLabel: 'label');
        final decoded = NapaTextSpan.decode(original.toJson())!;
        expect(decoded.text, 'hello');
        expect(decoded.semanticsLabel, 'label');
      });
    });
  });

  group('NapaRichText', () {
    test('constructs with defaults', () {
      final widget = NapaRichText(text: NapaTextSpan(text: 'hello'));
      expect(widget.textAlign, TextAlign.start);
      expect(widget.textDirection, isNull);
      expect(widget.softWrap, isTrue);
      expect(widget.overflow, TextOverflow.clip);
      expect(widget.maxLines, isNull);
      expect(widget.textWidthBasis, TextWidthBasis.parent);
    });

    test('constructs with all params', () {
      final widget = NapaRichText(
        text: NapaTextSpan(text: 'hello'),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        textWidthBasis: TextWidthBasis.longestLine,
      );
      expect(widget.textAlign, TextAlign.center);
      expect(widget.textDirection, TextDirection.rtl);
      expect(widget.softWrap, isFalse);
      expect(widget.overflow, TextOverflow.ellipsis);
      expect(widget.maxLines, 3);
      expect(widget.textWidthBasis, TextWidthBasis.longestLine);
    });

    test('widgetName returns RichText', () {
      expect(NapaRichText(text: NapaTextSpan()).widgetName, 'RichText');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaRichText(text: NapaTextSpan(text: 'hi')).toJson();
        expect(json['_name'], 'RichText');
        expect(json['text']['text'], 'hi');
        expect(json['textAlign'], 'start');
        expect(json['softWrap'], isTrue);
        expect(json['overflow'], 'clip');
        expect(json['textWidthBasis'], 'parent');
        expect(json.containsKey('maxLines'), isFalse);
        expect(json.containsKey('textDirection'), isFalse);
      });

      test('includes optional fields when set', () {
        final json = NapaRichText(
          text: NapaTextSpan(text: 'hi'),
          textDirection: TextDirection.ltr,
          maxLines: 2,
        ).toJson();
        expect(json['textDirection'], 'ltr');
        expect(json['maxLines'], 2);
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaRichText.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaRichText.decode({
          '_name': 'RichText',
          'text': {'text': 'hello'},
          'textAlign': 'center',
          'textDirection': 'rtl',
          'softWrap': false,
          'overflow': 'ellipsis',
          'maxLines': 3,
          'textWidthBasis': 'longestLine',
        });
        expect(widget!.text.text, 'hello');
        expect(widget.textAlign, TextAlign.center);
        expect(widget.textDirection, TextDirection.rtl);
        expect(widget.softWrap, isFalse);
        expect(widget.overflow, TextOverflow.ellipsis);
        expect(widget.maxLines, 3);
        expect(widget.textWidthBasis, TextWidthBasis.longestLine);
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaRichText(text: NapaTextSpan(text: 'hello'));
        final decoded = NapaRichText.decode(original.toJson())!;
        expect(decoded.text.text, 'hello');
        expect(decoded.textAlign, TextAlign.start);
        expect(decoded.softWrap, isTrue);
        expect(decoded.overflow, TextOverflow.clip);
        expect(decoded.textWidthBasis, TextWidthBasis.parent);
      });

      test('round-trips with all properties', () {
        final original = NapaRichText(
          text: NapaTextSpan(text: 'hello'),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textWidthBasis: TextWidthBasis.longestLine,
        );
        final decoded = NapaRichText.decode(original.toJson())!;
        expect(decoded.textAlign, TextAlign.center);
        expect(decoded.textDirection, TextDirection.rtl);
        expect(decoded.softWrap, isFalse);
        expect(decoded.overflow, TextOverflow.ellipsis);
        expect(decoded.maxLines, 3);
        expect(decoded.textWidthBasis, TextWidthBasis.longestLine);
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaRichText(text: NapaTextSpan(text: 'hello')).toWidget();
        expect(widget, isA<RichText>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'RichText',
        'text': {'text': 'hello'},
        'textAlign': 'start',
        'softWrap': true,
        'overflow': 'clip',
        'textWidthBasis': 'parent',
      });
      expect(widget, isA<NapaRichText>());
    });
  });
}
