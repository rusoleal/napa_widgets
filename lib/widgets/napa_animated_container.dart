import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_matrix4.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedContainer].
/// https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html
///
class NapaAnimatedContainer extends NapaStatelessWidget {
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  Color? color;
  double? width;
  double? height;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  NapaMatrix4Compose? transform;
  AlignmentGeometry? transformAlignment;
  Clip clipBehavior;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedContainer({
    this.alignment,
    this.padding,
    this.color,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        nullable: true,
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'padding',
        nullable: true,
        getValue: (obj) => padding,
        setValue: (obj, value, customData) => padding = value,
      ),
      InspectableProperty<Color>(
        name: 'color',
        nullable: true,
        getValue: (obj) => color,
        setValue: (obj, value, customData) => color = value,
      ),
      InspectableProperty<double>(
        name: 'width',
        nullable: true,
        getValue: (obj) => width,
        setValue: (obj, value, customData) => width = value,
      ),
      InspectableProperty<double>(
        name: 'height',
        nullable: true,
        getValue: (obj) => height,
        setValue: (obj, value, customData) => height = value,
      ),
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'margin',
        nullable: true,
        getValue: (obj) => margin,
        setValue: (obj, value, customData) => margin = value,
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
        if (alignment != null) 'alignment': alignment!.toJson(),
        if (padding != null) 'padding': padding!.toJson(),
        if (color != null) 'color': color!.toJson(),
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        if (constraints != null) 'constraints': constraints!.toJson(),
        if (margin != null) 'margin': margin!.toJson(),
        if (transform != null) 'transform': transform!.toJson(),
        if (transformAlignment != null)
          'transformAlignment': transformAlignment!.toJson(),
        'clipBehavior': clipBehavior.name,
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedContainer';

  @override
  Widget toWidget() => AnimatedContainer(
    alignment: alignment,
    padding: padding,
    color: color,
    width: width,
    height: height,
    constraints: constraints,
    margin: margin,
    transform: transform?.matrix,
    transformAlignment: transformAlignment,
    clipBehavior: clipBehavior,
    duration: duration,
    curve: curve,
    child: child?.toWidget(),
  );

  static NapaAnimatedContainer? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedContainer(
      alignment: decodeAlignmentGeometry(data['alignment']),
      padding: decodeEdgeInsetsGeometry(data['padding']),
      color: decodeColor(data['color']),
      width: (data['width'] as num?)?.toDouble(),
      height: (data['height'] as num?)?.toDouble(),
      constraints: decodeBoxConstraints(data['constraints']),
      margin: decodeEdgeInsetsGeometry(data['margin']),
      transform: NapaMatrix4Compose.decode(data['transform']),
      transformAlignment: decodeAlignmentGeometry(data['transformAlignment']),
      clipBehavior: decodeClip(data['clipBehavior']),
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
