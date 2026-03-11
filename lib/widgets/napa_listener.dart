import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [Listener].
/// https://api.flutter.dev/flutter/widgets/Listener-class.html
///
/// Note: pointer event callbacks (onPointerDown, onPointerMove, etc.)
/// are not serialized.
///
class NapaListener extends NapaStatelessWidget {
  HitTestBehavior behavior;
  NapaWidget? child;

  NapaListener({
    this.behavior = HitTestBehavior.deferToChild,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'behavior',
        getValue: (obj) => behavior,
        setValue: (obj, value, customData) => behavior = value,
        values: () => HitTestBehavior.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'behavior': behavior.name,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'Listener';

  @override
  Widget toWidget() =>
      Listener(behavior: behavior, child: child?.toWidget());

  static NapaListener? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaListener(
      behavior: decodeHitTestBehavior(data['behavior']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
