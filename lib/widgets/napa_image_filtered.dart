import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_image_filter.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaImageFiltered extends NapaSingleChildRenderObjectWidget {
  NapaImageFilter imageFilter;
  bool enabled;

  NapaImageFiltered({
    required this.imageFilter,
    this.enabled = true,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<NapaImageFilter>(
        name: 'imageFilter',
        getValue: (Inspectable obj) => imageFilter,
        setValue: (obj, value, customData) => imageFilter = value,
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
    return super.toJson()..addAll(<String, dynamic>{
      'imageFilter': imageFilter.toJson(),
      'enabled': enabled,
    });
  }

  @override
  String get widgetName => 'ImageFiltered';

  @override
  Widget toWidget() => ImageFiltered(
    imageFilter: imageFilter.imageFilter,
    enabled: enabled,
    child: child?.toWidget(),
  );

  static NapaImageFiltered? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaImageFiltered(
      imageFilter: NapaImageFilter.decode(data['imageFilter'])!,
      enabled: data['enabled'],
      child: NapaWidget.decode(data['child']),
    );
  }
}
