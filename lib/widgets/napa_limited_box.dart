import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [LimitedBox].
/// https://api.flutter.dev/flutter/widgets/LimitedBox-class.html
///
class NapaLimitedBox extends NapaSingleChildRenderObjectWidget {
  double maxWidth;
  double maxHeight;

  NapaLimitedBox({
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'maxWidth',
        getValue: (obj) => maxWidth,
        setValue: (obj, value, customData) => maxWidth = value,
      ),
      InspectableProperty<double>(
        name: 'maxHeight',
        getValue: (obj) => maxHeight,
        setValue: (obj, value, customData) => maxHeight = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'maxWidth': maxWidth,
        'maxHeight': maxHeight,
      });
  }

  @override
  String get widgetName => 'LimitedBox';

  @override
  Widget toWidget() => LimitedBox(
    maxWidth: maxWidth,
    maxHeight: maxHeight,
    child: child?.toWidget(),
  );

  static NapaLimitedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaLimitedBox(
      maxWidth: (data['maxWidth'] as num).toDouble(),
      maxHeight: (data['maxHeight'] as num).toDouble(),
      child: NapaWidget.decode(data['child']),
    );
  }
}
