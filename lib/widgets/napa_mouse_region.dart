import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [MouseRegion].
/// https://api.flutter.dev/flutter/widgets/MouseRegion-class.html
///
/// Note: pointer event callbacks (onEnter, onExit, onHover) are not serialized.
///
class NapaMouseRegion extends NapaStatelessWidget {
  MouseCursor cursor;
  bool opaque;
  NapaWidget? child;

  NapaMouseRegion({
    this.cursor = MouseCursor.defer,
    this.opaque = true,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'opaque',
        getValue: (obj) => opaque,
        setValue: (obj, value, customData) => opaque = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'cursor': cursor.toJson(),
        'opaque': opaque,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'MouseRegion';

  @override
  Widget toWidget() => MouseRegion(
    cursor: cursor,
    opaque: opaque,
    child: child?.toWidget(),
  );

  static NapaMouseRegion? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaMouseRegion(
      cursor: decodeMouseCursor(data['cursor']),
      opaque: data['opaque'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
