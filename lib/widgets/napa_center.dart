import 'package:flutter/widgets.dart';
import 'napa_align.dart';
import 'napa_widget.dart';

class NapaCenter extends NapaAlign {
  NapaCenter({super.widthFactor, super.heightFactor, super.child});

  @override
  String get widgetName => 'Center';

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
