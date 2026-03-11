import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaSingleChildScrollView', () {
    test('constructs with defaults', () {
      final widget = NapaSingleChildScrollView();
      expect(widget.scrollDirection, Axis.vertical);
      expect(widget.reverse, false);
      expect(widget.padding, isNull);
      expect(widget.clipBehavior, Clip.hardEdge);
      expect(widget.dragStartBehavior, DragStartBehavior.start);
      expect(
        widget.keyboardDismissBehavior,
        ScrollViewKeyboardDismissBehavior.manual,
      );
      expect(widget.child, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final widget = NapaSingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        padding: testEdgeInsets(),
        clipBehavior: Clip.antiAlias,
        dragStartBehavior: DragStartBehavior.down,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: child,
      );
      expect(widget.scrollDirection, Axis.horizontal);
      expect(widget.reverse, true);
      expect(widget.padding, testEdgeInsets());
      expect(widget.clipBehavior, Clip.antiAlias);
      expect(widget.dragStartBehavior, DragStartBehavior.down);
      expect(
        widget.keyboardDismissBehavior,
        ScrollViewKeyboardDismissBehavior.onDrag,
      );
      expect(widget.child, same(child));
    });

    test('widgetName returns SingleChildScrollView', () {
      expect(
        NapaSingleChildScrollView().widgetName,
        'SingleChildScrollView',
      );
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaSingleChildScrollView().toJson();
        expect(json['_name'], 'SingleChildScrollView');
        expect(json['scrollDirection'], 'vertical');
        expect(json['reverse'], false);
        expect(json['clipBehavior'], 'hardEdge');
        expect(json['dragStartBehavior'], 'start');
        expect(json['keyboardDismissBehavior'], 'manual');
        expect(json.containsKey('padding'), false);
      });

      test('includes padding when set', () {
        final json = NapaSingleChildScrollView(
          padding: testEdgeInsets(),
        ).toJson();
        expect(json['padding'], testEdgeInsetsJson());
      });

      test('includes child when present', () {
        final json = NapaSingleChildScrollView(
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaSingleChildScrollView.decode(null), isNull);
      });

      test('decodes all properties', () {
        final widget = NapaSingleChildScrollView.decode({
          '_name': 'SingleChildScrollView',
          'scrollDirection': 'horizontal',
          'reverse': true,
          'clipBehavior': 'antiAlias',
          'dragStartBehavior': 'down',
          'keyboardDismissBehavior': 'onDrag',
        });
        expect(widget!.scrollDirection, Axis.horizontal);
        expect(widget.reverse, true);
        expect(widget.clipBehavior, Clip.antiAlias);
        expect(widget.dragStartBehavior, DragStartBehavior.down);
        expect(
          widget.keyboardDismissBehavior,
          ScrollViewKeyboardDismissBehavior.onDrag,
        );
      });

      test('decodes with child', () {
        final widget = NapaSingleChildScrollView.decode({
          '_name': 'SingleChildScrollView',
          'scrollDirection': 'vertical',
          'reverse': false,
          'clipBehavior': 'hardEdge',
          'dragStartBehavior': 'start',
          'keyboardDismissBehavior': 'manual',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaSingleChildScrollView();
        final decoded = NapaSingleChildScrollView.decode(original.toJson())!;
        expect(decoded.scrollDirection, Axis.vertical);
        expect(decoded.reverse, false);
        expect(decoded.clipBehavior, Clip.hardEdge);
      });

      test('round-trips with all properties', () {
        final original = NapaSingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          padding: testEdgeInsets(),
          clipBehavior: Clip.antiAlias,
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaSingleChildScrollView.decode(original.toJson())!;
        expect(decoded.scrollDirection, Axis.horizontal);
        expect(decoded.reverse, true);
        expect(decoded.clipBehavior, Clip.antiAlias);
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns SingleChildScrollView with correct properties', () {
        final widget = NapaSingleChildScrollView(
          scrollDirection: Axis.horizontal,
        ).toWidget();
        expect(widget, isA<SingleChildScrollView>());
        expect(
          (widget as SingleChildScrollView).scrollDirection,
          Axis.horizontal,
        );
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'SingleChildScrollView',
        'scrollDirection': 'vertical',
        'reverse': false,
        'clipBehavior': 'hardEdge',
        'dragStartBehavior': 'start',
        'keyboardDismissBehavior': 'manual',
      });
      expect(widget, isA<NapaSingleChildScrollView>());
    });
  });
}
