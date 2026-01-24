
import 'package:flutter/widgets.dart';
import 'napa_flex.dart';
import 'tojson_extensions.dart';

class NapaRow extends NapaFlex {

  NapaRow({
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.spacing,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    super.children
  }):super(direction: Axis.horizontal) {
    properties.removeWhere((element) => element.name=='clipBehavior' || element.name=='direction',);
  }

  @override
  String get widgetName => 'Row';

  @override
  Widget toWidget() => Row(
    crossAxisAlignment: crossAxisAlignment,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    spacing: spacing,
    textBaseline: textBaseline,
    textDirection: textDirection,
    verticalDirection: verticalDirection,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaRow? decode(dynamic data) {
    return NapaRow(
      crossAxisAlignment: decodeCrossAxisAlignment(data['crossAxisAlignment']),
      mainAxisAlignment: decodeMainAxisAlignment(data['mainAxisAlignment']),
      mainAxisSize: decodeMainAxisSize(data['mainAxisSize']),
      spacing: data['spacing'],
      textBaseline: decodeTextBaseline(data['textBaseline']),
      textDirection: decodeTextDirection(data['textDirection']),
      verticalDirection: decodeVerticalDirection(data['verticalDirection']),
      children: decodeChildren(data['children']),
    );
  }

}