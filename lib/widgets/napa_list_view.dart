
import 'package:flutter/widgets.dart';
import 'napa_box_scroll_view.dart';

/// Wrapper class for [ListView].
/// https://api.flutter.dev/flutter/widgets/ListView-class.html
///
class NapaListView extends NapaBoxScrollView {

  @override
  String get widgetName => 'ListView';

  @override
  Widget toWidget() => ListView();

}