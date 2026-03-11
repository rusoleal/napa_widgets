import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [Offstage].
/// https://api.flutter.dev/flutter/widgets/Offstage-class.html
///
class NapaOffstage extends NapaSingleChildRenderObjectWidget {
  bool offstage;

  NapaOffstage({this.offstage = true, super.child}) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'offstage',
        getValue: (obj) => offstage,
        setValue: (obj, value, customData) => offstage = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{'offstage': offstage});
  }

  @override
  String get widgetName => 'Offstage';

  @override
  Widget toWidget() => Offstage(offstage: offstage, child: child?.toWidget());

  static NapaOffstage? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaOffstage(
      offstage: data['offstage'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
