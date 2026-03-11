import 'package:flutter/widgets.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [AnimatedSwitcher].
/// https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html
///
class NapaAnimatedSwitcher extends NapaStatelessWidget {
  Duration duration;
  Duration? reverseDuration;
  Curve switchInCurve;
  Curve switchOutCurve;
  NapaWidget? child;

  NapaAnimatedSwitcher({
    required this.duration,
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild);

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'duration': duration.toJson(),
        if (reverseDuration != null) 'reverseDuration': reverseDuration!.toJson(),
        'switchInCurve': switchInCurve.toJson(),
        'switchOutCurve': switchOutCurve.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'AnimatedSwitcher';

  @override
  Widget toWidget() => AnimatedSwitcher(
    duration: duration,
    reverseDuration: reverseDuration,
    switchInCurve: switchInCurve,
    switchOutCurve: switchOutCurve,
    child: child?.toWidget(),
  );

  static NapaAnimatedSwitcher? decode(dynamic data) {
    if (data == null) return null;
    return NapaAnimatedSwitcher(
      duration: decodeDuration(data['duration']),
      reverseDuration: data['reverseDuration'] != null
          ? decodeDuration(data['reverseDuration'])
          : null,
      switchInCurve: decodeCurve(data['switchInCurve']),
      switchOutCurve: decodeCurve(data['switchOutCurve']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
