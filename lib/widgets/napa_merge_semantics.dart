import 'package:flutter/widgets.dart';
import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [MergeSemantics].
/// https://api.flutter.dev/flutter/widgets/MergeSemantics-class.html
///
class NapaMergeSemantics extends NapaSingleChildRenderObjectWidget {
  NapaMergeSemantics({super.child});

  @override
  String get widgetName => 'MergeSemantics';

  @override
  Widget toWidget() => MergeSemantics(
    child: child?.toWidget(),
  );

  static NapaMergeSemantics? decode(dynamic data) {
    if (data == null) return null;
    return NapaMergeSemantics(
      child: NapaWidget.decode(data['child']),
    );
  }
}
