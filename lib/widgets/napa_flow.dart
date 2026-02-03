
import 'package:flutter/widgets.dart';
import 'package:lua_dardo_plus/lua.dart';
import 'package:napa_widgets/napa_widgets.dart';

import '../scripting/lua/lua_drawing_lib.dart';
import '../scripting/napa_script_type.dart';

/// Wrapper class for [Flow].
/// https://api.flutter.dev/flutter/widgets/Flow-class.html
///
class NapaFlow extends NapaMultiChildRenderObjectWidget {

  Clip clipBehavior;
  NapaFlowDelegate delegate;

  NapaFlow({
    required this.delegate,
    this.clipBehavior = .hardEdge,
    super.children
  });

  @override
  toJson() {
    return super.toJson()..addAll(<String,dynamic>{
      'delegate': delegate.toJson(),
      'clipBehavior': clipBehavior.name
    });
  }

  @override
  String get widgetName => 'Flow';

  @override
  Widget toWidget() {
    return Flow(
      delegate: _FlowDelegate(delegate),
      children: children.map((e) => e.toWidget(),).toList(),
    );
  }

  static NapaFlow? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaFlow(
      delegate: NapaFlowDelegate.decode(data['delegate'])!,
      clipBehavior: decodeClip(data['clipBehavior'])
    );
  }

}
/// Wrapper for [FlowDelegate]
///
/// Method getConstraintsForChild:
/// dart signature: BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints)
/// lua signature: function getConstraintsForChild(i, constraints)
///
/// Method getSize:
/// dart signature: Size getSize(BoxConstraints constraints)
/// lua signature: function getSize(constraints)
///
/// Method paintChildren:
/// dart signature: void paintChildren(FlowPaintingContext context)
/// lua signature: function paintChildren(context)
///
class NapaFlowDelegate {
  NapaScriptType scriptType;
  String script;
  late LuaState luaState;

  NapaFlowDelegate({this.scriptType=.lua, this.script = ''}) {
    // init a new LuaState
    luaState = LuaState.newState();
    luaState.openLibs();

    // load drawing lib
    luaState.requireF('drawing', LuaDrawingLib.openDrawingLib, true);
    luaState.pop(1);

    luaState.loadString(script);
    luaState.call(0, 0);

  }

  dynamic toJson() {
    return <String,dynamic>{
      'scriptType':scriptType.name,
      'script': script
    };
  }

  static NapaFlowDelegate? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaFlowDelegate(
        scriptType: decodeNapaScriptType(data['scriptType']),
        script: data['script']
    );
  }
}

class _FlowDelegate extends FlowDelegate {

  NapaFlowDelegate napaFlowDelegate;

  _FlowDelegate(this.napaFlowDelegate);

  @override
  void paintChildren(FlowPaintingContext context) {
    //for (int a=0; a<context.childCount; a++) {
    //  context.paintChild(a);
    //}

    // call paintChildren script.
    final luaState = napaFlowDelegate.luaState;

    // try to call paintChildren method
    LuaType t = luaState.getGlobal('paintChildren');
    if (t == LuaType.luaFunction) {

      // add context parameter
      var sizeData = luaState.newUserdata();
      sizeData.data = context;
      //luaState.getMetatableAux('MTSize');
      //luaState.setMetatable(-2);

      //luaState.pushString('canvas');
      var status = luaState.pCall(1, 0, 0);
      if (status != ThreadStatus.luaOk) {
        String? exception = luaState.checkString(1);
        luaState.pop(1);
        print('paintChildren: $exception');
      }
    } else {
      luaState.pop(1);
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
  
}
