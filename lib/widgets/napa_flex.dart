import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_multi_child_render_object_widget.dart';
import 'tojson_extensions.dart';

class NapaFlex extends NapaMultiChildRenderObjectWidget {
  Clip clipBehavior;
  CrossAxisAlignment crossAxisAlignment;
  Axis direction;
  MainAxisAlignment mainAxisAlignment;
  MainAxisSize mainAxisSize;
  double spacing;
  TextBaseline? textBaseline;
  TextDirection? textDirection;
  VerticalDirection verticalDirection;

  NapaFlex({
    this.clipBehavior = Clip.none,
    this.crossAxisAlignment = .center,
    required this.direction,
    this.mainAxisAlignment = .start,
    this.mainAxisSize = .max,
    this.spacing = 0.0,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = .down,
    super.children,
  }) {
    properties.addAll([
      InspectableProperty<Clip>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<CrossAxisAlignment>(
        name: 'crossAxisAlignment',
        getValue: (obj) => crossAxisAlignment,
        setValue: (obj, value, customData) => crossAxisAlignment = value,
        values: () => CrossAxisAlignment.values,
      ),
      InspectableProperty<Axis>(
        name: 'direction',
        getValue: (obj) => direction,
        setValue: (obj, value, customData) => direction = value,
        values: () => Axis.values,
      ),
      InspectableProperty<MainAxisAlignment>(
        name: 'mainAxisAlignment',
        getValue: (obj) => mainAxisAlignment,
        setValue: (obj, value, customData) => mainAxisAlignment = value,
        values: () => MainAxisAlignment.values,
      ),
      InspectableProperty<MainAxisSize>(
        name: 'mainAxisSize',
        getValue: (obj) => mainAxisSize,
        setValue: (obj, value, customData) => mainAxisSize = value,
        values: () => MainAxisSize.values,
      ),
      InspectableProperty<double>(
        name: 'spacing',
        getValue: (obj) => spacing,
        setValue: (obj, value, customData) => spacing = value,
      ),
      InspectableProperty<TextBaseline>(
        name: 'textBaseline',
        nullable: true,
        getValue: (obj) => textBaseline,
        setValue: (obj, value, customData) => textBaseline = value,
        values: () => TextBaseline.values,
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
      'clipBehavior': clipBehavior.name,
      'crossAxisAlignment': crossAxisAlignment.name,
      'direction': direction.name,
      'mainAxisAlignment': mainAxisAlignment.name,
      'mainAxisSize': mainAxisSize.name,
      'spacing': spacing,
      if (textBaseline != null) 'textBaseline': textBaseline!.name,
      if (textDirection != null) 'textDirection': textDirection!.name,
      'verticalDirection': verticalDirection.name,
    }..addAll(super.toJson());
  }

  @override
  String get widgetName => 'Flex';

  @override
  Widget toWidget() => Flex(
    clipBehavior: clipBehavior,
    crossAxisAlignment: crossAxisAlignment,
    direction: direction,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    spacing: spacing,
    textBaseline: textBaseline,
    textDirection: textDirection,
    verticalDirection: verticalDirection,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaFlex? decode(dynamic data) {
    return NapaFlex(
      clipBehavior: decodeClip(data['clipBehavior']),
      crossAxisAlignment: decodeCrossAxisAlignment(data['crossAxisAlignment']),
      direction: decodeAxis(data['direction']),
      mainAxisAlignment: decodeMainAxisAlignment(data['mainAxisAlignment']),
      mainAxisSize: decodeMainAxisSize(data['mainAxisSize']),
      spacing: data['spacing'],
      textBaseline: decodeTextBaseline(data['textBaseline']),
      textDirection: decodeTextDirection(data['textDirection']),
      verticalDirection: decodeVerticalDirection(data['verticalDirection']),
      children: decodeChildren(data['children'])
    );
  }
}
