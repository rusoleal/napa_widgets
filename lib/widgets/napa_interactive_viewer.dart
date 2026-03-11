import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [InteractiveViewer].
/// https://api.flutter.dev/flutter/widgets/InteractiveViewer-class.html
///
class NapaInteractiveViewer extends NapaStatelessWidget {
  EdgeInsets boundaryMargin;
  bool constrained;
  double maxScale;
  double minScale;
  bool panEnabled;
  bool scaleEnabled;
  NapaWidget? child;

  NapaInteractiveViewer({
    this.boundaryMargin = EdgeInsets.zero,
    this.constrained = true,
    this.maxScale = 2.5,
    this.minScale = 0.8,
    this.panEnabled = true,
    this.scaleEnabled = true,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'constrained',
        getValue: (obj) => constrained,
        setValue: (obj, value, customData) => constrained = value,
      ),
      InspectableProperty<double>(
        name: 'maxScale',
        getValue: (obj) => maxScale,
        setValue: (obj, value, customData) => maxScale = value,
        clamp: (0.0, double.infinity),
      ),
      InspectableProperty<double>(
        name: 'minScale',
        getValue: (obj) => minScale,
        setValue: (obj, value, customData) => minScale = value,
        clamp: (0.0, double.infinity),
      ),
      InspectableProperty<bool>(
        name: 'panEnabled',
        getValue: (obj) => panEnabled,
        setValue: (obj, value, customData) => panEnabled = value,
      ),
      InspectableProperty<bool>(
        name: 'scaleEnabled',
        getValue: (obj) => scaleEnabled,
        setValue: (obj, value, customData) => scaleEnabled = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'boundaryMargin': boundaryMargin.toJson(),
        'constrained': constrained,
        'maxScale': maxScale,
        'minScale': minScale,
        'panEnabled': panEnabled,
        'scaleEnabled': scaleEnabled,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'InteractiveViewer';

  @override
  Widget toWidget() => InteractiveViewer(
    boundaryMargin: boundaryMargin,
    constrained: constrained,
    maxScale: maxScale,
    minScale: minScale,
    panEnabled: panEnabled,
    scaleEnabled: scaleEnabled,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaInteractiveViewer? decode(dynamic data) {
    if (data == null) return null;
    return NapaInteractiveViewer(
      boundaryMargin: decodeEdgeInsets(data['boundaryMargin']),
      constrained: data['constrained'] ?? true,
      maxScale: (data['maxScale'] as num? ?? 2.5).toDouble(),
      minScale: (data['minScale'] as num? ?? 0.8).toDouble(),
      panEnabled: data['panEnabled'] ?? true,
      scaleEnabled: data['scaleEnabled'] ?? true,
      child: NapaWidget.decode(data['child']),
    );
  }
}
