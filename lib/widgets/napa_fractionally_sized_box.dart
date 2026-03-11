import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [FractionallySizedBox].
/// https://api.flutter.dev/flutter/widgets/FractionallySizedBox-class.html
///
class NapaFractionallySizedBox extends NapaSingleChildRenderObjectWidget {
  AlignmentGeometry alignment;
  double? widthFactor;
  double? heightFactor;

  NapaFractionallySizedBox({
    this.alignment = Alignment.center,
    this.widthFactor,
    this.heightFactor,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<double>(
        name: 'widthFactor',
        nullable: true,
        getValue: (obj) => widthFactor,
        setValue: (obj, value, customData) => widthFactor = value,
      ),
      InspectableProperty<double>(
        name: 'heightFactor',
        nullable: true,
        getValue: (obj) => heightFactor,
        setValue: (obj, value, customData) => heightFactor = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'alignment': alignment.toJson(),
        if (widthFactor != null) 'widthFactor': widthFactor,
        if (heightFactor != null) 'heightFactor': heightFactor,
      });
  }

  @override
  String get widgetName => 'FractionallySizedBox';

  @override
  Widget toWidget() => FractionallySizedBox(
    alignment: alignment,
    widthFactor: widthFactor,
    heightFactor: heightFactor,
    child: child?.toWidget(),
  );

  static NapaFractionallySizedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaFractionallySizedBox(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      widthFactor: data['widthFactor']?.toDouble(),
      heightFactor: data['heightFactor']?.toDouble(),
      child: NapaWidget.decode(data['child']),
    );
  }
}
