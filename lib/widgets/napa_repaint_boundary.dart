import 'package:flutter/widgets.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [RepaintBoundary].
/// https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html
///
class NapaRepaintBoundary extends NapaSingleChildRenderObjectWidget {
  NapaRepaintBoundary({super.child});

  @override
  String get widgetName => 'RepaintBoundary';

  @override
  Widget toWidget() {
    return RepaintBoundary(
      child: child?.toWidget(),
    );
  }

  static NapaRepaintBoundary? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaRepaintBoundary(
      child: NapaWidget.decode(data['child']),
    );
  }
}
