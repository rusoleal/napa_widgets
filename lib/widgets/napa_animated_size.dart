import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedSize].
/// https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html
///
class NapaAnimatedSize extends NapaStatelessWidget {
  AlignmentGeometry alignment;
  Duration duration;
  Duration? reverseDuration;
  Curve curve;
  Clip clipBehavior;
  NapaWidget? child;

  NapaAnimatedSize({
    this.alignment = Alignment.center,
    required this.duration,
    this.reverseDuration,
    this.curve = Curves.linear,
    this.clipBehavior = Clip.hardEdge,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
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
        'duration': duration.toJson(),
        if (reverseDuration != null) 'reverseDuration': reverseDuration!.toJson(),
        'curve': curve.toJson(),
        'clipBehavior': clipBehavior.name,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedSize';

  @override
  Widget toWidget() => AnimatedSize(
    alignment: alignment,
    duration: duration,
    reverseDuration: reverseDuration,
    curve: curve,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaAnimatedSize? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedSize(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      duration: decodeDuration(data['duration']),
      reverseDuration: data['reverseDuration'] != null
          ? decodeDuration(data['reverseDuration'])
          : null,
      curve: decodeCurve(data['curve']),
      clipBehavior: decodeClip(data['clipBehavior']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
