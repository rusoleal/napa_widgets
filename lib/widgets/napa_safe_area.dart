import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [SafeArea].
/// https://api.flutter.dev/flutter/widgets/SafeArea-class.html
///
class NapaSafeArea extends NapaStatelessWidget {
  bool left;
  bool top;
  bool right;
  bool bottom;
  EdgeInsets minimum;
  bool maintainBottomViewPadding;
  NapaWidget? child;

  NapaSafeArea({
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'left',
        getValue: (obj) => left,
        setValue: (obj, value, customData) => left = value,
      ),
      InspectableProperty<bool>(
        name: 'top',
        getValue: (obj) => top,
        setValue: (obj, value, customData) => top = value,
      ),
      InspectableProperty<bool>(
        name: 'right',
        getValue: (obj) => right,
        setValue: (obj, value, customData) => right = value,
      ),
      InspectableProperty<bool>(
        name: 'bottom',
        getValue: (obj) => bottom,
        setValue: (obj, value, customData) => bottom = value,
      ),
      InspectableProperty<bool>(
        name: 'maintainBottomViewPadding',
        getValue: (obj) => maintainBottomViewPadding,
        setValue: (obj, value, customData) => maintainBottomViewPadding = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'left': left,
        'top': top,
        'right': right,
        'bottom': bottom,
        'minimum': minimum.toJson(),
        'maintainBottomViewPadding': maintainBottomViewPadding,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'SafeArea';

  @override
  Widget toWidget() => SafeArea(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    minimum: minimum,
    maintainBottomViewPadding: maintainBottomViewPadding,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaSafeArea? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaSafeArea(
      left: data['left'] ?? true,
      top: data['top'] ?? true,
      right: data['right'] ?? true,
      bottom: data['bottom'] ?? true,
      minimum: decodeEdgeInsets(data['minimum']),
      maintainBottomViewPadding: data['maintainBottomViewPadding'] ?? false,
      child: NapaWidget.decode(data['child']),
    );
  }
}
