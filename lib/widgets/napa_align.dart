import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [Align].
/// https://api.flutter.dev/flutter/widgets/Align-class.html
///
class NapaAlign extends NapaSingleChildRenderObjectWidget {
  AlignmentGeometry alignment;
  double? widthFactor;
  double? heightFactor;

  NapaAlign({
    this.alignment = Alignment.center,
    this.widthFactor,
    this.heightFactor,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
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
    return super.toJson()..addAll(<String, dynamic>{
      'alignment': alignment.toJson(),
      if (widthFactor != null) 'widthFactor': widthFactor,
      if (heightFactor != null) 'heightFactor': heightFactor,
    });
  }

  @override
  String get widgetName => 'Align';

  @override
  Widget toWidget() => Align(
    alignment: alignment,
    widthFactor: widthFactor,
    heightFactor: heightFactor,
    child: child?.toWidget(),
  );

  static NapaAlign? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    AlignmentGeometry alignment = decodeAlignmentGeometry(data['alignment'])!;
    double? widthFactor = data['widthFactor'];
    double? heightFactor = data['heightFactor'];

    return NapaAlign(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: NapaWidget.decode(data['child'])
    );
  }
}
