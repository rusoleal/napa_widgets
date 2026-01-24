import 'package:flutter/widgets.dart';

import 'napa_single_child_render_object_widget.dart';

class NapaClipPath extends NapaSingleChildRenderObjectWidget {
  CustomClipper<Path>? clipper;
  Clip clipBehavior;

  NapaClipPath({super.child, this.clipper, this.clipBehavior = Clip.antiAlias});

  @override
  toJson() {
    var toReturn = super.toJson()..addAll({'clipBehavior': clipBehavior.name});
    toReturn['_name'] = widgetName;
    return toReturn;
  }

  @override
  String get widgetName => 'ClipPath';

  @override
  Widget toWidget() => ClipPath(
    clipper: clipper,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );
}
