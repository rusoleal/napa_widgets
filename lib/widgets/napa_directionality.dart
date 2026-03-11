import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [Directionality].
/// https://api.flutter.dev/flutter/widgets/Directionality-class.html
///
class NapaDirectionality extends NapaStatelessWidget {
  TextDirection textDirection;
  NapaWidget? child;

  NapaDirectionality({
    this.textDirection = TextDirection.ltr,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'textDirection',
        getValue: (obj) => textDirection,
        setValue: (obj, value, customData) => textDirection = value,
        values: () => TextDirection.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'textDirection': textDirection.name,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'Directionality';

  @override
  Widget toWidget() => Directionality(
    textDirection: textDirection,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaDirectionality? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaDirectionality(
      textDirection:
          decodeTextDirection(data['textDirection']) ?? TextDirection.ltr,
      child: NapaWidget.decode(data['child']),
    );
  }
}
