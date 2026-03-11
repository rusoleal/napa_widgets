import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [IntrinsicWidth].
/// https://api.flutter.dev/flutter/widgets/IntrinsicWidth-class.html
///
class NapaIntrinsicWidth extends NapaSingleChildRenderObjectWidget {
  double? stepWidth;
  double? stepHeight;

  NapaIntrinsicWidth({this.stepWidth, this.stepHeight, super.child}) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'stepWidth',
        nullable: true,
        getValue: (obj) => stepWidth,
        setValue: (obj, value, customData) => stepWidth = value,
      ),
      InspectableProperty<double>(
        name: 'stepHeight',
        nullable: true,
        getValue: (obj) => stepHeight,
        setValue: (obj, value, customData) => stepHeight = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        if (stepWidth != null) 'stepWidth': stepWidth,
        if (stepHeight != null) 'stepHeight': stepHeight,
      });
  }

  @override
  String get widgetName => 'IntrinsicWidth';

  @override
  Widget toWidget() => IntrinsicWidth(
    stepWidth: stepWidth,
    stepHeight: stepHeight,
    child: child?.toWidget(),
  );

  static NapaIntrinsicWidth? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaIntrinsicWidth(
      stepWidth: data['stepWidth']?.toDouble(),
      stepHeight: data['stepHeight']?.toDouble(),
      child: NapaWidget.decode(data['child']),
    );
  }
}
