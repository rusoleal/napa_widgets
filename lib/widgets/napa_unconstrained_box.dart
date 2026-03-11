import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [UnconstrainedBox].
/// https://api.flutter.dev/flutter/widgets/UnconstrainedBox-class.html
///
class NapaUnconstrainedBox extends NapaSingleChildRenderObjectWidget {
  AlignmentGeometry alignment;
  Axis? constrainedAxis;
  Clip clipBehavior;

  NapaUnconstrainedBox({
    this.alignment = Alignment.center,
    this.constrainedAxis,
    this.clipBehavior = Clip.none,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<Enum>(
        name: 'constrainedAxis',
        nullable: true,
        getValue: (obj) => constrainedAxis,
        setValue: (obj, value, customData) => constrainedAxis = value,
        values: () => Axis.values,
      ),
      InspectableProperty<Enum>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'alignment': alignment.toJson(),
        if (constrainedAxis != null) 'constrainedAxis': constrainedAxis!.name,
        'clipBehavior': clipBehavior.name,
      });
  }

  @override
  String get widgetName => 'UnconstrainedBox';

  @override
  Widget toWidget() => UnconstrainedBox(
    alignment: alignment,
    constrainedAxis: constrainedAxis,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaUnconstrainedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaUnconstrainedBox(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      constrainedAxis: data['constrainedAxis'] != null
          ? decodeAxis(data['constrainedAxis'])
          : null,
      clipBehavior: decodeClip(data['clipBehavior']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
