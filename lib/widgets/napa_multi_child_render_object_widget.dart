import 'package:flutter/widgets.dart';

import 'napa_render_object_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [MultiChildRenderObjectWidget].
/// https://api.flutter.dev/flutter/widgets/MultiChildRenderObjectWidget-class.html
///
abstract class NapaMultiChildRenderObjectWidget extends NapaRenderObjectWidget {
  List<NapaWidget> children;

  NapaMultiChildRenderObjectWidget({List<NapaWidget>? children})
    : children = children ?? [],
      super(childMode: NapaChildMode.multipleChildren);

  @override
  dynamic toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      'children': children.map((e) => e.toJson()).toList(),
    });
  }

  @override
  String get widgetName => 'MultiChildRenderObjectWidget';
}
