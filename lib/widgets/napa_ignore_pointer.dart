import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [IgnorePointer].
/// https://api.flutter.dev/flutter/widgets/IgnorePointer-class.html
///
class NapaIgnorePointer extends NapaSingleChildRenderObjectWidget {
  bool ignoring;

  NapaIgnorePointer({this.ignoring = true, super.child}) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'ignoring',
        getValue: (obj) => ignoring,
        setValue: (obj, value, customData) => ignoring = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{'ignoring': ignoring});
  }

  @override
  String get widgetName => 'IgnorePointer';

  @override
  Widget toWidget() =>
      IgnorePointer(ignoring: ignoring, child: child?.toWidget());

  static NapaIgnorePointer? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaIgnorePointer(
      ignoring: data['ignoring'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
