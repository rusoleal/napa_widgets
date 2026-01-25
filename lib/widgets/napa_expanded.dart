import 'package:flutter/widgets.dart';
import 'napa_container.dart';
import 'napa_flexible.dart';
import 'napa_widget.dart';

/// Wrapper class for [Expanded].
/// https://api.flutter.dev/flutter/widgets/Expanded-class.html
///
class NapaExpanded extends NapaFlexible {
  NapaExpanded({super.flex, required super.child}) {
    properties.removeWhere((element) => element.name == 'fit');
  }

  @override
  String get widgetName => 'Expanded';

  @override
  Widget toWidget() => Expanded(flex: flex, child: child.toWidget());

  static NapaWidget? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    int flex = data['flex'];

    return NapaExpanded(
      flex: flex,
      child: NapaWidget.decode(data['child']) ?? NapaContainer(),
    );
  }
}
