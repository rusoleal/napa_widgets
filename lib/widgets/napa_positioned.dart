import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_parent_data_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [Positioned].
/// https://api.flutter.dev/flutter/widgets/Positioned-class.html
///
class NapaPositioned extends NapaParentDataWidget {
  double? left;
  double? top;
  double? right;
  double? bottom;
  double? width;
  double? height;

  NapaPositioned({
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    required super.child,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'left',
        nullable: true,
        getValue: (Inspectable obj) => left,
        setValue: (obj, value, customData) => left = value,
      ),
      InspectableProperty<double>(
        name: 'top',
        nullable: true,
        getValue: (Inspectable obj) => top,
        setValue: (obj, value, customData) => top = value,
      ),
      InspectableProperty<double>(
        name: 'right',
        nullable: true,
        getValue: (Inspectable obj) => right,
        setValue: (obj, value, customData) => right = value,
      ),
      InspectableProperty<double>(
        name: 'bottom',
        nullable: true,
        getValue: (Inspectable obj) => bottom,
        setValue: (obj, value, customData) => bottom = value,
      ),
      InspectableProperty<double>(
        name: 'width',
        nullable: true,
        getValue: (Inspectable obj) => width,
        setValue: (obj, value, customData) => width = value,
      ),
      InspectableProperty<double>(
        name: 'height',
        nullable: true,
        getValue: (Inspectable obj) => height,
        setValue: (obj, value, customData) => height = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      if (left != null) 'left': left,
      if (top != null) 'top': top,
      if (right != null) 'right': right,
      if (bottom != null) 'bottom': bottom,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
    });
  }

  @override
  String get widgetName => 'Positioned';

  @override
  Widget toWidget() => Positioned(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    width: width,
    height: height,
    child: child.toWidget(),
  );

  static NapaPositioned? decode(dynamic data) {
    if (data == null) {
      return null;
    }
    return NapaPositioned(
      left: data['left'],
      top: data['top'],
      right: data['right'],
      bottom: data['bottom'],
      width: data['width'],
      height: data['height'],
      child: NapaWidget.decode(data['child'])!,
    );
  }
}
