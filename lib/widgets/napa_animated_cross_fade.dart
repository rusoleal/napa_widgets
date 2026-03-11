import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedCrossFade].
/// https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html
///
class NapaAnimatedCrossFade extends NapaStatelessWidget {
  NapaWidget? firstChild;
  NapaWidget? secondChild;
  CrossFadeState crossFadeState;
  Duration duration;
  Duration? reverseDuration;
  Curve firstCurve;
  Curve secondCurve;
  Curve sizeCurve;
  AlignmentGeometry alignment;

  NapaAnimatedCrossFade({
    this.firstChild,
    this.secondChild,
    this.crossFadeState = CrossFadeState.showFirst,
    required this.duration,
    this.reverseDuration,
    this.firstCurve = Curves.linear,
    this.secondCurve = Curves.linear,
    this.sizeCurve = Curves.linear,
    this.alignment = Alignment.topCenter,
  }) : super(childMode: NapaChildMode.noChildren) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'crossFadeState',
        getValue: (obj) => crossFadeState,
        setValue: (obj, value, customData) => crossFadeState = value as CrossFadeState,
        values: () => CrossFadeState.values,
      ),
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        if (firstChild != null) 'firstChild': firstChild!.toJson(),
        if (secondChild != null) 'secondChild': secondChild!.toJson(),
        'crossFadeState': crossFadeState.name,
        'duration': duration.toJson(),
        if (reverseDuration != null) 'reverseDuration': reverseDuration!.toJson(),
        'firstCurve': firstCurve.toJson(),
        'secondCurve': secondCurve.toJson(),
        'sizeCurve': sizeCurve.toJson(),
        'alignment': alignment.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedCrossFade';

  @override
  Widget toWidget() => AnimatedCrossFade(
    firstChild: firstChild?.toWidget() ?? const SizedBox.shrink(),
    secondChild: secondChild?.toWidget() ?? const SizedBox.shrink(),
    crossFadeState: crossFadeState,
    duration: duration,
    reverseDuration: reverseDuration,
    firstCurve: firstCurve,
    secondCurve: secondCurve,
    sizeCurve: sizeCurve,
    alignment: alignment,
  );

  static NapaAnimatedCrossFade? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedCrossFade(
      firstChild: NapaWidget.decode(data['firstChild']),
      secondChild: NapaWidget.decode(data['secondChild']),
      crossFadeState: CrossFadeState.values.firstWhere(
        (e) => e.name == data['crossFadeState'],
        orElse: () => CrossFadeState.showFirst,
      ),
      duration: decodeDuration(data['duration']),
      reverseDuration: data['reverseDuration'] != null
          ? decodeDuration(data['reverseDuration'])
          : null,
      firstCurve: decodeCurve(data['firstCurve']),
      secondCurve: decodeCurve(data['secondCurve']),
      sizeCurve: decodeCurve(data['sizeCurve']),
      alignment: decodeAlignmentGeometry(data['alignment']) ?? Alignment.topCenter,
    );
  }
}
