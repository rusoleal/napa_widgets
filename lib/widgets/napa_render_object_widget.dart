
import 'package:flutter/widgets.dart';
import 'napa_widget.dart';

/// Wrapper class for [RenderObjectWidget].
/// https://api.flutter.dev/flutter/widgets/RenderObjectWidget-class.html
///
abstract class NapaRenderObjectWidget extends NapaWidget {

  NapaRenderObjectWidget({super.childMode});

  @override
  String get widgetName => 'RenderObjectWidget';

}