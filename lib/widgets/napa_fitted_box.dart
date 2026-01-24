import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaFittedBox extends NapaSingleChildRenderObjectWidget {
  AlignmentGeometry alignment;
  Clip clipBehavior;
  BoxFit fit;

  NapaFittedBox({
    this.alignment = Alignment.center,
    this.clipBehavior = .none,
    this.fit = .contain,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
      ),
      InspectableProperty<Clip>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<BoxFit>(
        name: 'fit',
        getValue: (obj) => fit,
        setValue: (obj, value, customData) => fit = value,
        values: () => BoxFit.values,
      ),
    ]);
  }

  @override
  toJson() {
    return <String, dynamic>{
      'alignment': alignment.toJson(),
      'clipBehavior': clipBehavior.name,
      'fit': fit.name,
    }..addAll(super.toJson());
  }

  @override
  String get widgetName => 'FittedBox';

  @override
  Widget toWidget() => FittedBox(
    alignment: alignment,
    clipBehavior: clipBehavior,
    fit: fit,
    child: child?.toWidget(),
  );

  static NapaFittedBox? decode(dynamic data) {
    if (data is! Map) {
      return null;
    }

    var alignment = decodeAlignmentGeometry(data['alignment'])!;
    var clipBehavior = decodeClip(data['clipBehavior']);
    var fit = decodeBoxFit(data['fit'])!;

    return NapaFittedBox(
      alignment: alignment,
      clipBehavior: clipBehavior,
      fit: fit,
      child: NapaWidget.decode(data['child']),
    );
  }
}
