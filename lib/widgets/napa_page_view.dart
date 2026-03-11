import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [PageView].
/// https://api.flutter.dev/flutter/widgets/PageView-class.html
///
class NapaPageView extends NapaStatelessWidget {
  Axis scrollDirection;
  bool reverse;
  bool pageSnapping;
  bool allowImplicitScrolling;
  Clip clipBehavior;
  bool padEnds;
  DragStartBehavior dragStartBehavior;
  List<NapaWidget> children;

  NapaPageView({
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    this.pageSnapping = true,
    this.allowImplicitScrolling = false,
    this.clipBehavior = Clip.hardEdge,
    this.padEnds = true,
    this.dragStartBehavior = DragStartBehavior.start,
    List<NapaWidget>? children,
  }) : children = children ?? [],
       super(childMode: NapaChildMode.multipleChildren) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'scrollDirection',
        getValue: (obj) => scrollDirection,
        setValue: (obj, value, customData) => scrollDirection = value as Axis,
        values: () => Axis.values,
      ),
      InspectableProperty<bool>(
        name: 'reverse',
        getValue: (obj) => reverse,
        setValue: (obj, value, customData) => reverse = value,
      ),
      InspectableProperty<bool>(
        name: 'pageSnapping',
        getValue: (obj) => pageSnapping,
        setValue: (obj, value, customData) => pageSnapping = value,
      ),
      InspectableProperty<bool>(
        name: 'allowImplicitScrolling',
        getValue: (obj) => allowImplicitScrolling,
        setValue: (obj, value, customData) => allowImplicitScrolling = value,
      ),
      InspectableProperty<Enum>(
        name: 'clipBehavior',
        getValue: (obj) => clipBehavior,
        setValue: (obj, value, customData) => clipBehavior = value as Clip,
        values: () => Clip.values,
      ),
      InspectableProperty<bool>(
        name: 'padEnds',
        getValue: (obj) => padEnds,
        setValue: (obj, value, customData) => padEnds = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'scrollDirection': scrollDirection.name,
        'reverse': reverse,
        'pageSnapping': pageSnapping,
        'allowImplicitScrolling': allowImplicitScrolling,
        'clipBehavior': clipBehavior.name,
        'padEnds': padEnds,
        'dragStartBehavior': dragStartBehavior.name,
        'children': children.map((e) => e.toJson()).toList(),
      });
  }

  @override
  String get widgetName => 'PageView';

  @override
  Widget toWidget() => PageView(
    scrollDirection: scrollDirection,
    reverse: reverse,
    pageSnapping: pageSnapping,
    allowImplicitScrolling: allowImplicitScrolling,
    clipBehavior: clipBehavior,
    padEnds: padEnds,
    dragStartBehavior: dragStartBehavior,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaPageView? decode(dynamic data) {
    if (data == null) return null;
    return NapaPageView(
      scrollDirection: decodeAxis(data['scrollDirection'] ?? 'horizontal'),
      reverse: data['reverse'] ?? false,
      pageSnapping: data['pageSnapping'] ?? true,
      allowImplicitScrolling: data['allowImplicitScrolling'] ?? false,
      clipBehavior: decodeClip(data['clipBehavior'] ?? 'hardEdge'),
      padEnds: data['padEnds'] ?? true,
      dragStartBehavior: decodeDragStartBehavior(data['dragStartBehavior'] ?? 'start'),
      children: decodeChildren(data['children'] as List<dynamic>?) ?? [],
    );
  }
}
