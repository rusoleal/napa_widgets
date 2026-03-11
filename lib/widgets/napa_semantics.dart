import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';

/// Wrapper class for [Semantics].
/// https://api.flutter.dev/flutter/widgets/Semantics-class.html
///
class NapaSemantics extends NapaStatelessWidget {
  bool container;
  bool explicitChildNodes;
  bool excludeSemantics;
  bool? enabled;
  bool? checked;
  bool? selected;
  bool? button;
  bool? link;
  bool? header;
  bool? textField;
  bool? readOnly;
  bool? focusable;
  bool? focused;
  bool? hidden;
  bool? image;
  bool? liveRegion;
  bool? obscured;
  bool? multiline;
  bool? scopesRoute;
  bool? namesRoute;
  String? label;
  String? value;
  String? hint;
  NapaWidget? child;

  NapaSemantics({
    this.container = false,
    this.explicitChildNodes = false,
    this.excludeSemantics = false,
    this.enabled,
    this.checked,
    this.selected,
    this.button,
    this.link,
    this.header,
    this.textField,
    this.readOnly,
    this.focusable,
    this.focused,
    this.hidden,
    this.image,
    this.liveRegion,
    this.obscured,
    this.multiline,
    this.scopesRoute,
    this.namesRoute,
    this.label,
    this.value,
    this.hint,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'container',
        getValue: (obj) => container,
        setValue: (obj, value, customData) => container = value,
      ),
      InspectableProperty<bool>(
        name: 'explicitChildNodes',
        getValue: (obj) => explicitChildNodes,
        setValue: (obj, v, customData) => explicitChildNodes = v,
      ),
      InspectableProperty<bool>(
        name: 'excludeSemantics',
        getValue: (obj) => excludeSemantics,
        setValue: (obj, v, customData) => excludeSemantics = v,
      ),
      InspectableProperty<String>(
        name: 'label',
        nullable: true,
        getValue: (obj) => label,
        setValue: (obj, v, customData) => label = v,
      ),
      InspectableProperty<String>(
        name: 'value',
        nullable: true,
        getValue: (obj) => value,
        setValue: (obj, v, customData) => value = v,
      ),
      InspectableProperty<String>(
        name: 'hint',
        nullable: true,
        getValue: (obj) => hint,
        setValue: (obj, v, customData) => hint = v,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'container': container,
        'explicitChildNodes': explicitChildNodes,
        'excludeSemantics': excludeSemantics,
        if (enabled != null) 'enabled': enabled,
        if (checked != null) 'checked': checked,
        if (selected != null) 'selected': selected,
        if (button != null) 'button': button,
        if (link != null) 'link': link,
        if (header != null) 'header': header,
        if (textField != null) 'textField': textField,
        if (readOnly != null) 'readOnly': readOnly,
        if (focusable != null) 'focusable': focusable,
        if (focused != null) 'focused': focused,
        if (hidden != null) 'hidden': hidden,
        if (image != null) 'image': image,
        if (liveRegion != null) 'liveRegion': liveRegion,
        if (obscured != null) 'obscured': obscured,
        if (multiline != null) 'multiline': multiline,
        if (scopesRoute != null) 'scopesRoute': scopesRoute,
        if (namesRoute != null) 'namesRoute': namesRoute,
        if (label != null) 'label': label,
        if (value != null) 'value': value,
        if (hint != null) 'hint': hint,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'Semantics';

  @override
  Widget toWidget() => Semantics(
    container: container,
    explicitChildNodes: explicitChildNodes,
    excludeSemantics: excludeSemantics,
    enabled: enabled,
    checked: checked,
    selected: selected,
    button: button,
    link: link,
    header: header,
    textField: textField,
    readOnly: readOnly,
    focusable: focusable,
    focused: focused,
    hidden: hidden,
    image: image,
    liveRegion: liveRegion,
    obscured: obscured,
    multiline: multiline,
    scopesRoute: scopesRoute,
    namesRoute: namesRoute,
    label: label,
    value: value,
    hint: hint,
    child: child?.toWidget(),
  );

  static NapaSemantics? decode(dynamic data) {
    if (data == null) return null;
    return NapaSemantics(
      container: data['container'] ?? false,
      explicitChildNodes: data['explicitChildNodes'] ?? false,
      excludeSemantics: data['excludeSemantics'] ?? false,
      enabled: data['enabled'] as bool?,
      checked: data['checked'] as bool?,
      selected: data['selected'] as bool?,
      button: data['button'] as bool?,
      link: data['link'] as bool?,
      header: data['header'] as bool?,
      textField: data['textField'] as bool?,
      readOnly: data['readOnly'] as bool?,
      focusable: data['focusable'] as bool?,
      focused: data['focused'] as bool?,
      hidden: data['hidden'] as bool?,
      image: data['image'] as bool?,
      liveRegion: data['liveRegion'] as bool?,
      obscured: data['obscured'] as bool?,
      multiline: data['multiline'] as bool?,
      scopesRoute: data['scopesRoute'] as bool?,
      namesRoute: data['namesRoute'] as bool?,
      label: data['label'] as String?,
      value: data['value'] as String?,
      hint: data['hint'] as String?,
      child: NapaWidget.decode(data['child']),
    );
  }
}
