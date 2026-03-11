import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_sized_box.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [Visibility].
/// https://api.flutter.dev/flutter/widgets/Visibility-class.html
///
class NapaVisibility extends NapaStatelessWidget {
  bool visible;
  bool maintainState;
  bool maintainAnimation;
  bool maintainSize;
  bool maintainSemantics;
  bool maintainInteractivity;
  NapaWidget replacement;
  NapaWidget? child;

  NapaVisibility({
    this.visible = true,
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainSemantics = false,
    this.maintainInteractivity = false,
    NapaWidget? replacement,
    this.child,
  }) : replacement = replacement ?? NapaSizedBox(width: 0, height: 0),
       super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'visible',
        getValue: (obj) => visible,
        setValue: (obj, value, customData) => visible = value,
      ),
      InspectableProperty<bool>(
        name: 'maintainState',
        getValue: (obj) => maintainState,
        setValue: (obj, value, customData) => maintainState = value,
      ),
      InspectableProperty<bool>(
        name: 'maintainAnimation',
        getValue: (obj) => maintainAnimation,
        setValue: (obj, value, customData) => maintainAnimation = value,
      ),
      InspectableProperty<bool>(
        name: 'maintainSize',
        getValue: (obj) => maintainSize,
        setValue: (obj, value, customData) => maintainSize = value,
      ),
      InspectableProperty<bool>(
        name: 'maintainSemantics',
        getValue: (obj) => maintainSemantics,
        setValue: (obj, value, customData) => maintainSemantics = value,
      ),
      InspectableProperty<bool>(
        name: 'maintainInteractivity',
        getValue: (obj) => maintainInteractivity,
        setValue: (obj, value, customData) => maintainInteractivity = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'visible': visible,
        'maintainState': maintainState,
        'maintainAnimation': maintainAnimation,
        'maintainSize': maintainSize,
        'maintainSemantics': maintainSemantics,
        'maintainInteractivity': maintainInteractivity,
        'replacement': replacement.toJson(),
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'Visibility';

  @override
  Widget toWidget() => Visibility(
    visible: visible,
    maintainState: maintainState,
    maintainAnimation: maintainAnimation,
    maintainSize: maintainSize,
    maintainSemantics: maintainSemantics,
    maintainInteractivity: maintainInteractivity,
    replacement: replacement.toWidget(),
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaVisibility? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaVisibility(
      visible: data['visible'] ?? true,
      maintainState: data['maintainState'] ?? false,
      maintainAnimation: data['maintainAnimation'] ?? false,
      maintainSize: data['maintainSize'] ?? false,
      maintainSemantics: data['maintainSemantics'] ?? false,
      maintainInteractivity: data['maintainInteractivity'] ?? false,
      replacement: NapaWidget.decode(data['replacement']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
