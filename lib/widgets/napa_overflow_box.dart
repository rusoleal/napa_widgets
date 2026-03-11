import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [OverflowBox].
/// https://api.flutter.dev/flutter/widgets/OverflowBox-class.html
///
class NapaOverflowBox extends NapaSingleChildRenderObjectWidget {
  AlignmentGeometry alignment;
  double? minWidth;
  double? maxWidth;
  double? minHeight;
  double? maxHeight;

  NapaOverflowBox({
    this.alignment = Alignment.center,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<double>(
        name: 'minWidth',
        nullable: true,
        getValue: (obj) => minWidth,
        setValue: (obj, value, customData) => minWidth = value,
      ),
      InspectableProperty<double>(
        name: 'maxWidth',
        nullable: true,
        getValue: (obj) => maxWidth,
        setValue: (obj, value, customData) => maxWidth = value,
      ),
      InspectableProperty<double>(
        name: 'minHeight',
        nullable: true,
        getValue: (obj) => minHeight,
        setValue: (obj, value, customData) => minHeight = value,
      ),
      InspectableProperty<double>(
        name: 'maxHeight',
        nullable: true,
        getValue: (obj) => maxHeight,
        setValue: (obj, value, customData) => maxHeight = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'alignment': alignment.toJson(),
        if (minWidth != null) 'minWidth': minWidth,
        if (maxWidth != null) 'maxWidth': maxWidth,
        if (minHeight != null) 'minHeight': minHeight,
        if (maxHeight != null) 'maxHeight': maxHeight,
      });
  }

  @override
  String get widgetName => 'OverflowBox';

  @override
  Widget toWidget() => OverflowBox(
    alignment: alignment,
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
    child: child?.toWidget(),
  );

  static NapaOverflowBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaOverflowBox(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      minWidth: data['minWidth']?.toDouble(),
      maxWidth: data['maxWidth']?.toDouble(),
      minHeight: data['minHeight']?.toDouble(),
      maxHeight: data['maxHeight']?.toDouble(),
      child: NapaWidget.decode(data['child']),
    );
  }
}
