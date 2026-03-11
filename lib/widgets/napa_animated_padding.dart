import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedPadding].
/// https://api.flutter.dev/flutter/widgets/AnimatedPadding-class.html
///
class NapaAnimatedPadding extends NapaStatelessWidget {
  EdgeInsetsGeometry padding;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedPadding({
    required this.padding,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'padding',
        getValue: (obj) => padding,
        setValue: (obj, value, customData) => padding = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'padding': padding.toJson(),
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedPadding';

  @override
  Widget toWidget() => AnimatedPadding(
    padding: padding,
    duration: duration,
    curve: curve,
    child: child?.toWidget(),
  );

  static NapaAnimatedPadding? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedPadding(
      padding: decodeEdgeInsetsGeometry(data['padding'])!,
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
