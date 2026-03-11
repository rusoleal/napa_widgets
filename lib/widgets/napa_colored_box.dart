import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [ColoredBox].
/// https://api.flutter.dev/flutter/widgets/ColoredBox-class.html
///
class NapaColoredBox extends NapaSingleChildRenderObjectWidget {
  Color color;

  NapaColoredBox({required this.color, super.child}) {
    properties.addAll([
      InspectableProperty<Color>(
        name: 'color',
        getValue: (Inspectable obj) => color,
        setValue: (obj, value, customData) => color = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{'color': color.toJson()});
  }

  @override
  String get widgetName => 'ColoredBox';

  @override
  Widget toWidget() => ColoredBox(color: color, child: child?.toWidget());

  static NapaColoredBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaColoredBox(
      color: decodeColor(data['color'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}
