import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/napa_widgets.dart';

/// Wrapper class for [GridView] (count variant).
/// https://api.flutter.dev/flutter/widgets/GridView-class.html
///
class NapaGridView extends NapaBoxScrollView {
  int crossAxisCount;
  double mainAxisSpacing;
  double crossAxisSpacing;
  double childAspectRatio;
  bool addAutomaticKeepAlives;
  bool addRepaintBoundaries;
  bool addSemanticIndexes;
  List<NapaWidget> children;

  NapaGridView({
    super.scrollDirection,
    super.reverse,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
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
      InspectableProperty<int>(
        name: 'crossAxisCount',
        getValue: (obj) => crossAxisCount,
        setValue: (obj, value, customData) => crossAxisCount = value,
        clamp: (1, 100),
      ),
      InspectableProperty<double>(
        name: 'mainAxisSpacing',
        getValue: (obj) => mainAxisSpacing,
        setValue: (obj, value, customData) => mainAxisSpacing = value,
        clamp: (0.0, double.infinity),
      ),
      InspectableProperty<double>(
        name: 'crossAxisSpacing',
        getValue: (obj) => crossAxisSpacing,
        setValue: (obj, value, customData) => crossAxisSpacing = value,
        clamp: (0.0, double.infinity),
      ),
      InspectableProperty<double>(
        name: 'childAspectRatio',
        getValue: (obj) => childAspectRatio,
        setValue: (obj, value, customData) => childAspectRatio = value,
        clamp: (0.0, double.infinity),
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
  String get widgetName => 'GridView';

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'crossAxisCount': crossAxisCount,
        'mainAxisSpacing': mainAxisSpacing,
        'crossAxisSpacing': crossAxisSpacing,
        'childAspectRatio': childAspectRatio,
        'addAutomaticKeepAlives': addAutomaticKeepAlives,
        'addRepaintBoundaries': addRepaintBoundaries,
        'addSemanticIndexes': addSemanticIndexes,
        'children': children.map((e) => e.toJson()).toList(),
      });
  }

  @override
  Widget toWidget() => GridView.count(
    scrollDirection: scrollDirection,
    reverse: reverse,
    primary: primary,
    physics: physics,
    shrinkWrap: shrinkWrap,
    padding: padding,
    crossAxisCount: crossAxisCount,
    mainAxisSpacing: mainAxisSpacing,
    crossAxisSpacing: crossAxisSpacing,
    childAspectRatio: childAspectRatio,
    addAutomaticKeepAlives: addAutomaticKeepAlives,
    addRepaintBoundaries: addRepaintBoundaries,
    addSemanticIndexes: addSemanticIndexes,
    cacheExtent: cacheExtent,
    semanticChildCount: semanticChildCount,
    dragStartBehavior: dragStartBehavior,
    keyboardDismissBehavior: keyboardDismissBehavior,
    clipBehavior: clipBehavior,
    children: children.map((e) => e.toWidget()).toList(),
  );

  static NapaGridView? decode(dynamic data) {
    if (data == null) return null;
    return NapaGridView(
      scrollDirection: decodeAxis(data['scrollDirection']),
      reverse: data['reverse'],
      primary: data['primary'],
      shrinkWrap: data['shrinkWrap'],
      padding: decodeEdgeInsetsGeometry(data['padding']),
      crossAxisCount: data['crossAxisCount'] ?? 2,
      mainAxisSpacing: (data['mainAxisSpacing'] as num? ?? 0).toDouble(),
      crossAxisSpacing: (data['crossAxisSpacing'] as num? ?? 0).toDouble(),
      childAspectRatio: (data['childAspectRatio'] as num? ?? 1).toDouble(),
      addAutomaticKeepAlives: data['addAutomaticKeepAlives'] ?? true,
      addRepaintBoundaries: data['addRepaintBoundaries'] ?? true,
      addSemanticIndexes: data['addSemanticIndexes'] ?? true,
      cacheExtent: (data['cacheExtent'] as num?)?.toDouble(),
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
