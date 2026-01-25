
import 'package:flutter/cupertino.dart';

import 'napa_scroll_view.dart';

/// Wrapper class for [BoxScrollView].
/// https://api.flutter.dev/flutter/widgets/BoxScrollView-class.html
///
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