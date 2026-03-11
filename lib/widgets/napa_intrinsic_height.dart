import 'package:flutter/widgets.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [IntrinsicHeight].
/// https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html
///
class NapaIntrinsicHeight extends NapaSingleChildRenderObjectWidget {
  NapaIntrinsicHeight({super.child});

  @override
  String get widgetName => 'IntrinsicHeight';

  @override
  Widget toWidget() => IntrinsicHeight(child: child?.toWidget());

  static NapaIntrinsicHeight? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaIntrinsicHeight(child: NapaWidget.decode(data['child']));
  }
}
