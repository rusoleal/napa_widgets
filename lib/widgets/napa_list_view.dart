
import 'package:flutter/widgets.dart';
import 'napa_box_scroll_view.dart';

class NapaListView extends NapaBoxScrollView {

  @override
  toJson() {
    var toReturn = super.toJson();
    toReturn['_name'] = widgetName;
    return toReturn;
  }

  @override
  String get widgetName => 'ListView';

  @override
  Widget toWidget() => ListView();

}