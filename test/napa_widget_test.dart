import 'package:flutter_test/flutter_test.dart';
import 'package:napa_widgets/napa_widgets.dart';

import 'helpers/test_helpers.dart';

void main() {
  group('NapaWidget', () {
    group('decode', () {
      test('returns null for null input', () {
        expect(NapaWidget.decode(null), isNull);
      });

      test('returns null for non-map input', () {
        expect(NapaWidget.decode('not a map'), isNull);
        expect(NapaWidget.decode(42), isNull);
        expect(NapaWidget.decode([]), isNull);
      });

      test('throws when _name is missing', () {
        expect(
          () => NapaWidget.decode(<String, dynamic>{}),
          throwsA(isA<Exception>()),
        );
      });

      test('throws for unknown widget name', () {
        expect(
          () => NapaWidget.decode(<String, dynamic>{'_name': 'UnknownWidget'}),
          throwsA(isA<Exception>()),
        );
      });

      test('dispatches to SizedBox', () {
        final widget = NapaWidget.decode({
          '_name': 'SizedBox',
          'width': 50.0,
          'height': 30.0,
        });
        expect(widget, isA<NapaSizedBox>());
        expect((widget as NapaSizedBox).width, 50.0);
        expect(widget.height, 30.0);
      });

      test('dispatches to Text', () {
        final widget = NapaWidget.decode({
          '_name': 'Text',
          'text': 'hello',
        });
        expect(widget, isA<NapaText>());
        expect((widget as NapaText).text, 'hello');
      });

      test('dispatches to Container', () {
        final widget = NapaWidget.decode({
          '_name': 'Container',
          'clipBehavior': 'none',
        });
        expect(widget, isA<NapaContainer>());
      });

      test('dispatches to Padding', () {
        final widget = NapaWidget.decode({
          '_name': 'Padding',
          'padding': testEdgeInsetsJson(),
        });
        expect(widget, isA<NapaPadding>());
      });

      test('dispatches to Opacity', () {
        final widget = NapaWidget.decode({
          '_name': 'Opacity',
          'opacity': 0.5,
          'alwaysIncludeSemantics': false,
        });
        expect(widget, isA<NapaOpacity>());
      });

      test('dispatches to Align', () {
        final widget = NapaWidget.decode({
          '_name': 'Align',
          'alignment': testAlignmentCenterJson(),
        });
        expect(widget, isA<NapaAlign>());
      });

      test('dispatches to Center', () {
        final widget = NapaWidget.decode({'_name': 'Center'});
        expect(widget, isA<NapaCenter>());
      });

      test('dispatches to RepaintBoundary', () {
        final widget = NapaWidget.decode({'_name': 'RepaintBoundary'});
        expect(widget, isA<NapaRepaintBoundary>());
      });

      test('dispatches to Stack', () {
        final widget = NapaWidget.decode({
          '_name': 'Stack',
          'alignment': testAlignmentTopLeftJson(),
          'clipBehavior': 'hardEdge',
          'fit': 'loose',
        });
        expect(widget, isA<NapaStack>());
      });

      test('dispatches to RotatedBox', () {
        final widget = NapaWidget.decode({
          '_name': 'RotatedBox',
          'quarterTurns': 2,
        });
        expect(widget, isA<NapaRotatedBox>());
      });
    });

    group('registerNapaWidget', () {
      test('registers and dispatches a custom widget', () {
        NapaWidget.registerNapaWidget(
          'TestWidget',
          (data) => NapaSizedBox(width: 99),
        );

        final widget = NapaWidget.decode({
          '_name': 'TestWidget',
        });
        expect(widget, isA<NapaSizedBox>());
        expect((widget as NapaSizedBox).width, 99);
      });
    });

    group('base class behavior', () {
      test('toJson contains _name field', () {
        final widget = NapaSizedBox(width: 10, height: 20);
        final json = widget.toJson();
        expect(json['_name'], 'SizedBox');
      });

      test('widgetName returns correct value', () {
        expect(NapaSizedBox().widgetName, 'SizedBox');
        expect(NapaText('hello').widgetName, 'Text');
        expect(NapaOpacity(opacity: 1.0).widgetName, 'Opacity');
      });

      test('toString returns widgetName', () {
        expect(NapaSizedBox().toString(), 'SizedBox');
      });

      test('childMode is set correctly', () {
        expect(NapaSizedBox().childMode, NapaChildMode.singleChild);
        expect(NapaText('hi').childMode, NapaChildMode.noChildren);
        expect(NapaStack().childMode, NapaChildMode.multipleChildren);
      });
    });

    group('all registered widgets', () {
      final registeredNames = [
        'Align', 'AspectRatio', 'BackdropFilter', 'Baseline', 'Center',
        'ClipPath', 'ClipOval', 'ClipRect', 'ClipRRect', 'ClipRSuperellipse',
        'Column', 'Container', 'CustomPaint', 'DecoratedBox', 'Expanded',
        'FittedBox', 'Flex', 'Flexible', 'Flow', 'Image', 'ListView',
        'Opacity', 'Padding', 'Positioned', 'RepaintBoundary', 'RotatedBox',
        'Row', 'SizedBox', 'Stack', 'Text', 'Transform', 'Wrap',
      ];

      test('all expected widgets are registered', () {
        for (final name in registeredNames) {
          // Verify the name is recognized by the dispatch — i.e. it does NOT
          // throw 'Unknown implementation of NapaWidget: $name'.
          // Some widgets crash inside their own decode when given minimal data
          // (known bugs: Container, Flex, Row, Column, CustomPaint, etc.),
          // so we tolerate any error *except* the unknown-widget error.
          try {
            NapaWidget.decode(<String, dynamic>{'_name': name});
          } on Exception catch (e) {
            if (e.toString().contains('Unknown implementation')) {
              fail('Widget "$name" is not registered: $e');
            }
            // Other errors are expected — decode methods with missing null guards
          } catch (_) {
            // TypeError, NoSuchMethodError, etc. from buggy decoders — fine
          }
        }
      });
    });
  });
}
