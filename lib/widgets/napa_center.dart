import 'package:flutter/widgets.dart';
import 'napa_align.dart';
import 'napa_widget.dart';

/// Wrapper class for [Center].
/// https://api.flutter.dev/flutter/widgets/Center-class.html
///
class NapaCenter extends NapaAlign {
  NapaCenter({super.widthFactor, super.heightFactor, super.child});

  @override
  String get widgetName => 'Center';

  @override
  toJson() {
    // remove alignment property.
    var toReturn = super.toJson();
    (toReturn as Map<String,dynamic>).remove('alignment');
    return toReturn;
  }

  @override
  Widget toWidget() {
    return Center(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child?.toWidget(),
    );
  }

  static NapaCenter? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaCenter(
      widthFactor: data['widthFactor'],
      heightFactor: data['heightFactor'],
      child: NapaWidget.decode(data['child']),
    );
  }
}
