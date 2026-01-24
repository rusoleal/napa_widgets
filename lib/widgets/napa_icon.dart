import 'package:flutter/widgets.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';

import 'napa_stateless_widget.dart';

class NapaIcon extends NapaStatelessWidget {
  IconData? icon;
  double? size;
  double? fill;
  double? weight;
  double? grade;
  double? opticalSize;
  Color? color;
  List<Shadow>? shadows;
  String? semanticLabel;
  TextDirection? textDirection;
  bool? applyTextScaling;
  BlendMode? blendMode;
  FontWeight? fontWeight;

  NapaIcon({
    this.icon,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
    this.applyTextScaling,
    this.blendMode,
    this.fontWeight,
  });

  @override
  toJson() {
    return super.toJson()..addAll({
      'size': size,
      'fill': fill,
      'weight': weight,
      'grade': grade,
      'opticalSize': opticalSize,
      'color': color?.toJson(),
      'semanticLabel': semanticLabel,
      'textDirection': textDirection?.name,
      'applyTextScaling': applyTextScaling,
      'blendMode': blendMode?.name,
      'fontWeight': fontWeight?.value,
    });
  }

  @override
  String get widgetName => 'Icon';

  @override
  Widget toWidget() => Icon(
    icon,
    size: size,
    fill: fill,
    weight: weight,
    grade: grade,
    opticalSize: opticalSize,
    color: color,
    shadows: shadows,
    semanticLabel: semanticLabel,
    textDirection: textDirection,
    applyTextScaling: applyTextScaling,
    blendMode: blendMode,
    fontWeight: fontWeight,
  );
}
