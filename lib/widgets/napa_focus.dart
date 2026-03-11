import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [Focus].
/// https://api.flutter.dev/flutter/widgets/Focus-class.html
///
class NapaFocus extends NapaStatelessWidget {
  bool autofocus;
  bool canRequestFocus;
  bool skipTraversal;
  bool descendantsAreFocusable;
  bool descendantsAreTraversable;
  NapaWidget? child;

  NapaFocus({
    this.autofocus = false,
    this.canRequestFocus = true,
    this.skipTraversal = false,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'autofocus',
        getValue: (obj) => autofocus,
        setValue: (obj, value, customData) => autofocus = value,
      ),
      InspectableProperty<bool>(
        name: 'canRequestFocus',
        getValue: (obj) => canRequestFocus,
        setValue: (obj, value, customData) => canRequestFocus = value,
      ),
      InspectableProperty<bool>(
        name: 'skipTraversal',
        getValue: (obj) => skipTraversal,
        setValue: (obj, value, customData) => skipTraversal = value,
      ),
      InspectableProperty<bool>(
        name: 'descendantsAreFocusable',
        getValue: (obj) => descendantsAreFocusable,
        setValue: (obj, value, customData) => descendantsAreFocusable = value,
      ),
      InspectableProperty<bool>(
        name: 'descendantsAreTraversable',
        getValue: (obj) => descendantsAreTraversable,
        setValue: (obj, value, customData) => descendantsAreTraversable = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'autofocus': autofocus,
        'canRequestFocus': canRequestFocus,
        'skipTraversal': skipTraversal,
        'descendantsAreFocusable': descendantsAreFocusable,
        'descendantsAreTraversable': descendantsAreTraversable,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'Focus';

  @override
  Widget toWidget() => Focus(
    autofocus: autofocus,
    canRequestFocus: canRequestFocus,
    skipTraversal: skipTraversal,
    descendantsAreFocusable: descendantsAreFocusable,
    descendantsAreTraversable: descendantsAreTraversable,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaFocus? decode(dynamic data) {
    if (data == null) return null;
    return NapaFocus(
      autofocus: data['autofocus'] ?? false,
      canRequestFocus: data['canRequestFocus'] ?? true,
      skipTraversal: data['skipTraversal'] ?? false,
      descendantsAreFocusable: data['descendantsAreFocusable'] ?? true,
      descendantsAreTraversable: data['descendantsAreTraversable'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
