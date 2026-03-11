import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

NapaTextStyle _testStyle() => NapaTextStyle(fontSize: 16.0);

Map<String, dynamic> _testStyleJson() => {
  'inherit': true,
  'fontSize': 16.0,
};

void main() {
  group('NapaDefaultTextStyle', () {
    test('constructs with required params', () {
      final widget = NapaDefaultTextStyle(style: _testStyle());
      expect(widget.softWrap, true);
      expect(widget.overflow, TextOverflow.clip);
      expect(widget.textWidthBasis, TextWidthBasis.parent);
      expect(widget.textAlign, isNull);
      expect(widget.maxLines, isNull);
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaDefaultTextStyle(
        style: _testStyle(),
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        textWidthBasis: TextWidthBasis.longestLine,
        child: child,
      );
      expect(widget.textAlign, TextAlign.center);
      expect(widget.softWrap, false);
      expect(widget.overflow, TextOverflow.ellipsis);
      expect(widget.maxLines, 3);
      expect(widget.child, same(child));
    });

    test('widgetName returns DefaultTextStyle', () {
      expect(
        NapaDefaultTextStyle(style: _testStyle()).widgetName,
        'DefaultTextStyle',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaDefaultTextStyle(style: _testStyle()).toJson();
        expect(json['_name'], 'DefaultTextStyle');
        expect(json['style'], isA<Map>());
        expect(json['softWrap'], true);
        expect(json['overflow'], 'clip');
        expect(json['textWidthBasis'], 'parent');
        expect(json.containsKey('textAlign'), false);
        expect(json.containsKey('maxLines'), false);
      });

      test('includes optional fields when set', () {
        final json = NapaDefaultTextStyle(
          style: _testStyle(),
          textAlign: TextAlign.center,
          maxLines: 2,
        ).toJson();
        expect(json['textAlign'], 'center');
        expect(json['maxLines'], 2);
      });

      test('includes child when present', () {
        final json = NapaDefaultTextStyle(
          style: _testStyle(),
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaDefaultTextStyle.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaDefaultTextStyle.decode({
          '_name': 'DefaultTextStyle',
          'style': _testStyleJson(),
          'softWrap': false,
          'overflow': 'ellipsis',
          'textWidthBasis': 'longestLine',
          'textAlign': 'center',
          'maxLines': 3,
        });
        expect(widget!.softWrap, false);
        expect(widget.overflow, TextOverflow.ellipsis);
        expect(widget.textAlign, TextAlign.center);
        expect(widget.maxLines, 3);
      });

      test('decodes with child', () {
        final widget = NapaDefaultTextStyle.decode({
          '_name': 'DefaultTextStyle',
          'style': _testStyleJson(),
          'softWrap': true,
          'overflow': 'clip',
          'textWidthBasis': 'parent',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with all properties', () {
        final original = NapaDefaultTextStyle(
          style: _testStyle(),
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaDefaultTextStyle.decode(original.toJson())!;
        expect(decoded.softWrap, false);
        expect(decoded.overflow, TextOverflow.ellipsis);
        expect(decoded.maxLines, 2);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns DefaultTextStyle', () {
        final widget = NapaDefaultTextStyle(style: _testStyle()).toWidget();
        expect(widget, isA<DefaultTextStyle>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'DefaultTextStyle',
        'style': _testStyleJson(),
        'softWrap': true,
        'overflow': 'clip',
        'textWidthBasis': 'parent',
      });
      expect(widget, isA<NapaDefaultTextStyle>());
    });
  });
}
