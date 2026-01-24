import 'napa_render_object_widget.dart';
import 'napa_widget.dart';

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
