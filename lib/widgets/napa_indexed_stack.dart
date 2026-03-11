import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_multi_child_render_object_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [IndexedStack].
/// https://api.flutter.dev/flutter/widgets/IndexedStack-class.html
///
class NapaIndexedStack extends NapaMultiChildRenderObjectWidget {
  int? index;
  AlignmentGeometry alignment;
  StackFit sizing;

  NapaIndexedStack({
    this.index = 0,
    this.alignment = AlignmentDirectional.topStart,
    this.sizing = StackFit.loose,
    super.children,
  }) {
    properties.addAll([
      InspectableProperty<int>(
        name: 'index',
        nullable: true,
        getValue: (obj) => index,
        setValue: (obj, value, customData) => index = value,
      ),
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<Enum>(
        name: 'sizing',
        getValue: (obj) => sizing,
        setValue: (obj, value, customData) => sizing = value,
        values: () => StackFit.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'index': index,
        'alignment': alignment.toJson(),
        'sizing': sizing.name,
      });
  }

  @override
  String get widgetName => 'IndexedStack';

  @override
  Widget toWidget() => IndexedStack(
    index: index,
    alignment: alignment,
    sizing: sizing,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaIndexedStack? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaIndexedStack(
      index: data['index'],
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      sizing: decodeStackFit(data['sizing']),
      children: decodeChildren(data['children']) ?? [],
    );
  }
}
