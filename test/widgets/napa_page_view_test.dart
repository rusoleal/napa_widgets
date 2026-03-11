import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaPageView', () {
    test('constructs with defaults', () {
      final widget = NapaPageView();
      expect(widget.scrollDirection, Axis.horizontal);
      expect(widget.reverse, isFalse);
      expect(widget.pageSnapping, isTrue);
      expect(widget.allowImplicitScrolling, isFalse);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.padEnds, isTrue);
      expect(widget.dragStartBehavior, DragStartBehavior.start);
      expect(widget.children, isEmpty);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaPageView(
        scrollDirection: Axis.vertical,
        reverse: true,
        pageSnapping: false,
        allowImplicitScrolling: true,
        clipBehavior: Clip.antiAlias,
        padEnds: false,
        dragStartBehavior: DragStartBehavior.down,
        children: [child],
      );
      expect(widget.scrollDirection, Axis.vertical);
      expect(widget.reverse, isTrue);
      expect(widget.pageSnapping, isFalse);
      expect(widget.allowImplicitScrolling, isTrue);
      expect(widget.clipBehavior, Clip.antiAlias);
      expect(widget.padEnds, isFalse);
      expect(widget.dragStartBehavior, DragStartBehavior.down);
      expect(widget.children, hasLength(1));
    });

    test('widgetName returns PageView', () {
      expect(NapaPageView().widgetName, 'PageView');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaPageView().toJson();
        expect(json['_name'], 'PageView');
        expect(json['scrollDirection'], 'horizontal');
        expect(json['reverse'], isFalse);
        expect(json['pageSnapping'], isTrue);
        expect(json['allowImplicitScrolling'], isFalse);
        expect(json['clipBehavior'], 'hardEdge');
        expect(json['padEnds'], isTrue);
        expect(json['dragStartBehavior'], 'start');
        expect(json['children'], isEmpty);
      });

      test('includes children when present', () {
        final json = NapaPageView(children: [createChildWidget()]).toJson();
        expect(json['children'], hasLength(1));
        expect(json['children'][0]['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaPageView.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaPageView.decode({
          '_name': 'PageView',
          'scrollDirection': 'vertical',
          'reverse': true,
          'pageSnapping': false,
          'allowImplicitScrolling': true,
          'clipBehavior': 'antiAlias',
          'padEnds': false,
          'dragStartBehavior': 'down',
          'children': [],
        });
        expect(widget!.scrollDirection, Axis.vertical);
        expect(widget.reverse, isTrue);
        expect(widget.pageSnapping, isFalse);
        expect(widget.allowImplicitScrolling, isTrue);
        expect(widget.clipBehavior, Clip.antiAlias);
        expect(widget.padEnds, isFalse);
        expect(widget.dragStartBehavior, DragStartBehavior.down);
      });

      test('decodes with children', () {
        final widget = NapaPageView.decode({
          '_name': 'PageView',
          'scrollDirection': 'horizontal',
          'reverse': false,
          'pageSnapping': true,
          'allowImplicitScrolling': false,
          'clipBehavior': 'hardEdge',
          'padEnds': true,
          'dragStartBehavior': 'start',
          'children': [createChildJson()],
        });
        expect(widget!.children, hasLength(1));
        expect(widget.children[0], isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaPageView();
        final decoded = NapaPageView.decode(original.toJson())!;
        expect(decoded.scrollDirection, Axis.horizontal);
        expect(decoded.reverse, isFalse);
        expect(decoded.pageSnapping, isTrue);
        expect(decoded.clipBehavior, Clip.hardEdge);
        expect(decoded.padEnds, isTrue);
        expect(decoded.children, isEmpty);
      });

      test('round-trips with all properties', () {
        final original = NapaPageView(
          scrollDirection: Axis.vertical,
          reverse: true,
          pageSnapping: false,
          allowImplicitScrolling: true,
          clipBehavior: Clip.antiAlias,
          padEnds: false,
          dragStartBehavior: DragStartBehavior.down,
          children: [NapaSizedBox(width: 10)],
        );
        final decoded = NapaPageView.decode(original.toJson())!;
        expect(decoded.scrollDirection, Axis.vertical);
        expect(decoded.reverse, isTrue);
        expect(decoded.pageSnapping, isFalse);
        expect(decoded.allowImplicitScrolling, isTrue);
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.padEnds, isFalse);
        expect(decoded.children, hasLength(1));
      });
    });

    group('toWidget', () {
      test('returns correct widget type', () {
        final widget = NapaPageView().toWidget();
        expect(widget, isA<PageView>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'PageView',
        'scrollDirection': 'horizontal',
        'reverse': false,
        'pageSnapping': true,
        'allowImplicitScrolling': false,
        'clipBehavior': 'hardEdge',
        'padEnds': true,
        'dragStartBehavior': 'start',
        'children': [],
      });
      expect(widget, isA<NapaPageView>());
    });
  });
}
