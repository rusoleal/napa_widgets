import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [PhysicalModel].
/// https://api.flutter.dev/flutter/widgets/PhysicalModel-class.html
///
class NapaPhysicalModel extends NapaSingleChildRenderObjectWidget {
  BoxShape shape;
  Clip clipBehavior;
  double elevation;
  Color color;
  Color shadowColor;

  NapaPhysicalModel({
    this.shape = BoxShape.rectangle,
    this.clipBehavior = Clip.none,
    this.elevation = 0.0,
    required this.color,
    this.shadowColor = const Color(0xFF000000),
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'shape',
        getValue: (obj) => shape,
        setValue: (obj, value, customData) => shape = value,
        values: () => BoxShape.values,
      ),
      InspectableProperty<Enum>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<double>(
        name: 'elevation',
        getValue: (obj) => elevation,
        setValue: (obj, value, customData) => elevation = value,
        clamp: (0.0, double.infinity),
      ),
      InspectableProperty<Color>(
        name: 'color',
        getValue: (obj) => color,
        setValue: (obj, value, customData) => color = value,
      ),
      InspectableProperty<Color>(
        name: 'shadowColor',
        getValue: (obj) => shadowColor,
        setValue: (obj, value, customData) => shadowColor = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'shape': shape.name,
        'clipBehavior': clipBehavior.name,
        'elevation': elevation,
        'color': color.toJson(),
        'shadowColor': shadowColor.toJson(),
      });
  }

  @override
  String get widgetName => 'PhysicalModel';

  @override
  Widget toWidget() => PhysicalModel(
    shape: shape,
    clipBehavior: clipBehavior,
    elevation: elevation,
    color: color,
    shadowColor: shadowColor,
    child: child?.toWidget(),
  );

  static NapaPhysicalModel? decode(dynamic data) {
    if (data == null) return null;
    return NapaPhysicalModel(
      shape: decodeBoxShape(data['shape']),
      clipBehavior: decodeClip(data['clipBehavior']),
      elevation: (data['elevation'] as num? ?? 0).toDouble(),
      color: decodeColor(data['color'])!,
      shadowColor: decodeColor(data['shadowColor']) ?? const Color(0xFF000000),
      child: NapaWidget.decode(data['child']),
    );
  }
}
