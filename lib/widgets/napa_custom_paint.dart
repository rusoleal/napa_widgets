import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaCustomPaint extends NapaSingleChildRenderObjectWidget {
  CustomPainter? painter;
  CustomPainter? foregroundPainter;
  Size size;
  bool isComplex;
  bool willChange;

  NapaCustomPaint({
    this.painter,
    this.foregroundPainter,
    this.size = Size.zero,
    this.isComplex = false,
    this.willChange = false,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'width',
        getValue: (Inspectable obj) => size.width,
        setValue: (obj, value, customData) => size = Size(value, size.height),
      ),
      InspectableProperty<double>(
        name: 'height',
        getValue: (Inspectable obj) => size.height,
        setValue: (obj, value, customData) => size = Size(size.width, value),
      ),
      InspectableProperty<bool>(
        name: 'isComplex',
        getValue: (Inspectable obj) => isComplex,
        setValue: (obj, value, customData) => isComplex = value,
      ),
      InspectableProperty<bool>(
        name: 'willChange',
        getValue: (Inspectable obj) => willChange,
        setValue: (obj, value, customData) => willChange = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll({
      if (painter != null) 'painter': painter!.toJson(),
      if (foregroundPainter != null)
        'foregroundPainter': foregroundPainter!.toJson(),
      'size': size.toJson(),
      'isComplex': isComplex,
      'willChange': willChange,
    });
  }

  @override
  String get widgetName => 'CustomPaint';

  @override
  Widget toWidget() => CustomPaint(
    painter: painter,
    foregroundPainter: foregroundPainter,
    size: size,
    isComplex: isComplex,
    willChange: willChange,
    child: child?.toWidget(),
  );

  static NapaCustomPaint? decode(dynamic data) {
    if (data == null) {
      return data;
    }

    return NapaCustomPaint(
      isComplex: data['isComplex'],
      willChange: data['willChange'],
      size: decodeSize(data['size'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}
