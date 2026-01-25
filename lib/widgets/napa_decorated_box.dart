import 'package:flutter/widgets.dart';
import 'package:napa_widgets/widgets/tojson_extensions.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [DecoratedBox].
/// https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html
///
class NapaDecoratedBox extends NapaSingleChildRenderObjectWidget {
  Decoration decoration;
  DecorationPosition position;

  NapaDecoratedBox({
    super.child,
    required this.decoration,
    this.position = DecorationPosition.background,
  });

  @override
  toJson() {
    return super.toJson()
      ..addAll({'decoration': decoration.toJson(), 'position': position.name});
  }

  @override
  String get widgetName => 'DecoratedBox';

  @override
  Widget toWidget() => DecoratedBox(
    decoration: decoration,
    position: position,
    child: child?.toWidget(),
  );

  static NapaDecoratedBox? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaDecoratedBox(
      decoration: decodeDecoration(data['decoration'])!,
      position: decodeDecorationPosition(data['position']),
      child: NapaWidget.decode(data['child'])
    );
  }
}
