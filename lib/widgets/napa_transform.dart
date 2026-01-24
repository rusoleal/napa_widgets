import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_matrix4.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaTransform extends NapaSingleChildRenderObjectWidget {
  NapaMatrix4Compose transform;

  NapaTransform({required this.transform, super.child}) {
    properties.addAll([
      InspectableProperty<NapaMatrix4Compose>(
        name: 'transform',
        getValue: (Inspectable obj) => transform,
        setValue: (obj, value, customData) => transform = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll({'transform': transform.toJson()});
  }

  @override
  String get widgetName => 'Transform';

  @override
  Widget toWidget() =>
      Transform(transform: transform.matrix, child: child?.toWidget());

  static NapaTransform? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaTransform(
      transform: NapaMatrix4Compose.decode(data['transform'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}
