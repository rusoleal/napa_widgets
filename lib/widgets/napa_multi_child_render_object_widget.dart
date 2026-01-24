import 'napa_render_object_widget.dart';
import 'napa_widget.dart';

abstract class NapaMultiChildRenderObjectWidget extends NapaRenderObjectWidget {
  List<NapaWidget> children;

  NapaMultiChildRenderObjectWidget({List<NapaWidget>? children})
    : children = children ?? [],
      super(childMode: NapaChildMode.multiChild);

  @override
  dynamic toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      'children': children.map((e) => e.toJson()).toList(),
    });
  }

  @override
  String get widgetName => 'MultiChildRenderObjectWidget';
}
