import 'package:flutter/cupertino.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_image_filter.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [BackdropFilter].
/// https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html
///
class NapaBackdropFilter extends NapaSingleChildRenderObjectWidget {
  NapaImageFilter filter;
  BlendMode blendMode;
  bool enabled;

  NapaBackdropFilter({
    super.child,
    required this.filter,
    this.blendMode = BlendMode.srcOver,
    this.enabled = true,
  }) {
    properties.addAll([
      InspectableProperty<NapaImageFilter>(
        name: 'filter',
        getValue: (Inspectable obj) => filter,
        setValue: (obj, value, customData) => filter = value,
      ),
      InspectableProperty<BlendMode>(
        name: 'blendMode',
        getValue: (Inspectable obj) => blendMode,
        setValue: (obj, value, customData) => blendMode = value,
        values: () => BlendMode.values,
      ),
      InspectableProperty<bool>(
        name: 'enabled',
        getValue: (Inspectable obj) => enabled,
        setValue: (obj, value, customData) => enabled = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson().addAll(<String, dynamic>{
      'filter': filter.toJson(),
      'blendMode': blendMode.name,
      'enabled': enabled,
    });
  }

  @override
  String get widgetName => 'BackdropFilter';

  @override
  String toString() {
    return '$widgetName(${filter.name})';
  }

  @override
  Widget toWidget() => BackdropFilter(
    blendMode: blendMode,
    enabled: enabled,
    filter: filter.imageFilter,
    child: child?.toWidget(),
  );

  static NapaBackdropFilter? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaBackdropFilter(
      blendMode: decodeBlendMode(data['blendMode'])!,
      enabled: data['enabled'],
      filter: NapaImageFilter.decode(data['filter'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}
