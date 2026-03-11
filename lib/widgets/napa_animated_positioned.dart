import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedPositioned].
/// https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html
///
/// Must be a direct child of a [Stack].
///
class NapaAnimatedPositioned extends NapaStatelessWidget {
  double? left;
  double? top;
  double? right;
  double? bottom;
  double? width;
  double? height;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedPositioned({
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<double>(name: 'left', nullable: true, getValue: (obj) => left, setValue: (obj, v, _) => left = v),
      InspectableProperty<double>(name: 'top', nullable: true, getValue: (obj) => top, setValue: (obj, v, _) => top = v),
      InspectableProperty<double>(name: 'right', nullable: true, getValue: (obj) => right, setValue: (obj, v, _) => right = v),
      InspectableProperty<double>(name: 'bottom', nullable: true, getValue: (obj) => bottom, setValue: (obj, v, _) => bottom = v),
      InspectableProperty<double>(name: 'width', nullable: true, getValue: (obj) => width, setValue: (obj, v, _) => width = v),
      InspectableProperty<double>(name: 'height', nullable: true, getValue: (obj) => height, setValue: (obj, v, _) => height = v),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        if (left != null) 'left': left,
        if (top != null) 'top': top,
        if (right != null) 'right': right,
        if (bottom != null) 'bottom': bottom,
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedPositioned';

  @override
  Widget toWidget() => AnimatedPositioned(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    width: width,
    height: height,
    duration: duration,
    curve: curve,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaAnimatedPositioned? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedPositioned(
      left: data['left']?.toDouble(),
      top: data['top']?.toDouble(),
      right: data['right']?.toDouble(),
      bottom: data['bottom']?.toDouble(),
      width: data['width']?.toDouble(),
      height: data['height']?.toDouble(),
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
