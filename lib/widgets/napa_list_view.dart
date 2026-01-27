import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/napa_widgets.dart';

/// Wrapper class for [ListView].
/// https://api.flutter.dev/flutter/widgets/ListView-class.html
///
class NapaListView extends NapaBoxScrollView {
  double? itemExtent;
  NapaWidget? prototypeItem;
  bool addAutomaticKeepAlives;
  bool addRepaintBoundaries;
  bool addSemanticIndexes;
  List<NapaWidget> children;

  NapaListView({
    super.scrollDirection,
    super.reverse,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.itemExtent,
    this.prototypeItem,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    super.cacheExtent,
    List<NapaWidget>? children,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.clipBehavior,
    super.hitTestBehavior,
  }) : children = children ?? [],
       super(childMode: NapaChildMode.multipleChildren) {
    properties.addAll([
      InspectableProperty<double>(
        name: 'itemExtent',
        nullable: true,
        getValue: (obj) => itemExtent,
        setValue: (obj, value, customData) => itemExtent = value,
      ),
      InspectableProperty<bool>(
        name: 'addAutomaticKeepAlives',
        getValue: (obj) => addAutomaticKeepAlives,
        setValue: (obj, value, customData) => addAutomaticKeepAlives = value,
      ),
      InspectableProperty<bool>(
        name: 'addRepaintBoundaries',
        getValue: (obj) => addRepaintBoundaries,
        setValue: (obj, value, customData) => addRepaintBoundaries = value,
      ),
      InspectableProperty<bool>(
        name: 'addSemanticIndexes',
        getValue: (obj) => addSemanticIndexes,
        setValue: (obj, value, customData) => addSemanticIndexes = value,
      ),
    ]);
  }

  @override
  String get widgetName => 'ListView';

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      if (itemExtent != null) 'itemExtent': itemExtent,
      if (prototypeItem != null) 'prototypeItem': prototypeItem!.toJson(),
      'addAutomaticKeepAlives': addAutomaticKeepAlives,
      'addRepaintBoundaries': addRepaintBoundaries,
      'addSemanticIndexes': addSemanticIndexes,
      'children': children.map((e) => e.toJson()).toList(),
    });
  }

  @override
  Widget toWidget() => ListView(
    scrollDirection: scrollDirection,
    reverse: reverse,
    primary: primary,
    physics: physics,
    shrinkWrap: shrinkWrap,
    padding: padding,
    itemExtent: itemExtent,
    prototypeItem: prototypeItem?.toWidget(),
    addAutomaticKeepAlives: addAutomaticKeepAlives,
    addRepaintBoundaries: addRepaintBoundaries,
    addSemanticIndexes: addSemanticIndexes,
    cacheExtent: cacheExtent,
    semanticChildCount: semanticChildCount,
    dragStartBehavior: dragStartBehavior,
    keyboardDismissBehavior: keyboardDismissBehavior,
    clipBehavior: clipBehavior,
    hitTestBehavior: hitTestBehavior,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaListView? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaListView(
      scrollDirection: decodeAxis(data['scrollDirection']),
      reverse: data['reverse'],
      primary: data['primary'],
      //physics: decodePhysics(data['physics']),
      shrinkWrap: data['shrinkWrap'],
      padding: decodeEdgeInsetsGeometry(data['padding']),
      itemExtent: data['itemExtent'],
      prototypeItem: NapaWidget.decode(data['prototypeItem']),
      addAutomaticKeepAlives: data[''],
      addRepaintBoundaries: data[''],
      addSemanticIndexes: data[''],
      cacheExtent: data['cacheExtent'],
      semanticChildCount: data['semanticChildCount'],
      dragStartBehavior: decodeDragStartBehavior(data['dragStartBehavior']),
      keyboardDismissBehavior: decodeScrollViewKeyboardDismissBehavior(
        data['keyboardDismissBehavior'],
      ),
      clipBehavior: decodeClip(data['clipBehavior']),
      hitTestBehavior: decodeHitTestBehavior(data['hitTestBehavior']),
      children: decodeChildren(data['children']),
    );
  }
}
