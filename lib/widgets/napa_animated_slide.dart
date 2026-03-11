import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedSlide].
/// https://api.flutter.dev/flutter/widgets/AnimatedSlide-class.html
///
class NapaAnimatedSlide extends NapaStatelessWidget {
  Offset offset;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedSlide({
    required this.offset,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'offsetDx',
        getValue: (obj) => offset.dx,
        setValue: (obj, value, customData) => offset = Offset(value, offset.dy),
      ),
      InspectableProperty<double>(
        name: 'offsetDy',
        getValue: (obj) => offset.dy,
        setValue: (obj, value, customData) => offset = Offset(offset.dx, value),
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'offset': offset.toJson(),
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedSlide';

  @override
  Widget toWidget() => AnimatedSlide(
    offset: offset,
    duration: duration,
    curve: curve,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaAnimatedSlide? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedSlide(
      offset: decodeOffset(data['offset'])!,
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
