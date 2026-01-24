import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

class NapaBaseline extends NapaSingleChildRenderObjectWidget {
  double baseline;
  TextBaseline baselineType;

  NapaBaseline({
    super.child,
    this.baseline = 0.0,
    this.baselineType = .alphabetic,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'baseline',
        getValue: (Inspectable obj) => baseline,
        setValue: (obj, value, customData) => baseline = value,
      ),
      InspectableProperty<TextBaseline>(
        name: 'baselineType',
        getValue: (Inspectable obj) => baselineType,
        setValue: (obj, value, customData) => baselineType = value,
        values: () => TextBaseline.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String,dynamic>{
      'baseline': baseline,
      'baselineType': baselineType.name
    });
  }

  @override
  String get widgetName => 'Baseline';

  @override
  Widget toWidget() => Baseline(
    baseline: baseline,
    baselineType: baselineType,
    child: child?.toWidget(),
  );

  static NapaBaseline? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaBaseline(
      baseline: data['baseline'],
      baselineType: decodeTextBaseline(data['baselineType'])!,
      child: NapaWidget.decode(data['child'])
    );
  }
}
