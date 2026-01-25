import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_multi_child_render_object_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [Wrap].
/// https://api.flutter.dev/flutter/widgets/Wrap-class.html
///
class NapaWrap extends NapaMultiChildRenderObjectWidget {
  WrapAlignment alignment;
  Clip clipBehavior;
  WrapCrossAlignment crossAxisAlignment;
  Axis direction;
  WrapAlignment runAlignment;
  double runSpacing;
  double spacing;
  TextDirection? textDirection;
  VerticalDirection verticalDirection;

  NapaWrap({
    this.alignment = .start,
    this.clipBehavior = .none,
    this.crossAxisAlignment = .start,
    this.direction = .horizontal,
    this.runAlignment = .start,
    this.runSpacing = 0.0,
    this.spacing = 0.0,
    this.textDirection,
    this.verticalDirection = .down,
    super.children,
  }) {
    properties.addAll([
      InspectableProperty<WrapAlignment>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
        values: () => WrapAlignment.values,
      ),
      InspectableProperty<Clip>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<WrapCrossAlignment>(
        name: 'crossAxisAlignment',
        getValue: (obj) => crossAxisAlignment,
        setValue: (obj, value, customData) => crossAxisAlignment = value,
        values: () => WrapCrossAlignment.values,
      ),
      InspectableProperty<Axis>(
        name: 'direction',
        getValue: (obj) => direction,
        setValue: (obj, value, customData) => direction = value,
        values: () => Axis.values,
      ),
      InspectableProperty<WrapAlignment>(
        name: 'runAlignment',
        getValue: (obj) => runAlignment,
        setValue: (obj, value, customData) => runAlignment = value,
        values: () => WrapAlignment.values,
      ),
      InspectableProperty<double>(
        name: 'runSpacing',
        getValue: (obj) => runSpacing,
        setValue: (obj, value, customData) => runSpacing = value,
      ),
      InspectableProperty<double>(
        name: 'spacing',
        getValue: (obj) => spacing,
        setValue: (obj, value, customData) => spacing = value,
      ),
      InspectableProperty<TextDirection>(
        name: 'textDirection',
        nullable: true,
        getValue: (obj) => textDirection,
        setValue: (obj, value, customData) => textDirection = value,
        values: () => TextDirection.values,
      ),
      InspectableProperty<VerticalDirection>(
        name: 'verticalDirection',
        getValue: (obj) => verticalDirection,
        setValue: (obj, value, customData) => verticalDirection = value,
        values: () => VerticalDirection.values,
      ),
    ]);
  }

  @override
  toJson() {
    return <String, dynamic>{
      'alignment': alignment.name,
      'clipBehavior': clipBehavior.name,
      'crossAxisAlignment': crossAxisAlignment.name,
      'direction': direction.name,
      'runAlignment': runAlignment.name,
      'runSpacing': runSpacing,
      'spacing': spacing,
      if (textDirection != null) 'textDirection': textDirection?.name,
      'verticalDirection': verticalDirection.name,
    }..addAll(super.toJson());
  }

  @override
  String get widgetName => 'Wrap';

  @override
  Widget toWidget() => Wrap(
    alignment: alignment,
    clipBehavior: clipBehavior,
    crossAxisAlignment: crossAxisAlignment,
    direction: direction,
    runAlignment: runAlignment,
    runSpacing: runSpacing,
    spacing: spacing,
    textDirection: textDirection,
    verticalDirection: verticalDirection,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaWrap? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaWrap(
      alignment: decodeWrapAlignment(data['alignment']),
      clipBehavior: decodeClip(data['clipBehavior']),
      crossAxisAlignment: decodeWrapCrossAlignment(data['crossAxisAlignment']),
      direction: decodeAxis(data['direction']),
      runAlignment: decodeWrapAlignment(data['runAlignment']),
      runSpacing: data['runSpacing'],
      spacing: data['spacing'],
      textDirection: decodeTextDirection(data['textDirection']),
      verticalDirection: decodeVerticalDirection(data['verticalDirection']),
      children: decodeChildren(data['children'])
    );
  }
}
