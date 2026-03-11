import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [FocusScope].
/// https://api.flutter.dev/flutter/widgets/FocusScope-class.html
///
class NapaFocusScope extends NapaStatelessWidget {
  bool autofocus;
  bool canRequestFocus;
  bool skipTraversal;
  NapaWidget? child;

  NapaFocusScope({
    this.autofocus = false,
    this.canRequestFocus = true,
    this.skipTraversal = false,
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
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'autofocus': autofocus,
        'canRequestFocus': canRequestFocus,
        'skipTraversal': skipTraversal,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'FocusScope';

  @override
  Widget toWidget() => FocusScope(
    autofocus: autofocus,
    canRequestFocus: canRequestFocus,
    skipTraversal: skipTraversal,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaFocusScope? decode(dynamic data) {
    if (data == null) return null;
    return NapaFocusScope(
      autofocus: data['autofocus'] ?? false,
      canRequestFocus: data['canRequestFocus'] ?? true,
      skipTraversal: data['skipTraversal'] ?? false,
      child: NapaWidget.decode(data['child']),
    );
  }
}
