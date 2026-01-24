import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

class NapaPadding extends NapaSingleChildRenderObjectWidget {
  EdgeInsetsGeometry padding;

  NapaPadding({required this.padding, super.child}) {
    properties.addAll([
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'padding',
        getValue: (Inspectable obj) => padding,
        setValue: (obj, value, customData) => padding = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{'padding': padding.toJson()});
  }

  @override
  String get widgetName => 'Padding';

  @override
  Widget toWidget() => Padding(padding: padding, child: child?.toWidget());

  static NapaPadding? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaPadding(
      padding: decodeEdgeInsetsGeometry(data['padding'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}
