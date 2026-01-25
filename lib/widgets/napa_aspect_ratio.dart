import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [AspectRatio].
/// https://api.flutter.dev/flutter/widgets/AspectRatio-class.html
///
class NapaAspectRatio extends NapaSingleChildRenderObjectWidget {
  double aspectRatio;

  NapaAspectRatio({super.child, this.aspectRatio = 1.0}) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'aspectRatio',
        getValue: (Inspectable obj) => aspectRatio,
        setValue: (obj, value, customData) => aspectRatio = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String,dynamic>{
      'aspectRatio': aspectRatio
    });
  }

  @override
  String get widgetName => 'AspectRatio';

  @override
  Widget toWidget() =>
      AspectRatio(aspectRatio: aspectRatio, child: child?.toWidget());

  static NapaAspectRatio? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaAspectRatio(
      aspectRatio: data['aspectRatio'],
      child: NapaWidget.decode(data['child'])
    );
  }
}
