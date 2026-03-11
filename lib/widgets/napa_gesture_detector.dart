import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:lua_dardo_plus/lua.dart';

import '../scripting/napa_script_type.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [GestureDetector].
/// https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
///
/// Gesture events are handled by a [NapaGestureHandler] Lua script.
/// Only Lua functions that are defined in the script activate their
/// corresponding gesture recognizer.
///
class NapaGestureDetector extends NapaStatelessWidget {
  NapaWidget? child;
  HitTestBehavior? behavior;
  bool excludeFromSemantics;
  DragStartBehavior dragStartBehavior;
  NapaGestureHandler? handler;

  NapaGestureDetector({
    this.child,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.handler,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<HitTestBehavior>(
        name: 'behavior',
        nullable: true,
        getValue: (Inspectable obj) => behavior,
        setValue: (obj, value, customData) => behavior = value,
        values: () => HitTestBehavior.values,
      ),
      InspectableProperty<bool>(
        name: 'excludeFromSemantics',
        getValue: (obj) => excludeFromSemantics,
        setValue: (obj, value, customData) => excludeFromSemantics = value,
      ),
      InspectableProperty<Enum>(
        name: 'dragStartBehavior',
        getValue: (obj) => dragStartBehavior,
        setValue: (obj, value, customData) => dragStartBehavior = value,
        values: () => DragStartBehavior.values,
      ),
      InspectableProperty<NapaGestureHandler>(
        name: 'handler',
        nullable: true,
        getValue: (Inspectable obj) => handler,
        setValue: (obj, value, customData) => handler = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        if (behavior != null) 'behavior': behavior!.name,
        'excludeFromSemantics': excludeFromSemantics,
        'dragStartBehavior': dragStartBehavior.name,
        if (handler != null) 'handler': handler!.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'GestureDetector';

  @override
  Widget toWidget() => GestureDetector(
    behavior: behavior,
    excludeFromSemantics: excludeFromSemantics,
    dragStartBehavior: dragStartBehavior,
    onTapDown: handler?.onTapDown,
    onTapUp: handler?.onTapUp,
    onTap: handler?.onTap,
    onTapCancel: handler?.onTapCancel,
    onSecondaryTap: handler?.onSecondaryTap,
    onSecondaryTapDown: handler?.onSecondaryTapDown,
    onSecondaryTapUp: handler?.onSecondaryTapUp,
    onSecondaryTapCancel: handler?.onSecondaryTapCancel,
    onTertiaryTapDown: handler?.onTertiaryTapDown,
    onTertiaryTapUp: handler?.onTertiaryTapUp,
    onTertiaryTapCancel: handler?.onTertiaryTapCancel,
    onDoubleTapDown: handler?.onDoubleTapDown,
    onDoubleTap: handler?.onDoubleTap,
    onDoubleTapCancel: handler?.onDoubleTapCancel,
    onLongPressDown: handler?.onLongPressDown,
    onLongPressCancel: handler?.onLongPressCancel,
    onLongPress: handler?.onLongPress,
    onLongPressStart: handler?.onLongPressStart,
    onLongPressMoveUpdate: handler?.onLongPressMoveUpdate,
    onLongPressUp: handler?.onLongPressUp,
    onLongPressEnd: handler?.onLongPressEnd,
    onSecondaryLongPressDown: handler?.onSecondaryLongPressDown,
    onSecondaryLongPressCancel: handler?.onSecondaryLongPressCancel,
    onSecondaryLongPress: handler?.onSecondaryLongPress,
    onSecondaryLongPressStart: handler?.onSecondaryLongPressStart,
    onSecondaryLongPressMoveUpdate: handler?.onSecondaryLongPressMoveUpdate,
    onSecondaryLongPressUp: handler?.onSecondaryLongPressUp,
    onSecondaryLongPressEnd: handler?.onSecondaryLongPressEnd,
    onTertiaryLongPressDown: handler?.onTertiaryLongPressDown,
    onTertiaryLongPressCancel: handler?.onTertiaryLongPressCancel,
    onTertiaryLongPress: handler?.onTertiaryLongPress,
    onTertiaryLongPressStart: handler?.onTertiaryLongPressStart,
    onTertiaryLongPressMoveUpdate: handler?.onTertiaryLongPressMoveUpdate,
    onTertiaryLongPressUp: handler?.onTertiaryLongPressUp,
    onTertiaryLongPressEnd: handler?.onTertiaryLongPressEnd,
    onVerticalDragDown: handler?.onVerticalDragDown,
    onVerticalDragStart: handler?.onVerticalDragStart,
    onVerticalDragUpdate: handler?.onVerticalDragUpdate,
    onVerticalDragEnd: handler?.onVerticalDragEnd,
    onVerticalDragCancel: handler?.onVerticalDragCancel,
    onHorizontalDragDown: handler?.onHorizontalDragDown,
    onHorizontalDragStart: handler?.onHorizontalDragStart,
    onHorizontalDragUpdate: handler?.onHorizontalDragUpdate,
    onHorizontalDragEnd: handler?.onHorizontalDragEnd,
    onHorizontalDragCancel: handler?.onHorizontalDragCancel,
    onPanDown: handler?.onPanDown,
    onPanStart: handler?.onPanStart,
    onPanUpdate: handler?.onPanUpdate,
    onPanEnd: handler?.onPanEnd,
    onPanCancel: handler?.onPanCancel,
    onScaleStart: handler?.onScaleStart,
    onScaleUpdate: handler?.onScaleUpdate,
    onScaleEnd: handler?.onScaleEnd,
    onForcePressStart: handler?.onForcePressStart,
    onForcePressPeak: handler?.onForcePressPeak,
    onForcePressUpdate: handler?.onForcePressUpdate,
    onForcePressEnd: handler?.onForcePressEnd,
    child: child?.toWidget(),
  );

  static NapaGestureDetector? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaGestureDetector(
      behavior: data['behavior'] != null
          ? decodeHitTestBehavior(data['behavior'])
          : null,
      excludeFromSemantics: data['excludeFromSemantics'] ?? false,
      dragStartBehavior: data['dragStartBehavior'] != null
          ? decodeDragStartBehavior(data['dragStartBehavior'])
          : DragStartBehavior.start,
      handler: NapaGestureHandler.decode(data['handler']),
      child: NapaWidget.decode(data['child']),
    );
  }
}

/// Lua-backed gesture event handler for [NapaGestureDetector].
///
/// The script runs in a single [LuaState] shared across all events.
/// Define any of the following Lua functions to handle gesture events.
/// Unrecognized functions are ignored and their recognizer is not activated.
///
/// **No-parameter callbacks:**
/// `onTap`, `onTapCancel`, `onDoubleTap`, `onDoubleTapCancel`,
/// `onLongPress`, `onLongPressUp`, `onLongPressCancel`,
/// `onSecondaryTap`, `onSecondaryTapCancel`, `onSecondaryLongPress`,
/// `onSecondaryLongPressUp`, `onSecondaryLongPressCancel`,
/// `onTertiaryTapCancel`, `onTertiaryLongPress`, `onTertiaryLongPressUp`,
/// `onTertiaryLongPressCancel`, `onVerticalDragCancel`,
/// `onHorizontalDragCancel`, `onPanCancel`
///
/// **Callbacks with a details table `d`:**
///
/// Position events — `d.localX`, `d.localY`, `d.globalX`, `d.globalY`:
/// `onTapDown`, `onTapUp`, `onSecondaryTapDown`, `onSecondaryTapUp`,
/// `onTertiaryTapDown`, `onTertiaryTapUp`, `onDoubleTapDown`,
/// `onLongPressDown`, `onLongPressStart`, `onSecondaryLongPressDown`,
/// `onSecondaryLongPressStart`, `onTertiaryLongPressDown`,
/// `onTertiaryLongPressStart`, `onVerticalDragDown`, `onVerticalDragStart`,
/// `onHorizontalDragDown`, `onHorizontalDragStart`, `onPanDown`, `onPanStart`
///
/// Move events — above + `d.offsetDx`, `d.offsetDy`:
/// `onLongPressMoveUpdate`, `onSecondaryLongPressMoveUpdate`,
/// `onTertiaryLongPressMoveUpdate`
///
/// Drag update — above + `d.dx`, `d.dy`, `d.primaryDelta`:
/// `onVerticalDragUpdate`, `onHorizontalDragUpdate`, `onPanUpdate`
///
/// End/velocity events — `d.velocityDx`, `d.velocityDy` + position:
/// `onLongPressEnd`, `onSecondaryLongPressEnd`, `onTertiaryLongPressEnd`
///
/// Drag end — `d.velocityDx`, `d.velocityDy`, `d.primaryVelocity`:
/// `onVerticalDragEnd`, `onHorizontalDragEnd`, `onPanEnd`
///
/// Scale start — `d.focalX`, `d.focalY`, `d.localFocalX`, `d.localFocalY`, `d.pointerCount`:
/// `onScaleStart`
///
/// Scale update — above + `d.scale`, `d.horizontalScale`, `d.verticalScale`,
/// `d.rotation`, `d.dx`, `d.dy`: `onScaleUpdate`
///
/// Scale end — `d.velocityDx`, `d.velocityDy`, `d.pointerCount`: `onScaleEnd`
///
/// Force press — `d.localX`, `d.localY`, `d.globalX`, `d.globalY`, `d.pressure`:
/// `onForcePressStart`, `onForcePressPeak`, `onForcePressUpdate`, `onForcePressEnd`
///
class NapaGestureHandler {
  NapaScriptType scriptType;
  String script;
  late LuaState luaState;

  NapaGestureHandler({this.scriptType = .lua, this.script = ''}) {
    luaState = LuaState.newState();
    luaState.openLibs();
    luaState.loadString(script);
    luaState.call(0, 0);
  }

  dynamic toJson() {
    return <String, dynamic>{'scriptType': scriptType.name, 'script': script};
  }

  static NapaGestureHandler? decode(dynamic data) {
    if (data == null) return null;
    return NapaGestureHandler(
      scriptType: decodeNapaScriptType(data['scriptType']),
      script: data['script'],
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  bool _hasFn(String name) {
    final t = luaState.getGlobal(name);
    luaState.pop(1);
    return t == LuaType.luaFunction;
  }

  void _callVoid(String name) {
    final t = luaState.getGlobal(name);
    if (t == LuaType.luaFunction) {
      final status = luaState.pCall(0, 0, 0);
      if (status != ThreadStatus.luaOk) {
        luaState.pop(1);
      }
    } else {
      luaState.pop(1);
    }
  }

  void _callWithTable(String name, void Function() buildTable) {
    final t = luaState.getGlobal(name);
    if (t == LuaType.luaFunction) {
      buildTable();
      final status = luaState.pCall(1, 0, 0);
      if (status != ThreadStatus.luaOk) {
        luaState.pop(1);
      }
    } else {
      luaState.pop(1);
    }
  }

  void _setNum(String key, double value) {
    luaState.pushNumber(value);
    luaState.setField(-2, key);
  }

  void _pushPosition(Offset local, Offset global) {
    _setNum('localX', local.dx);
    _setNum('localY', local.dy);
    _setNum('globalX', global.dx);
    _setNum('globalY', global.dy);
  }

  void _tablePosition(String name, Offset local, Offset global) {
    _callWithTable(name, () {
      luaState.newTable();
      _pushPosition(local, global);
    });
  }

  // ── Tap ───────────────────────────────────────────────────────────────────

  GestureTapCallback? get onTap =>
      _hasFn('onTap') ? () => _callVoid('onTap') : null;

  GestureTapCancelCallback? get onTapCancel =>
      _hasFn('onTapCancel') ? () => _callVoid('onTapCancel') : null;

  GestureTapDownCallback? get onTapDown => _hasFn('onTapDown')
      ? (d) => _tablePosition('onTapDown', d.localPosition, d.globalPosition)
      : null;

  GestureTapUpCallback? get onTapUp => _hasFn('onTapUp')
      ? (d) => _tablePosition('onTapUp', d.localPosition, d.globalPosition)
      : null;

  // ── Secondary tap ─────────────────────────────────────────────────────────

  GestureTapCallback? get onSecondaryTap =>
      _hasFn('onSecondaryTap') ? () => _callVoid('onSecondaryTap') : null;

  GestureTapCancelCallback? get onSecondaryTapCancel =>
      _hasFn('onSecondaryTapCancel')
          ? () => _callVoid('onSecondaryTapCancel')
          : null;

  GestureTapDownCallback? get onSecondaryTapDown =>
      _hasFn('onSecondaryTapDown')
          ? (d) => _tablePosition(
              'onSecondaryTapDown', d.localPosition, d.globalPosition)
          : null;

  GestureTapUpCallback? get onSecondaryTapUp => _hasFn('onSecondaryTapUp')
      ? (d) =>
          _tablePosition('onSecondaryTapUp', d.localPosition, d.globalPosition)
      : null;

  // ── Tertiary tap ──────────────────────────────────────────────────────────

  GestureTapCancelCallback? get onTertiaryTapCancel =>
      _hasFn('onTertiaryTapCancel')
          ? () => _callVoid('onTertiaryTapCancel')
          : null;

  GestureTapDownCallback? get onTertiaryTapDown =>
      _hasFn('onTertiaryTapDown')
          ? (d) => _tablePosition(
              'onTertiaryTapDown', d.localPosition, d.globalPosition)
          : null;

  GestureTapUpCallback? get onTertiaryTapUp => _hasFn('onTertiaryTapUp')
      ? (d) => _tablePosition(
          'onTertiaryTapUp', d.localPosition, d.globalPosition)
      : null;

  // ── Double tap ────────────────────────────────────────────────────────────

  GestureTapCallback? get onDoubleTap =>
      _hasFn('onDoubleTap') ? () => _callVoid('onDoubleTap') : null;

  GestureTapCancelCallback? get onDoubleTapCancel =>
      _hasFn('onDoubleTapCancel') ? () => _callVoid('onDoubleTapCancel') : null;

  GestureTapDownCallback? get onDoubleTapDown => _hasFn('onDoubleTapDown')
      ? (d) =>
          _tablePosition('onDoubleTapDown', d.localPosition, d.globalPosition)
      : null;

  // ── Long press ────────────────────────────────────────────────────────────

  GestureLongPressDownCallback? get onLongPressDown =>
      _hasFn('onLongPressDown')
          ? (d) => _tablePosition(
              'onLongPressDown', d.localPosition, d.globalPosition)
          : null;

  GestureLongPressCancelCallback? get onLongPressCancel =>
      _hasFn('onLongPressCancel') ? () => _callVoid('onLongPressCancel') : null;

  GestureLongPressCallback? get onLongPress =>
      _hasFn('onLongPress') ? () => _callVoid('onLongPress') : null;

  GestureLongPressStartCallback? get onLongPressStart =>
      _hasFn('onLongPressStart')
          ? (d) => _tablePosition(
              'onLongPressStart', d.localPosition, d.globalPosition)
          : null;

  GestureLongPressMoveUpdateCallback? get onLongPressMoveUpdate =>
      _hasFn('onLongPressMoveUpdate')
          ? (d) => _callWithTable('onLongPressMoveUpdate', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('offsetDx', d.offsetFromOrigin.dx);
                _setNum('offsetDy', d.offsetFromOrigin.dy);
              })
          : null;

  GestureLongPressUpCallback? get onLongPressUp =>
      _hasFn('onLongPressUp') ? () => _callVoid('onLongPressUp') : null;

  GestureLongPressEndCallback? get onLongPressEnd =>
      _hasFn('onLongPressEnd')
          ? (d) => _callWithTable('onLongPressEnd', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
                _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
              })
          : null;

  // ── Secondary long press ──────────────────────────────────────────────────

  GestureLongPressDownCallback? get onSecondaryLongPressDown =>
      _hasFn('onSecondaryLongPressDown')
          ? (d) => _tablePosition(
              'onSecondaryLongPressDown', d.localPosition, d.globalPosition)
          : null;

  GestureLongPressCancelCallback? get onSecondaryLongPressCancel =>
      _hasFn('onSecondaryLongPressCancel')
          ? () => _callVoid('onSecondaryLongPressCancel')
          : null;

  GestureLongPressCallback? get onSecondaryLongPress =>
      _hasFn('onSecondaryLongPress')
          ? () => _callVoid('onSecondaryLongPress')
          : null;

  GestureLongPressStartCallback? get onSecondaryLongPressStart =>
      _hasFn('onSecondaryLongPressStart')
          ? (d) => _tablePosition(
              'onSecondaryLongPressStart', d.localPosition, d.globalPosition)
          : null;

  GestureLongPressMoveUpdateCallback? get onSecondaryLongPressMoveUpdate =>
      _hasFn('onSecondaryLongPressMoveUpdate')
          ? (d) => _callWithTable('onSecondaryLongPressMoveUpdate', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('offsetDx', d.offsetFromOrigin.dx);
                _setNum('offsetDy', d.offsetFromOrigin.dy);
              })
          : null;

  GestureLongPressUpCallback? get onSecondaryLongPressUp =>
      _hasFn('onSecondaryLongPressUp')
          ? () => _callVoid('onSecondaryLongPressUp')
          : null;

  GestureLongPressEndCallback? get onSecondaryLongPressEnd =>
      _hasFn('onSecondaryLongPressEnd')
          ? (d) => _callWithTable('onSecondaryLongPressEnd', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
                _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
              })
          : null;

