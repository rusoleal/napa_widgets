import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';

/// Wrapper class for [ScrollView].
/// https://api.flutter.dev/flutter/widgets/ScrollView-class.html
///
abstract class NapaScrollView extends NapaStatelessWidget {
  double anchor;
  double? cacheExtent;
  Clip clipBehavior;
  DragStartBehavior dragStartBehavior;
  HitTestBehavior hitTestBehavior;
  ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  SliverPaintOrder paintOrder;
  ScrollPhysics? physics;
  bool? primary;
  bool reverse;
  ScrollBehavior? scrollBehavior;
  Axis scrollDirection;
  int? semanticChildCount;
  bool shrinkWrap;

  NapaScrollView({
    super.childMode,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.physics,
    this.scrollBehavior,
    this.shrinkWrap = false,
    this.anchor = 0.0,
    this.cacheExtent,
    this.semanticChildCount,
    this.paintOrder = .firstIsTop,
    this.dragStartBehavior = .start,
    this.keyboardDismissBehavior,
    this.clipBehavior = .hardEdge,
    this.hitTestBehavior = .opaque,
  }) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'anchor',
        getValue: (obj) => anchor,
        setValue: (obj, value, customData) => anchor = value,
      ),
      InspectableProperty<double>(
        name: 'cacheExtent',
        nullable: true,
        getValue: (obj) => cacheExtent,
        setValue: (obj, value, customData) => cacheExtent = value,
      ),
      InspectableProperty<Enum>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value,
        values: () => Clip.values,
      ),
      InspectableProperty<Enum>(
        name: 'dragStartBehavior',
        getValue: (obj) => dragStartBehavior,
        setValue: (obj, value, customData) => dragStartBehavior = value,
        values: () => DragStartBehavior.values,
      ),
      InspectableProperty<Enum>(
        name: 'hitTestBehavior',
        getValue: (obj) => hitTestBehavior,
        setValue: (obj, value, customData) => hitTestBehavior = value,
        values: () => HitTestBehavior.values,
      ),
      InspectableProperty<Enum>(
        name: 'keyboardDismissBehavior',
        nullable: true,
        getValue: (obj) => keyboardDismissBehavior,
        setValue: (obj, value, customData) => keyboardDismissBehavior = value,
        values: () => ScrollViewKeyboardDismissBehavior.values,
      ),
      InspectableProperty<Enum>(
        name: 'paintOrder',
        getValue: (obj) => paintOrder,
        setValue: (obj, value, customData) => paintOrder = value,
        values: () => SliverPaintOrder.values,
      ),
      InspectableProperty<bool>(
        name: 'primary',
        nullable: true,
        getValue: (obj) => primary,
        setValue: (obj, value, customData) => primary = value,
      ),
      InspectableProperty<bool>(
        name: 'reverse',
        getValue: (obj) => reverse,
        setValue: (obj, value, customData) => reverse = value,
      ),
      InspectableProperty<Enum>(
        name: 'scrollDirection',
        getValue: (obj) => scrollDirection,
        setValue: (obj, value, customData) => scrollDirection = value,
        values: () => Axis.values,
      ),
      InspectableProperty<int>(
        name: 'semanticChildCount',
        nullable: true,
        getValue: (obj) => semanticChildCount,
        setValue: (obj, value, customData) => semanticChildCount = value,
      ),
      InspectableProperty<bool>(
        name: 'shrinkWrap',
        getValue: (obj) => shrinkWrap,
        setValue: (obj, value, customData) => shrinkWrap = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      'anchor': anchor,
      if (cacheExtent != null) 'cacheExtent': cacheExtent,
      'clipBehavior': clipBehavior.name,
      'dragStartBehavior': dragStartBehavior.name,
      'hitTestBehavior': hitTestBehavior.name,
      if (keyboardDismissBehavior != null)
        'keyboardDismissBehavior': keyboardDismissBehavior!.name,
      'paintOrder': paintOrder.name,
      //if (physics != null)
      //  'physics': physics!.toJson(),
      if (primary != null) 'primary': primary,
      'reverse': reverse,
      //if (scrollBehavior != null)
      //  'scrollBehavior': scrollBehavior,
      'scrollDirection': scrollDirection.name,
      if (semanticChildCount != null) 'semanticChildCount': semanticChildCount,
      'shrinkWrap': shrinkWrap,
    });
  }

  @override
  String get widgetName => 'ScrollView';
}
