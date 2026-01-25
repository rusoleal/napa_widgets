import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [RotatedBox].
/// https://api.flutter.dev/flutter/widgets/RotatedBox-class.html
///
class NapaRotatedBox extends NapaSingleChildRenderObjectWidget {
  int quarterTurns;

  NapaRotatedBox({required this.quarterTurns, super.child}) {
    properties.addAll([
      InspectableProperty<int>(
        name: 'quarterTurns',
        getValue: (obj) => quarterTurns,
        setValue: (obj, value, customData) => quarterTurns = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll({'quarterTurns': quarterTurns});
  }

  @override
  String get widgetName => 'RotatedBox';

  @override
  String toString() => '$widgetName(${(quarterTurns * 90) % 360}°)';

  @override
  Widget toWidget() =>
      RotatedBox(quarterTurns: quarterTurns, child: child?.toWidget());

  static NapaRotatedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaRotatedBox(
      quarterTurns: data['quarterTurns'],
      child: NapaWidget.decode(data['child'])
    );
  }
}
