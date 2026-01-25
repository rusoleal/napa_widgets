import 'package:flutter/material.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_matrix4.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [Container].
/// https://api.flutter.dev/flutter/widgets/Container-class.html
///
class NapaContainer extends NapaStatelessWidget {
  AlignmentGeometry? alignment;
  NapaWidget? child;
  Clip clipBehavior;
  Color? color;
  BoxConstraints? constraints;
  Decoration? decoration;
  Decoration? foregroundDecoration;
  double? width;
  double? height;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  NapaMatrix4Compose? transform;
  AlignmentGeometry? transformAlignment;

  NapaContainer({
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        nullable: true,
        getValue: (Inspectable obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'padding',
        nullable: true,
        getValue: (Inspectable obj) => padding,
        setValue: (obj, value, customData) => padding = value,
      ),
      InspectableProperty<Color>(
        name: 'color',
        nullable: true,
        getValue: (Inspectable obj) => color,
        setValue: (obj, value, customData) => color = value,
      ),
      InspectableProperty<Clip>(
        name: 'clipBehavior',
        getValue: (Inspectable obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<double>(
        name: 'width',
        nullable: true,
        getValue: (Inspectable obj) => width,
        setValue: (obj, value, customData) => width = value,
      ),
      InspectableProperty<double>(
        name: 'height',
        nullable: true,
        getValue: (Inspectable obj) => height,
        setValue: (obj, value, customData) => height = value,
      ),
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'margin',
        nullable: true,
        getValue: (Inspectable obj) => margin,
        setValue: (obj, value, customData) => margin = value,
      ),
      InspectableProperty<NapaMatrix4Compose>(
        name: 'transform',
        nullable: true,
        getValue: (Inspectable obj) => transform,
        setValue: (obj, value, customData) => transform = value,
      ),
      InspectableProperty<AlignmentGeometry>(
        name: 'transformAlignment',
        nullable: true,
        getValue: (Inspectable obj) => transformAlignment,
        setValue: (obj, value, customData) => transformAlignment = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      if (alignment != null) 'alignment': alignment!.toJson(),
      if (padding != null) 'padding': padding!.toJson(),
      if (color != null) 'color': color!.toJson(),
      if (decoration != null) 'decoration': decoration!.toJson(),
      if (foregroundDecoration != null)
        'foregroundDecoration': foregroundDecoration!.toJson(),
      if (width != null) 'width': width!,
      if (height != null) 'height': height!,
      if (constraints != null) 'constraints': constraints!.toJson(),
      if (margin != null) 'margin': margin!.toJson(),
      if (transform != null) 'transform': transform!.toJson(),
      if (transformAlignment != null)
        'transformAlignment': transformAlignment!.toJson(),
      'clipBehavior': clipBehavior.name,
      if (child != null) 'child': child!.toJson(),
    });
  }

  @override
  String get widgetName => 'Container';

  @override
  Widget toWidget() => Container(
    alignment: alignment,
    padding: padding,
    color: color,
    decoration: decoration,
    foregroundDecoration: foregroundDecoration,
    width: width,
    height: height,
    constraints: constraints,
    margin: margin,
    transform: transform?.matrix,
    transformAlignment: transformAlignment,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaContainer? decode(dynamic data) {
    AlignmentGeometry? alignment = decodeAlignmentGeometry(data['alignment']);
    EdgeInsetsGeometry? padding;
    Color? color = decodeColor(data['color']);
    Decoration? decoration = decodeDecoration(data['decoration']);
    Decoration? foregroundDecoration = decodeDecoration(
      data['foregroundDecoration'],
    );
    double? width = data['width'];
    double? height = data['height'];
    BoxConstraints? constraints;
    EdgeInsetsGeometry? margin;
    NapaMatrix4Compose? transform = NapaMatrix4Compose.decode(
      data['transform'],
    );
    AlignmentGeometry? transformAlignment = decodeAlignmentGeometry(
      data['transformAlignment'],
    );
    Clip clipBehavior = decodeClip(data['clipBehavior']);
    NapaWidget? child = NapaWidget.decode(data['child']);

    return NapaContainer(
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}
