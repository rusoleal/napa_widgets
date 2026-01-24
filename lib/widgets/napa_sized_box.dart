import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaSizedBox extends NapaSingleChildRenderObjectWidget {
  double? width;
  double? height;

  NapaSizedBox({super.child, this.width, this.height}) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'width',
        getValue: (obj) => width,
        setValue: (obj, value, customData) => width = value,
        nullable: true,
      ),
      InspectableProperty<double>(
        name: 'height',
        getValue: (obj) => height,
        setValue: (obj, value, customData) => height = value,
        nullable: true,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      if (width != null) 'width': width,
      if (height != null) 'height': height,
    });
  }

  @override
  String get widgetName => 'SizedBox';

  @override
  Widget toWidget() {
    return SizedBox(width: width, height: height, child: child?.toWidget());
  }

  static NapaSizedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaSizedBox(
      width: data['width'],
      height: data['height'],
      child: NapaWidget.decode(data['child'])
    );
  }
}
