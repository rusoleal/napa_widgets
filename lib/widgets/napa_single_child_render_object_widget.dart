import 'package:flutter/widgets.dart';
import 'napa_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [SingleChildRenderObjectWidget].
/// https://api.flutter.dev/flutter/widgets/SingleChildRenderObjectWidget-class.html
///
abstract class NapaSingleChildRenderObjectWidget
    extends NapaRenderObjectWidget {
  NapaWidget? child;

  NapaSingleChildRenderObjectWidget({this.child})
    : super(childMode: NapaChildMode.singleChild);

  @override
  toJson() {
    return super.toJson()
      ..addAll({if (child != null) 'child': child?.toJson()});
  }

  @override
  String get widgetName => 'SingleChildRenderObjectWidget';
}
