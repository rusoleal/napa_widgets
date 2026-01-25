import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_multi_child_render_object_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [Stack].
/// https://api.flutter.dev/flutter/widgets/Stack-class.html
///
class NapaStack extends NapaMultiChildRenderObjectWidget {
  AlignmentGeometry alignment;
  Clip clipBehavior;
  StackFit fit;
  TextDirection? textDirection;

  NapaStack({
    this.alignment = AlignmentDirectional.topStart,
    this.fit = .loose,
    this.clipBehavior = .hardEdge,
    super.children,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (Inspectable obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<Enum>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<Enum>(
        name: 'fit',
        getValue: (obj) => fit,
        setValue: (obj, value, customData) => fit = value,
        values: () => StackFit.values,
      ),
      InspectableProperty<Enum>(
        name: 'textDirection',
        nullable: true,
        getValue: (obj) => textDirection,
        setValue: (obj, value, customData) => textDirection = value,
        values: () => TextDirection.values,
      ),

    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      'alignment': alignment.toJson(),
      'clipBehavior': clipBehavior.name,
      'fit': fit.name,
      if (textDirection != null) 'textDirection': textDirection?.name,
    });
  }

  @override
  String get widgetName => 'Stack';

  @override
  Widget toWidget() => Stack(
    alignment: alignment,
    clipBehavior: clipBehavior,
    fit: fit,
    textDirection: textDirection,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaStack? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaStack(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      clipBehavior: decodeClip(data['clipBehavior']),
      fit: decodeStackFit(data['fit']),
      children: decodeChildren(data['children']),
    );
  }
}
