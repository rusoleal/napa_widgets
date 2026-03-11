import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedRotation].
/// https://api.flutter.dev/flutter/widgets/AnimatedRotation-class.html
///
class NapaAnimatedRotation extends NapaStatelessWidget {
  double turns;
  Alignment alignment;
  FilterQuality? filterQuality;
  Duration duration;
  Curve curve;
  NapaWidget? child;

  NapaAnimatedRotation({
    required this.turns,
    this.alignment = Alignment.center,
    this.filterQuality,
    required this.duration,
    this.curve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'turns',
        getValue: (obj) => turns,
        setValue: (obj, value, customData) => turns = value,
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
        'turns': turns,
        'alignment': alignment.toJson(),
        if (filterQuality != null) 'filterQuality': filterQuality!.name,
        'duration': duration.toJson(),
        'curve': curve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedRotation';

  @override
  Widget toWidget() => AnimatedRotation(
    turns: turns,
    alignment: alignment,
    filterQuality: filterQuality,
    duration: duration,
    curve: curve,
    child: child?.toWidget(),
  );

  static NapaAnimatedRotation? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedRotation(
      turns: (data['turns'] as num).toDouble(),
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
