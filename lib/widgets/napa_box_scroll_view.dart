
import 'napa_scroll_view.dart';

abstract class NapaBoxScrollView extends NapaScrollView {

  @override
  toJson() {
    var toReturn = super.toJson();
    toReturn['_name'] = widgetName;
    return toReturn;
  }

  @override
  String get widgetName => 'BoxScrollView';
  
}