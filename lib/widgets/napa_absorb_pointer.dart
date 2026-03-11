import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [AbsorbPointer].
/// https://api.flutter.dev/flutter/widgets/AbsorbPointer-class.html
///
class NapaAbsorbPointer extends NapaSingleChildRenderObjectWidget {
  bool absorbing;

  NapaAbsorbPointer({this.absorbing = true, super.child}) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'absorbing',
        getValue: (obj) => absorbing,
        setValue: (obj, value, customData) => absorbing = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{'absorbing': absorbing});
  }

  @override
  String get widgetName => 'AbsorbPointer';

  @override
  Widget toWidget() =>
      AbsorbPointer(absorbing: absorbing, child: child?.toWidget());

  static NapaAbsorbPointer? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaAbsorbPointer(
      absorbing: data['absorbing'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
