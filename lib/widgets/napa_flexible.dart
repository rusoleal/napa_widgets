import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';
import 'napa_parent_data_widget.dart';
import 'napa_widget.dart';

class NapaFlexible extends NapaParentDataWidget {
  FlexFit fit;
  int flex;

  NapaFlexible({
    this.flex = 1,
    this.fit = FlexFit.loose,
    required super.child,
  }) {
    properties.addAll([
      InspectableProperty<FlexFit>(
        name: 'fit',
        getValue: (Inspectable obj) => fit,
        setValue: (obj, value, customData) => fit = value,
        values: () => FlexFit.values,
      ),
      InspectableProperty<int>(
        name: 'flex',
        getValue: (Inspectable obj) => flex,
        setValue: (obj, value, customData) => flex = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{'flex': flex, 'fit': fit.name});
  }

  @override
  String get widgetName => 'Flexible';

  @override
  Widget toWidget() => Flexible(flex: flex, fit: fit, child: child.toWidget());

  static NapaFlexible? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaFlexible(
      flex: data['flex'],
      fit: decodeFlexFit(data['fit']),
      child: NapaWidget.decode(data['child'])!,
    );
  }
}