  // ── Tertiary long press ───────────────────────────────────────────────────

  GestureLongPressDownCallback? get onTertiaryLongPressDown =>
      _hasFn('onTertiaryLongPressDown')
          ? (d) => _tablePosition(
              'onTertiaryLongPressDown', d.localPosition, d.globalPosition)
          : null;

  GestureLongPressCancelCallback? get onTertiaryLongPressCancel =>
      _hasFn('onTertiaryLongPressCancel')
          ? () => _callVoid('onTertiaryLongPressCancel')
          : null;

  GestureLongPressCallback? get onTertiaryLongPress =>
      _hasFn('onTertiaryLongPress')
          ? () => _callVoid('onTertiaryLongPress')
          : null;

  GestureLongPressStartCallback? get onTertiaryLongPressStart =>
      _hasFn('onTertiaryLongPressStart')
          ? (d) => _tablePosition(
              'onTertiaryLongPressStart', d.localPosition, d.globalPosition)
          : null;

  GestureLongPressMoveUpdateCallback? get onTertiaryLongPressMoveUpdate =>
      _hasFn('onTertiaryLongPressMoveUpdate')
          ? (d) => _callWithTable('onTertiaryLongPressMoveUpdate', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('offsetDx', d.offsetFromOrigin.dx);
                _setNum('offsetDy', d.offsetFromOrigin.dy);
              })
          : null;

  GestureLongPressUpCallback? get onTertiaryLongPressUp =>
      _hasFn('onTertiaryLongPressUp')
          ? () => _callVoid('onTertiaryLongPressUp')
          : null;

  GestureLongPressEndCallback? get onTertiaryLongPressEnd =>
      _hasFn('onTertiaryLongPressEnd')
          ? (d) => _callWithTable('onTertiaryLongPressEnd', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
                _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
              })
          : null;

  // ── Vertical drag ─────────────────────────────────────────────────────────

  GestureDragDownCallback? get onVerticalDragDown =>
      _hasFn('onVerticalDragDown')
          ? (d) => _tablePosition(
              'onVerticalDragDown', d.localPosition, d.globalPosition)
          : null;

  GestureDragStartCallback? get onVerticalDragStart =>
      _hasFn('onVerticalDragStart')
          ? (d) => _tablePosition(
              'onVerticalDragStart', d.localPosition, d.globalPosition)
          : null;

  GestureDragUpdateCallback? get onVerticalDragUpdate =>
      _hasFn('onVerticalDragUpdate')
          ? (d) => _callWithTable('onVerticalDragUpdate', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('dx', d.delta.dx);
                _setNum('dy', d.delta.dy);
                if (d.primaryDelta != null) {
                  _setNum('primaryDelta', d.primaryDelta!);
                }
              })
          : null;

  GestureDragEndCallback? get onVerticalDragEnd =>
      _hasFn('onVerticalDragEnd')
          ? (d) => _callWithTable('onVerticalDragEnd', () {
                luaState.newTable();
                _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
                _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
                if (d.primaryVelocity != null) {
                  _setNum('primaryVelocity', d.primaryVelocity!);
                }
              })
          : null;

  GestureDragCancelCallback? get onVerticalDragCancel =>
      _hasFn('onVerticalDragCancel')
          ? () => _callVoid('onVerticalDragCancel')
          : null;

  // ── Horizontal drag ───────────────────────────────────────────────────────

  GestureDragDownCallback? get onHorizontalDragDown =>
      _hasFn('onHorizontalDragDown')
          ? (d) => _tablePosition(
              'onHorizontalDragDown', d.localPosition, d.globalPosition)
          : null;

  GestureDragStartCallback? get onHorizontalDragStart =>
      _hasFn('onHorizontalDragStart')
          ? (d) => _tablePosition(
              'onHorizontalDragStart', d.localPosition, d.globalPosition)
          : null;

  GestureDragUpdateCallback? get onHorizontalDragUpdate =>
      _hasFn('onHorizontalDragUpdate')
          ? (d) => _callWithTable('onHorizontalDragUpdate', () {
                luaState.newTable();
                _pushPosition(d.localPosition, d.globalPosition);
                _setNum('dx', d.delta.dx);
                _setNum('dy', d.delta.dy);
                if (d.primaryDelta != null) {
                  _setNum('primaryDelta', d.primaryDelta!);
                }
              })
          : null;

  GestureDragEndCallback? get onHorizontalDragEnd =>
      _hasFn('onHorizontalDragEnd')
          ? (d) => _callWithTable('onHorizontalDragEnd', () {
                luaState.newTable();
                _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
                _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
                if (d.primaryVelocity != null) {
                  _setNum('primaryVelocity', d.primaryVelocity!);
                }
              })
          : null;

  GestureDragCancelCallback? get onHorizontalDragCancel =>
      _hasFn('onHorizontalDragCancel')
          ? () => _callVoid('onHorizontalDragCancel')
          : null;

  // ── Pan ───────────────────────────────────────────────────────────────────

  GestureDragDownCallback? get onPanDown => _hasFn('onPanDown')
      ? (d) => _tablePosition('onPanDown', d.localPosition, d.globalPosition)
      : null;

  GestureDragStartCallback? get onPanStart => _hasFn('onPanStart')
      ? (d) => _tablePosition('onPanStart', d.localPosition, d.globalPosition)
      : null;

  GestureDragUpdateCallback? get onPanUpdate => _hasFn('onPanUpdate')
      ? (d) => _callWithTable('onPanUpdate', () {
            luaState.newTable();
            _pushPosition(d.localPosition, d.globalPosition);
            _setNum('dx', d.delta.dx);
            _setNum('dy', d.delta.dy);
          })
      : null;

  GestureDragEndCallback? get onPanEnd => _hasFn('onPanEnd')
      ? (d) => _callWithTable('onPanEnd', () {
            luaState.newTable();
            _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
            _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
          })
      : null;

  GestureDragCancelCallback? get onPanCancel =>
      _hasFn('onPanCancel') ? () => _callVoid('onPanCancel') : null;

  // ── Scale ─────────────────────────────────────────────────────────────────

  GestureScaleStartCallback? get onScaleStart => _hasFn('onScaleStart')
      ? (d) => _callWithTable('onScaleStart', () {
            luaState.newTable();
            _setNum('focalX', d.focalPoint.dx);
            _setNum('focalY', d.focalPoint.dy);
            _setNum('localFocalX', d.localFocalPoint.dx);
            _setNum('localFocalY', d.localFocalPoint.dy);
            _setNum('pointerCount', d.pointerCount.toDouble());
          })
      : null;

  GestureScaleUpdateCallback? get onScaleUpdate => _hasFn('onScaleUpdate')
      ? (d) => _callWithTable('onScaleUpdate', () {
            luaState.newTable();
            _setNum('focalX', d.focalPoint.dx);
            _setNum('focalY', d.focalPoint.dy);
            _setNum('localFocalX', d.localFocalPoint.dx);
            _setNum('localFocalY', d.localFocalPoint.dy);
            _setNum('scale', d.scale);
            _setNum('horizontalScale', d.horizontalScale);
            _setNum('verticalScale', d.verticalScale);
            _setNum('rotation', d.rotation);
            _setNum('pointerCount', d.pointerCount.toDouble());
            _setNum('dx', d.focalPointDelta.dx);
            _setNum('dy', d.focalPointDelta.dy);
          })
      : null;

  GestureScaleEndCallback? get onScaleEnd => _hasFn('onScaleEnd')
      ? (d) => _callWithTable('onScaleEnd', () {
            luaState.newTable();
            _setNum('velocityDx', d.velocity.pixelsPerSecond.dx);
            _setNum('velocityDy', d.velocity.pixelsPerSecond.dy);
            _setNum('pointerCount', d.pointerCount.toDouble());
          })
      : null;

  // ── Force press ───────────────────────────────────────────────────────────

  void _tableForcePressDetails(String name, ForcePressDetails d) {
    _callWithTable(name, () {
      luaState.newTable();
      _pushPosition(d.localPosition, d.globalPosition);
      _setNum('pressure', d.pressure);
    });
  }

  GestureForcePressStartCallback? get onForcePressStart =>
      _hasFn('onForcePressStart')
          ? (d) => _tableForcePressDetails('onForcePressStart', d)
          : null;

  GestureForcePressPeakCallback? get onForcePressPeak =>
      _hasFn('onForcePressPeak')
          ? (d) => _tableForcePressDetails('onForcePressPeak', d)
          : null;

  GestureForcePressUpdateCallback? get onForcePressUpdate =>
      _hasFn('onForcePressUpdate')
          ? (d) => _tableForcePressDetails('onForcePressUpdate', d)
          : null;

  GestureForcePressEndCallback? get onForcePressEnd =>
      _hasFn('onForcePressEnd')
          ? (d) => _tableForcePressDetails('onForcePressEnd', d)
          : null;
}
