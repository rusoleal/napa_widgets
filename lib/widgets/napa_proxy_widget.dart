
import 'package:flutter/widgets.dart';
import 'napa_widget.dart';

/// Wrapper class for [ProxyWidget].
/// https://api.flutter.dev/flutter/widgets/ProxyWidget-class.html
///
abstract class NapaProxyWidget extends NapaWidget {

  NapaWidget child;

  NapaProxyWidget({required this.child}):super(childMode: NapaChildMode.singleChild);

  @override
  toJson() {
    return super.toJson()..addAll(<String,dynamic>{
      'child': child.toJson()
    });
  }

  @override
  String get widgetName => 'ProxyWidget';
}