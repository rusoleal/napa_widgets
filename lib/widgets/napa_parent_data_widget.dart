
import 'package:flutter/widgets.dart';
import 'napa_proxy_widget.dart';

/// Wrapper class for [ParentDataWidget].
/// https://api.flutter.dev/flutter/widgets/ParentDataWidget-class.html
///
abstract class NapaParentDataWidget extends NapaProxyWidget {

  NapaParentDataWidget({required super.child});

  @override
  String get widgetName => 'ParentDataWidget';
}