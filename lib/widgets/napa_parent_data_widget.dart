
import 'napa_proxy_widget.dart';

abstract class NapaParentDataWidget extends NapaProxyWidget {

  NapaParentDataWidget({required super.child});

  @override
  String get widgetName => 'ParentDataWidget';
}