import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [SizedOverflowBox].
/// https://api.flutter.dev/flutter/widgets/SizedOverflowBox-class.html
///
class NapaSizedOverflowBox extends NapaSingleChildRenderObjectWidget {
  AlignmentGeometry alignment;
  Size size;

  NapaSizedOverflowBox({
    this.alignment = Alignment.center,
    required this.size,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<Size>(
        name: 'size',
        getValue: (obj) => size,
        setValue: (obj, value, customData) => size = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'alignment': alignment.toJson(),
        'size': size.toJson(),
      });
  }

  @override
  String get widgetName => 'SizedOverflowBox';

  @override
  Widget toWidget() => SizedOverflowBox(
    alignment: alignment,
    size: size,
    child: child?.toWidget(),
  );

  static NapaSizedOverflowBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaSizedOverflowBox(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      size: decodeSize(data['size'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}
