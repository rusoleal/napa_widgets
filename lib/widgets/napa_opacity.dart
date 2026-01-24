import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaOpacity extends NapaSingleChildRenderObjectWidget {
  bool alwaysIncludeSemantics;
  double opacity;

  NapaOpacity({
    super.child,
    required this.opacity,
    this.alwaysIncludeSemantics = false,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'opacity',
        getValue: (obj) => opacity,
        setValue: (obj, value, customData) => opacity = value,
        clamp: (0.0, 1.0),
      ),
      InspectableProperty<bool>(
        name: 'alwaysIncludeSemantics',
        getValue: (obj) => alwaysIncludeSemantics,
        setValue: (obj, value, customData) => alwaysIncludeSemantics = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll({
      'opacity': opacity,
      'alwaysIncludeSemantics': alwaysIncludeSemantics,
    });
  }

  @override
  String get widgetName => 'Opacity';

  @override
  String toString() => '$widgetName(${(opacity * 100).toInt()}%)';

  @override
  Widget toWidget() => Opacity(
    alwaysIncludeSemantics: alwaysIncludeSemantics,
    opacity: opacity,
    child: child?.toWidget(),
  );

  static NapaOpacity? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaOpacity(
      opacity: data['opacity'],
      alwaysIncludeSemantics: data['alwaysIncludeSemantics'],
      child: NapaWidget.decode(data['child'])
    );
  }
}
