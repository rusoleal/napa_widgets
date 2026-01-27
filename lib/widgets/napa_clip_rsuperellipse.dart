import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [ClipRSuperellipse].
/// https://api.flutter.dev/flutter/widgets/ClipRSuperellipse-class.html
///
class NapaClipRSuperellipse extends NapaSingleChildRenderObjectWidget {
  BorderRadiusGeometry borderRadius;
  CustomClipper<RSuperellipse>? clipper;
  Clip clipBehavior;

  NapaClipRSuperellipse({
    this.borderRadius = BorderRadius.zero,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<BorderRadiusGeometry>(
        name: 'borderRadius',
        getValue: (obj) => borderRadius,
        setValue: (obj, value, customData) => borderRadius = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll({
      'clipBehavior': clipBehavior.name,
      'borderRadius': borderRadius.toJson(),
    });
  }

  @override
  String get widgetName => 'ClipRSuperellipse';

  @override
  Widget toWidget() => ClipRSuperellipse(
    borderRadius: borderRadius,
    clipper: clipper,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaClipRSuperellipse? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaClipRSuperellipse(
      borderRadius: decodeBorderRadiusGeometry(data['borderRadius'])!,
      clipBehavior: decodeClip(data['clipBehavior']),
      child: NapaWidget.decode(data['child'])
    );
  }
}
