import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedAlign].
/// https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html
///
class NapaAnimatedAlign extends NapaStatelessWidget {
  AlignmentGeometry alignment;
  double? widthFactor;
  double? heightFactor;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedAlign({
    this.alignment = Alignment.center,
    this.widthFactor,
    this.heightFactor,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<double>(
        name: 'widthFactor',
        nullable: true,
        getValue: (obj) => widthFactor,
        setValue: (obj, value, customData) => widthFactor = value,
      ),
      InspectableProperty<double>(
        name: 'heightFactor',
        nullable: true,
        getValue: (obj) => heightFactor,
        setValue: (obj, value, customData) => heightFactor = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'alignment': alignment.toJson(),
        if (widthFactor != null) 'widthFactor': widthFactor,
        if (heightFactor != null) 'heightFactor': heightFactor,
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedAlign';

  @override
  Widget toWidget() => AnimatedAlign(
    alignment: alignment,
    widthFactor: widthFactor,
    heightFactor: heightFactor,
    duration: duration,
    curve: curve,
    child: child?.toWidget(),
  );

  static NapaAnimatedAlign? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedAlign(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      widthFactor: data['widthFactor']?.toDouble(),
      heightFactor: data['heightFactor']?.toDouble(),
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
