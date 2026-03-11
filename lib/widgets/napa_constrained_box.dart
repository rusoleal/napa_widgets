import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [ConstrainedBox].
/// https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html
///
class NapaConstrainedBox extends NapaSingleChildRenderObjectWidget {
  BoxConstraints constraints;

  NapaConstrainedBox({required this.constraints, super.child}) {
    properties.addAll([
      InspectableProperty<BoxConstraints>(
        name: 'constraints',
        getValue: (Inspectable obj) => constraints,
        setValue: (obj, value, customData) => constraints = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{'constraints': constraints.toJson()});
  }

  @override
  String get widgetName => 'ConstrainedBox';

  @override
  Widget toWidget() =>
      ConstrainedBox(constraints: constraints, child: child?.toWidget());

  static NapaConstrainedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaConstrainedBox(
      constraints: decodeBoxConstraints(data['constraints']),
      child: NapaWidget.decode(data['child']),
    );
  }
}
