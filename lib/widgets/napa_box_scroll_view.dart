
import 'package:flutter/painting.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_scroll_view.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [BoxScrollView].
/// https://api.flutter.dev/flutter/widgets/BoxScrollView-class.html
///
abstract class NapaBoxScrollView extends NapaScrollView {

  EdgeInsetsGeometry? padding;

  NapaBoxScrollView({
    super.childMode,
    super.scrollDirection,
    super.reverse,
    super.primary,
    super.physics,
    super.shrinkWrap,
    this.padding,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.clipBehavior,
    super.hitTestBehavior
  }) {
    properties.addAll([
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'padding',
        nullable: true,
        getValue: (obj) => padding,
        setValue: (obj, value, customData) => padding = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String,dynamic>{
      if (padding != null)
        'padding': padding!.toJson(),
    });
  }

  @override
  String get widgetName => 'BoxScrollView';

}