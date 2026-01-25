import 'package:flutter/widgets.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [ClipRect].
/// https://api.flutter.dev/flutter/widgets/ClipRect-class.html
///
class NapaClipRect extends NapaSingleChildRenderObjectWidget {
  CustomClipper<Rect>? clipper;
  Clip clipBehavior;

  NapaClipRect({super.child, this.clipper, this.clipBehavior = Clip.hardEdge});

  @override
  toJson() {
    var toReturn = super.toJson()..addAll({'clipBehavior': clipBehavior.name});
    toReturn['_name'] = widgetName;
    return toReturn;
  }

  @override
  String get widgetName => 'ClipRect';

  @override
  Widget toWidget() => ClipRect(
    clipper: clipper,
    clipBehavior: clipBehavior,
    child: child?.toWidget(),
  );

  static NapaClipRect? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaClipRect(
      clipBehavior: decodeClip(data['clipBehavior']),
      child: NapaWidget.decode(data['child'])
    );
  }
}
