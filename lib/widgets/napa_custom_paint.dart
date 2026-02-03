import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:lua_dardo_plus/lua.dart';
import 'package:napa_widgets/scripting/napa_script_type.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';

import '../scripting/lua/lua_drawing_lib.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [CustomPaint].
/// https://api.flutter.dev/flutter/widgets/CustomPaint-class.html
///
class NapaCustomPaint extends NapaSingleChildRenderObjectWidget {
  NapaCustomPainter? painter;
  NapaCustomPainter? foregroundPainter;
  Size size;
  bool isComplex;
  bool willChange;

  NapaCustomPaint({
    this.painter,
    this.foregroundPainter,
    this.size = Size.zero,
    this.isComplex = false,
    this.willChange = false,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'width',
        getValue: (Inspectable obj) => size.width,
        setValue: (obj, value, customData) => size = Size(value, size.height),
      ),
      InspectableProperty<double>(
        name: 'height',
        getValue: (Inspectable obj) => size.height,
        setValue: (obj, value, customData) => size = Size(size.width, value),
      ),
      InspectableProperty<bool>(
        name: 'isComplex',
        getValue: (Inspectable obj) => isComplex,
        setValue: (obj, value, customData) => isComplex = value,
      ),
      InspectableProperty<bool>(
        name: 'willChange',
        getValue: (Inspectable obj) => willChange,
        setValue: (obj, value, customData) => willChange = value,
      ),
      InspectableProperty<NapaCustomPainter>(
        name: 'painter',
        nullable: true,
        getValue: (Inspectable obj) => painter,
        setValue: (obj, value, customData) => painter = value,
      ),
      InspectableProperty<NapaCustomPainter>(
        name: 'foregroundPainter',
        nullable: true,
        getValue: (Inspectable obj) => foregroundPainter,
        setValue: (obj, value, customData) => foregroundPainter = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll({
      if (painter != null) 'painter': painter!.toJson(),
      if (foregroundPainter != null)
        'foregroundPainter': foregroundPainter!.toJson(),
      'size': size.toJson(),
      'isComplex': isComplex,
      'willChange': willChange,
    });
  }

  @override
  String get widgetName => 'CustomPaint';

  @override
  Widget toWidget() => CustomPaint(
    painter: painter?.getPainter(),
    foregroundPainter: foregroundPainter?.getPainter(),
    size: size,
    isComplex: isComplex,
    willChange: willChange,
    child: child?.toWidget(),
  );

  static NapaCustomPaint? decode(dynamic data) {
    if (data == null) {
      return data;
    }

    return NapaCustomPaint(
      painter: NapaCustomPainter.decode(data['painter']),
      foregroundPainter: NapaCustomPainter.decode('foregroundPainter'),
      isComplex: data['isComplex'],
      willChange: data['willChange'],
      size: decodeSize(data['size'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}

class NapaCustomPainter {
  NapaScriptType scriptType;
  String script;
  late LuaState luaState;

  NapaCustomPainter({this.scriptType = .lua, this.script = ''}) {

    // init a new LuaState
    luaState = LuaState.newState();
    luaState.openLibs();

    // load drawing lib
    luaState.requireF('drawing', LuaDrawingLib.openDrawingLib, true);
    luaState.pop(1);

    luaState.loadString(script);
    luaState.call(0, 0);

  }

  CustomPainter getPainter() => _InternalPainter(this);

  dynamic toJson() {
    return <String, dynamic>{'scriptType': scriptType.name, 'script': script};
  }

  static NapaCustomPainter? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaCustomPainter(
      scriptType: decodeNapaScriptType(data['scriptType']),
      script: data['script']
    );
  }
}

class _InternalPainter extends CustomPainter {

  NapaCustomPainter napaPainter;

  _InternalPainter(this.napaPainter);

  @override
  void paint(Canvas canvas, Size size) {

    final luaState = napaPainter.luaState;

    // try to call scene render script
    LuaType t = luaState.getGlobal('paint');
    if (t == LuaType.luaFunction) {

      // add canvas parameter
      var canvasData = luaState.newUserdata();
      canvasData.data = canvas;
      luaState.getMetatableAux('MTCanvas');
      luaState.setMetatable(-2);

      // add size parameter
      var sizeData = luaState.newUserdata();
      sizeData.data = size;
      luaState.getMetatableAux('MTSize');
      luaState.setMetatable(-2);

      //luaState.pushString('canvas');
      var status = luaState.pCall(2, 0, 0);
      if (status != ThreadStatus.luaOk) {
        String? exception = luaState.checkString(1);
        luaState.pop(1);
        print('paint: $exception');
      }
    } else {
      luaState.pop(1);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
