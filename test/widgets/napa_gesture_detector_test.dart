import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lua_dardo_plus/lua.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NapaGestureDetector', () {
    test('constructs with defaults', () {
      final widget = NapaGestureDetector();
      expect(widget.child, isNull);
      expect(widget.behavior, isNull);
      expect(widget.excludeFromSemantics, false);
      expect(widget.dragStartBehavior, DragStartBehavior.start);
      expect(widget.handler, isNull);
    });

    test('constructs with all params', () {
      final child = createChildWidget();
      final handler = NapaGestureHandler(script: '');
      final widget = NapaGestureDetector(
        child: child,
        behavior: HitTestBehavior.opaque,
        excludeFromSemantics: true,
        dragStartBehavior: DragStartBehavior.down,
        handler: handler,
      );
      expect(widget.child, same(child));
      expect(widget.behavior, HitTestBehavior.opaque);
      expect(widget.excludeFromSemantics, true);
      expect(widget.dragStartBehavior, DragStartBehavior.down);
      expect(widget.handler, same(handler));
    });

    test('widgetName returns GestureDetector', () {
      expect(NapaGestureDetector().widgetName, 'GestureDetector');
    });

    group('toJson', () {
      test('contains _name and required fields', () {
        final json = NapaGestureDetector().toJson();
        expect(json['_name'], 'GestureDetector');
        expect(json['excludeFromSemantics'], false);
        expect(json['dragStartBehavior'], 'start');
      });

      test('excludes null behavior, handler, and child', () {
        final json = NapaGestureDetector().toJson();
        expect(json.containsKey('behavior'), isFalse);
        expect(json.containsKey('handler'), isFalse);
        expect(json.containsKey('child'), isFalse);
      });

      test('includes behavior when set', () {
        final json = NapaGestureDetector(
          behavior: HitTestBehavior.translucent,
        ).toJson();
        expect(json['behavior'], 'translucent');
      });

      test('includes handler when set', () {
        final json = NapaGestureDetector(
          handler: NapaGestureHandler(script: ''),
        ).toJson();
        expect(json['handler'], isA<Map>());
        expect(json['handler']['scriptType'], 'lua');
        expect(json['handler']['script'], '');
      });

      test('includes child when set', () {
        final json = NapaGestureDetector(
          child: createChildWidget(),
        ).toJson();
        expect(json['child']['_name'], 'SizedBox');
      });

      test('serializes all DragStartBehavior values', () {
        expect(
          NapaGestureDetector(dragStartBehavior: DragStartBehavior.down)
              .toJson()['dragStartBehavior'],
          'down',
        );
        expect(
          NapaGestureDetector(dragStartBehavior: DragStartBehavior.start)
              .toJson()['dragStartBehavior'],
          'start',
        );
      });
    });

    group('NapaGestureHandler', () {
      test('constructs with defaults', () {
        final handler = NapaGestureHandler();
        expect(handler.script, '');
      });

      test('toJson serializes correctly', () {
        final json = NapaGestureHandler(script: 'x = 1').toJson();
        expect(json['scriptType'], 'lua');
        expect(json['script'], 'x = 1');
      });

      test('decode returns null for null', () {
        expect(NapaGestureHandler.decode(null), isNull);
      });

      test('decode restores handler', () {
        final handler = NapaGestureHandler.decode({
          'scriptType': 'lua',
          'script': '',
        });
        expect(handler, isA<NapaGestureHandler>());
        expect(handler!.script, '');
      });

      group('callbacks return null when Lua function is not defined', () {
        late NapaGestureHandler handler;
        setUp(() => handler = NapaGestureHandler(script: ''));

        test('onTap is null', () => expect(handler.onTap, isNull));
        test('onTapDown is null', () => expect(handler.onTapDown, isNull));
        test('onTapUp is null', () => expect(handler.onTapUp, isNull));
        test('onTapCancel is null', () => expect(handler.onTapCancel, isNull));
        test('onDoubleTap is null', () => expect(handler.onDoubleTap, isNull));
        test('onLongPress is null', () => expect(handler.onLongPress, isNull));
        test('onPanUpdate is null', () => expect(handler.onPanUpdate, isNull));
        test('onScaleUpdate is null',
            () => expect(handler.onScaleUpdate, isNull));
        test('onForcePressStart is null',
            () => expect(handler.onForcePressStart, isNull));
        test('onVerticalDragUpdate is null',
            () => expect(handler.onVerticalDragUpdate, isNull));
      });

      group('callbacks return non-null when Lua function is defined', () {
        test('onTap is non-null', () {
          final handler = NapaGestureHandler(script: 'function onTap() end');
          expect(handler.onTap, isNotNull);
        });

        test('onTapDown is non-null', () {
          final handler =
              NapaGestureHandler(script: 'function onTapDown(d) end');
          expect(handler.onTapDown, isNotNull);
        });

        test('onLongPress is non-null', () {
          final handler =
              NapaGestureHandler(script: 'function onLongPress() end');
          expect(handler.onLongPress, isNotNull);
        });

        test('onPanUpdate is non-null', () {
          final handler =
              NapaGestureHandler(script: 'function onPanUpdate(d) end');
          expect(handler.onPanUpdate, isNotNull);
        });

        test('onScaleUpdate is non-null', () {
          final handler =
              NapaGestureHandler(script: 'function onScaleUpdate(d) end');
          expect(handler.onScaleUpdate, isNotNull);
        });

        test('only defined callbacks are non-null', () {
          final handler = NapaGestureHandler(script: 'function onTap() end');
          expect(handler.onTap, isNotNull);
          expect(handler.onDoubleTap, isNull);
          expect(handler.onLongPress, isNull);
          expect(handler.onPanUpdate, isNull);
        });
      });

      group('Lua callbacks are invoked correctly', () {
        int luaGetInt(LuaState ls, String name) {
          ls.getGlobal(name);
          final value = ls.toNumber(-1).toInt();
          ls.pop(1);
          return value;
        }

        test('onTap calls Lua onTap()', () {
          final handler =
              NapaGestureHandler(script: 'called = 0\nfunction onTap() called = 1 end');
          handler.onTap!();
          expect(luaGetInt(handler.luaState, 'called'), 1);
        });

        test('onTapDown passes position table to Lua', () {
          final handler = NapaGestureHandler(
            script: 'lx = 0\nfunction onTapDown(d) lx = d.localX end',
          );
          handler.onTapDown!(
            TapDownDetails(
              localPosition: const Offset(42, 0),
              globalPosition: Offset.zero,
            ),
          );
          expect(luaGetInt(handler.luaState, 'lx'), 42);
        });

        test('onLongPressMoveUpdate passes offset fields to Lua', () {
          final handler = NapaGestureHandler(
            script:
                'odx = 0\nfunction onLongPressMoveUpdate(d) odx = d.offsetDx end',
          );
          handler.onLongPressMoveUpdate!(
            LongPressMoveUpdateDetails(
              globalPosition: Offset.zero,
              localPosition: Offset.zero,
              offsetFromOrigin: const Offset(7, 0),
              localOffsetFromOrigin: const Offset(7, 0),
            ),
          );
          expect(luaGetInt(handler.luaState, 'odx'), 7);
        });

        test('onPanUpdate passes delta to Lua', () {
          final handler = NapaGestureHandler(
            script: 'vdx = 0\nfunction onPanUpdate(d) vdx = d.dx end',
          );
          handler.onPanUpdate!(
            DragUpdateDetails(
              globalPosition: Offset.zero,
              localPosition: Offset.zero,
              delta: const Offset(15, 0),
            ),
          );
          expect(luaGetInt(handler.luaState, 'vdx'), 15);
        });

        test('onScaleUpdate passes scale to Lua', () {
          final handler = NapaGestureHandler(
            script: 's = 0\nfunction onScaleUpdate(d) s = d.scale end',
          );
          handler.onScaleUpdate!(
            ScaleUpdateDetails(scale: 2.0),
          );
          expect(luaGetInt(handler.luaState, 's'), 2);
        });

        test('onLongPressEnd passes velocity to Lua', () {
          final handler = NapaGestureHandler(
            script: 'vx = 0\nfunction onLongPressEnd(d) vx = d.velocityDx end',
          );
          handler.onLongPressEnd!(
            LongPressEndDetails(
              velocity: const Velocity(pixelsPerSecond: Offset(100, 0)),
            ),
          );
          expect(luaGetInt(handler.luaState, 'vx'), 100);
        });

        test('onPanEnd passes velocity to Lua', () {
          final handler = NapaGestureHandler(
            script: 'vy = 0\nfunction onPanEnd(d) vy = d.velocityDy end',
          );
          handler.onPanEnd!(
            DragEndDetails(
              velocity: const Velocity(pixelsPerSecond: Offset(0, 50)),
            ),
          );
          expect(luaGetInt(handler.luaState, 'vy'), 50);
        });
      });
    });

    group('decode', () {
      test('returns null for null input', () {
        expect(NapaGestureDetector.decode(null), isNull);
      });

      test('decodes defaults', () {
        final widget = NapaGestureDetector.decode({
          '_name': 'GestureDetector',
          'excludeFromSemantics': false,
          'dragStartBehavior': 'start',
        });
        expect(widget, isA<NapaGestureDetector>());
        expect(widget!.behavior, isNull);
        expect(widget.excludeFromSemantics, false);
        expect(widget.dragStartBehavior, DragStartBehavior.start);
        expect(widget.handler, isNull);
        expect(widget.child, isNull);
      });

      test('decodes behavior', () {
        final widget = NapaGestureDetector.decode({
          '_name': 'GestureDetector',
          'behavior': 'translucent',
          'excludeFromSemantics': false,
          'dragStartBehavior': 'start',
        });
        expect(widget!.behavior, HitTestBehavior.translucent);
      });

      test('decodes dragStartBehavior down', () {
        final widget = NapaGestureDetector.decode({
          '_name': 'GestureDetector',
          'excludeFromSemantics': false,
          'dragStartBehavior': 'down',
        });
        expect(widget!.dragStartBehavior, DragStartBehavior.down);
      });

      test('decodes handler', () {
        final widget = NapaGestureDetector.decode({
          '_name': 'GestureDetector',
          'excludeFromSemantics': false,
          'dragStartBehavior': 'start',
          'handler': {'scriptType': 'lua', 'script': ''},
        });
        expect(widget!.handler, isA<NapaGestureHandler>());
      });

      test('decodes with child', () {
        final widget = NapaGestureDetector.decode({
          '_name': 'GestureDetector',
          'excludeFromSemantics': false,
          'dragStartBehavior': 'start',
          'child': createChildJson(),
        });
        expect(widget!.child, isA<NapaSizedBox>());
      });
    });

    group('JSON round-trip', () {
      test('round-trips with defaults', () {
        final original = NapaGestureDetector();
        final decoded = NapaGestureDetector.decode(original.toJson())!;
        expect(decoded.behavior, isNull);
        expect(decoded.excludeFromSemantics, false);
        expect(decoded.dragStartBehavior, DragStartBehavior.start);
        expect(decoded.handler, isNull);
      });

      test('round-trips with all properties', () {
        final original = NapaGestureDetector(
          behavior: HitTestBehavior.opaque,
          excludeFromSemantics: true,
          dragStartBehavior: DragStartBehavior.down,
          handler: NapaGestureHandler(script: 'function onTap() end'),
          child: NapaSizedBox(width: 10),
        );
        final decoded = NapaGestureDetector.decode(original.toJson())!;
        expect(decoded.behavior, HitTestBehavior.opaque);
        expect(decoded.excludeFromSemantics, true);
        expect(decoded.dragStartBehavior, DragStartBehavior.down);
        expect(decoded.handler, isA<NapaGestureHandler>());
        expect(decoded.handler!.script, 'function onTap() end');
        expect(decoded.child, isA<NapaSizedBox>());
      });
    });

    group('toWidget', () {
      test('returns GestureDetector', () {
        expect(NapaGestureDetector().toWidget(), isA<GestureDetector>());
      });

      test('passes behavior', () {
        final gd = NapaGestureDetector(
          behavior: HitTestBehavior.opaque,
        ).toWidget() as GestureDetector;
        expect(gd.behavior, HitTestBehavior.opaque);
      });

      test('passes dragStartBehavior', () {
        final gd = NapaGestureDetector(
          dragStartBehavior: DragStartBehavior.down,
        ).toWidget() as GestureDetector;
        expect(gd.dragStartBehavior, DragStartBehavior.down);
      });

      test('null handler produces null callbacks', () {
        final gd = NapaGestureDetector().toWidget() as GestureDetector;
        expect(gd.onTap, isNull);
        expect(gd.onLongPress, isNull);
        expect(gd.onPanUpdate, isNull);
      });

      test('defined Lua functions produce non-null callbacks on widget', () {
        final gd = NapaGestureDetector(
          handler: NapaGestureHandler(
            script: 'function onTap() end\nfunction onLongPress() end',
          ),
        ).toWidget() as GestureDetector;
        expect(gd.onTap, isNotNull);
        expect(gd.onLongPress, isNotNull);
        expect(gd.onPanUpdate, isNull);
      });

      test('includes child', () {
        final gd = NapaGestureDetector(
          child: createChildWidget(),
        ).toWidget() as GestureDetector;
        expect(gd.child, isA<SizedBox>());
      });
    });

    test('NapaWidget.decode dispatches correctly', () {
      final widget = NapaWidget.decode({
        '_name': 'GestureDetector',
        'excludeFromSemantics': false,
        'dragStartBehavior': 'start',
      });
      expect(widget, isA<NapaGestureDetector>());
    });
  });
}
