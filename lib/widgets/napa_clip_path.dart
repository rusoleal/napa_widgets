import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [ClipPath].
/// https://api.flutter.dev/flutter/widgets/ClipPath-class.html
///
class NapaClipPath extends NapaSingleChildRenderObjectWidget {
  CustomClipper<Path>? clipper;
  Clip clipBehavior;

  NapaClipPath({super.child, this.clipper, this.clipBehavior = Clip.antiAlias}) {
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
  String get widgetName => 'ClipPath';

  @override
  Widget toWidget() => ClipPath(
    clipper: clipper,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaClipPath? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaClipPath(
        clipBehavior: decodeClip(data['clipBehavior']),
        child: NapaWidget.decode(data['child'])
    );
  }

}
