import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedScale].
/// https://api.flutter.dev/flutter/widgets/AnimatedScale-class.html
///
class NapaAnimatedScale extends NapaStatelessWidget {
  double? scale;
  Alignment alignment;
  FilterQuality? filterQuality;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedScale({
    this.scale,
    this.alignment = Alignment.center,
    this.filterQuality,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'scale',
        nullable: true,
        getValue: (obj) => scale,
        setValue: (obj, value, customData) => scale = value,
      ),
      InspectableProperty<Alignment>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<Enum>(
        name: 'filterQuality',
        nullable: true,
        getValue: (obj) => filterQuality,
        setValue: (obj, value, customData) => filterQuality = value,
        values: () => FilterQuality.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        if (scale != null) 'scale': scale,
        'alignment': alignment.toJson(),
        if (filterQuality != null) 'filterQuality': filterQuality!.name,
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedScale';

  @override
  Widget toWidget() => AnimatedScale(
    scale: scale ?? 1.0,
    alignment: alignment,
    filterQuality: filterQuality,
    duration: duration,
    curve: curve,
    child: child?.toWidget(),
  );

  static NapaAnimatedScale? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedScale(
      scale: data['scale']?.toDouble(),
      alignment: decodeAlignment(data['alignment']) ?? Alignment.center,
      filterQuality: data['filterQuality'] != null
          ? decodeFilterQuality(data['filterQuality'])
          : null,
      duration: decodeDuration(data['duration']),
      curve: decodeCurve(data['curve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
