import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [SingleChildScrollView].
/// https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
///
class NapaSingleChildScrollView extends NapaStatelessWidget {
  Axis scrollDirection;
  bool reverse;
  EdgeInsetsGeometry? padding;
  Clip clipBehavior;
  DragStartBehavior dragStartBehavior;
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  NapaWidget? child;

  NapaSingleChildScrollView({
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.clipBehavior = Clip.hardEdge,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<Enum>(
        name: 'scrollDirection',
        getValue: (obj) => scrollDirection,
        setValue: (obj, value, customData) => scrollDirection = value,
        values: () => Axis.values,
      ),
      InspectableProperty<bool>(
        name: 'reverse',
        getValue: (obj) => reverse,
        setValue: (obj, value, customData) => reverse = value,
      ),
      InspectableProperty<EdgeInsetsGeometry>(
        name: 'padding',
        nullable: true,
        getValue: (obj) => padding,
        setValue: (obj, value, customData) => padding = value,
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
        name: 'keyboardDismissBehavior',
        getValue: (obj) => keyboardDismissBehavior,
        setValue: (obj, value, customData) => keyboardDismissBehavior = value,
        values: () => ScrollViewKeyboardDismissBehavior.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'scrollDirection': scrollDirection.name,
        'reverse': reverse,
        if (padding != null) 'padding': padding!.toJson(),
        'clipBehavior': clipBehavior.name,
        'dragStartBehavior': dragStartBehavior.name,
        'keyboardDismissBehavior': keyboardDismissBehavior.name,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'SingleChildScrollView';

  @override
  Widget toWidget() => SingleChildScrollView(
    scrollDirection: scrollDirection,
    reverse: reverse,
    padding: padding,
    clipBehavior: clipBehavior,
    dragStartBehavior: dragStartBehavior,
    keyboardDismissBehavior: keyboardDismissBehavior,
    child: child?.toWidget(),
  );

  static NapaSingleChildScrollView? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaSingleChildScrollView(
      scrollDirection: decodeAxis(data['scrollDirection']),
      reverse: data['reverse'] ?? false,
      padding: decodeEdgeInsetsGeometry(data['padding']),
      clipBehavior: decodeClip(data['clipBehavior']),
      dragStartBehavior: decodeDragStartBehavior(data['dragStartBehavior']),
      keyboardDismissBehavior: decodeScrollViewKeyboardDismissBehavior(
            data['keyboardDismissBehavior'],
          ) ??
          ScrollViewKeyboardDismissBehavior.manual,
      child: NapaWidget.decode(data['child']),
    );
  }
}
