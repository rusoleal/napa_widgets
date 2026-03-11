import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [ExcludeSemantics].
/// https://api.flutter.dev/flutter/widgets/ExcludeSemantics-class.html
///
class NapaExcludeSemantics extends NapaSingleChildRenderObjectWidget {
  bool excluding;

  NapaExcludeSemantics({
    this.excluding = true,
    super.child,
  }) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'excluding',
        getValue: (obj) => excluding,
        setValue: (obj, value, customData) => excluding = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'excluding': excluding,
      });
  }

  @override
  String get widgetName => 'ExcludeSemantics';

  @override
  Widget toWidget() => ExcludeSemantics(
    excluding: excluding,
    child: child?.toWidget(),
  );

  static NapaExcludeSemantics? decode(dynamic data) {
    if (data == null) return null;
    return NapaExcludeSemantics(
      excluding: data['excluding'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
