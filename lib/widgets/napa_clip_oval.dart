import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [ClipOval].
/// https://api.flutter.dev/flutter/widgets/ClipOval-class.html
///
class NapaClipOval extends NapaSingleChildRenderObjectWidget {
  CustomClipper<Rect>? clipper;
  Clip clipBehavior;

  NapaClipOval({
    super.child,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  }) {
    properties.addAll([
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
    return super.toJson()..addAll({'clipBehavior': clipBehavior.name});
  }

  @override
  String get widgetName => 'ClipOval';

  @override
  Widget toWidget() => ClipOval(
    clipper: clipper,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaClipOval? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaClipOval(
      clipBehavior: decodeClip(data['clipBehavior']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
