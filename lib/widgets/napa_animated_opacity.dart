import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedOpacity].
/// https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html
///
class NapaAnimatedOpacity extends NapaStatelessWidget {
  double opacity;
  Duration duration;
  Curve curve;
  bool alwaysIncludeSemantics;
  NapaWidget? child;

  NapaAnimatedOpacity({
    required this.opacity,
    required this.duration,
    this.curve = Curves.linear,
    this.alwaysIncludeSemantics = false,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'opacity',
        getValue: (obj) => opacity,
        setValue: (obj, value, customData) => opacity = value,
        clamp: (0.0, 1.0),
      ),
      InspectableProperty<bool>(
        name: 'alwaysIncludeSemantics',
        getValue: (obj) => alwaysIncludeSemantics,
        setValue: (obj, value, customData) => alwaysIncludeSemantics = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'opacity': opacity,
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        'alwaysIncludeSemantics': alwaysIncludeSemantics,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedOpacity';

  @override
  Widget toWidget() => AnimatedOpacity(
    opacity: opacity,
    duration: duration,
    curve: curve,
    alwaysIncludeSemantics: alwaysIncludeSemantics,
    child: child?.toWidget(),
  );

  static NapaAnimatedOpacity? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedOpacity(
      opacity: (data['opacity'] as num).toDouble(),
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      alwaysIncludeSemantics: data['alwaysIncludeSemantics'] ?? false,
      child: NapaWidget.decode(data['child']),
    );
  }
}
