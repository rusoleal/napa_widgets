import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NapaGridView', () {
    test('constructs with defaults', () {
      final widget = NapaGridView();
      expect(widget.crossAxisCount, 2);
      expect(widget.mainAxisSpacing, 0.0);
      expect(widget.crossAxisSpacing, 0.0);
      expect(widget.childAspectRatio, 1.0);
      expect(widget.addAutomaticKeepAlives, true);
      expect(widget.addRepaintBoundaries, true);
      expect(widget.addSemanticIndexes, true);
      expect(widget.children, isEmpty);
      expect(widget.scrollDirection, Axis.vertical);
      expect(widget.reverse, false);
      expect(widget.shrinkWrap, false);
    });

    test('constructs with all params', () {
      final widget = NapaGridView(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.5,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
        scrollDirection: Axis.horizontal,
        reverse: true,
        shrinkWrap: true,
        children: [createChildWidget()],
      );
      expect(widget.crossAxisCount, 3);
      expect(widget.mainAxisSpacing, 8.0);
      expect(widget.crossAxisSpacing, 4.0);
      expect(widget.childAspectRatio, 0.5);
      expect(widget.addAutomaticKeepAlives, false);
      expect(widget.addRepaintBoundaries, false);
      expect(widget.addSemanticIndexes, false);
      expect(widget.scrollDirection, Axis.horizontal);
      expect(widget.reverse, true);
      expect(widget.shrinkWrap, true);
      expect(widget.children.length, 1);
    });

    test('widgetName returns GridView', () {
      expect(NapaGridView().widgetName, 'GridView');
    });

    group('toJson', () {
      test('contains all required fields', () {
        final json = NapaGridView().toJson();
        expect(json['_name'], 'GridView');
        expect(json['crossAxisCount'], 2);
        expect(json['mainAxisSpacing'], 0.0);
        expect(json['crossAxisSpacing'], 0.0);
        expect(json['childAspectRatio'], 1.0);
        expect(json['addAutomaticKeepAlives'], true);
        expect(json['addRepaintBoundaries'], true);
        expect(json['addSemanticIndexes'], true);
        expect(json['children'], isA<List>());
        expect(json['scrollDirection'], 'vertical');
      });

      test('serializes children', () {
        final json = NapaGridView(
          children: [createChildWidget(), createChildWidget()],
        ).toJson();
        expect(json['children'].length, 2);
        expect(json['children'][0]['_name'], 'SizedBox');
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaGridView.decode(null), isNull);
      });

      test('decodes properties', () {
        final widget = NapaGridView.decode({
          '_name': 'GridView',
          'crossAxisCount': 4,
          'mainAxisSpacing': 8.0,
          'crossAxisSpacing': 4.0,
          'childAspectRatio': 0.75,
          'addAutomaticKeepAlives': true,
          'addRepaintBoundaries': true,
          'addSemanticIndexes': true,
          'scrollDirection': 'horizontal',
          'reverse': true,
          'shrinkWrap': true,
          'clipBehavior': 'hardEdge',
          'dragStartBehavior': 'start',
          'hitTestBehavior': 'opaque',
          'children': [],
        });
        expect(widget!.crossAxisCount, 4);
        expect(widget.mainAxisSpacing, 8.0);
        expect(widget.crossAxisSpacing, 4.0);
        expect(widget.childAspectRatio, 0.75);
        expect(widget.scrollDirection, Axis.horizontal);
      });

      test('decodes with children', () {
        final widget = NapaGridView.decode({
          '_name': 'GridView',
          'crossAxisCount': 2,
          'mainAxisSpacing': 0.0,
          'crossAxisSpacing': 0.0,
          'childAspectRatio': 1.0,
          'addAutomaticKeepAlives': true,
          'addRepaintBoundaries': true,
          'addSemanticIndexes': true,
          'scrollDirection': 'vertical',
          'reverse': false,
          'shrinkWrap': false,
          'clipBehavior': 'hardEdge',
          'dragStartBehavior': 'start',
          'hitTestBehavior': 'opaque',
          'children': [createChildJson()],
        });
        expect(widget!.children.length, 1);
        expect(widget.children[0], isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaGridView();
        final decoded = NapaGridView.decode(original.toJson())!;
        expect(decoded.crossAxisCount, 2);
        expect(decoded.mainAxisSpacing, 0.0);
        expect(decoded.crossAxisSpacing, 0.0);
        expect(decoded.childAspectRatio, 1.0);
        expect(decoded.children, isEmpty);
      });

      test('round-trips with all properties', () {
        final original = NapaGridView(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 0.5,
          children: [NapaSizedBox(width: 10)],
        );
        final decoded = NapaGridView.decode(original.toJson())!;
        expect(decoded.crossAxisCount, 3);
        expect(decoded.mainAxisSpacing, 8.0);
        expect(decoded.crossAxisSpacing, 4.0);
        expect(decoded.childAspectRatio, 0.5);
        expect(decoded.children.length, 1);
        expect(decoded.children[0], isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      testWidgets('returns GridView', (tester) async {
        final widget = NapaGridView(
          shrinkWrap: true,
          children: [NapaSizedBox(width: 10, height: 10)],
        );
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: widget.toWidget(),
          ),
        );
        expect(find.byType(GridView), findsOneWidget);
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'GridView',
        'crossAxisCount': 2,
        'mainAxisSpacing': 0.0,
        'crossAxisSpacing': 0.0,
        'childAspectRatio': 1.0,
        'addAutomaticKeepAlives': true,
        'addRepaintBoundaries': true,
        'addSemanticIndexes': true,
        'scrollDirection': 'vertical',
        'reverse': false,
        'shrinkWrap': false,
        'clipBehavior': 'hardEdge',
        'dragStartBehavior': 'start',
        'hitTestBehavior': 'opaque',
        'children': [],
      });
      expect(widget, isA<NapaGridView>());
    });
  });
}
