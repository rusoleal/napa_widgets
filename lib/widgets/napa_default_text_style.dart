import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_text_style.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [DefaultTextStyle].
/// https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html
///
class NapaDefaultTextStyle extends NapaStatelessWidget {
  NapaTextStyle style;
  TextAlign? textAlign;
  bool softWrap;
  TextOverflow overflow;
  int? maxLines;
  TextWidthBasis textWidthBasis;
  NapaWidget? child;

  NapaDefaultTextStyle({
    required this.style,
    this.textAlign,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
    this.child,
  }) : super(childMode: NapaChildMode.singleChild) {
    properties.addAll([
      InspectableProperty<NapaTextStyle>(
        name: 'style',
        getValue: (obj) => style,
        setValue: (obj, value, customData) => style = value,
      ),
      InspectableProperty<Enum>(
        name: 'textAlign',
        nullable: true,
        getValue: (obj) => textAlign,
        setValue: (obj, value, customData) => textAlign = value,
        values: () => TextAlign.values,
      ),
      InspectableProperty<bool>(
        name: 'softWrap',
        getValue: (obj) => softWrap,
        setValue: (obj, value, customData) => softWrap = value,
      ),
      InspectableProperty<Enum>(
        name: 'overflow',
        getValue: (obj) => overflow,
        setValue: (obj, value, customData) => overflow = value,
        values: () => TextOverflow.values,
      ),
      InspectableProperty<int>(
        name: 'maxLines',
        nullable: true,
        getValue: (obj) => maxLines,
        setValue: (obj, value, customData) => maxLines = value,
      ),
      InspectableProperty<Enum>(
        name: 'textWidthBasis',
        getValue: (obj) => textWidthBasis,
        setValue: (obj, value, customData) => textWidthBasis = value,
        values: () => TextWidthBasis.values,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'style': style.toJson(),
        if (textAlign != null) 'textAlign': textAlign!.name,
        'softWrap': softWrap,
        'overflow': overflow.name,
        if (maxLines != null) 'maxLines': maxLines,
        'textWidthBasis': textWidthBasis.name,
        if (child != null) 'child': child!.toJson(),
      });
  }

  @override
  String get widgetName => 'DefaultTextStyle';

  @override
  Widget toWidget() => DefaultTextStyle(
    style: style.textStyle,
    textAlign: textAlign,
    softWrap: softWrap,
    overflow: overflow,
    maxLines: maxLines,
    textWidthBasis: textWidthBasis,
    child: child?.toWidget() ?? const SizedBox.shrink(),
  );

  static NapaDefaultTextStyle? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaDefaultTextStyle(
      style: NapaTextStyle.decode(data['style'])!,
      textAlign: decodeTextAlign(data['textAlign']),
      softWrap: data['softWrap'] ?? true,
      overflow: decodeTextOverflow(data['overflow']) ?? TextOverflow.clip,
      maxLines: data['maxLines'],
      textWidthBasis:
          decodeTextWidthBasis(data['textWidthBasis']) ?? TextWidthBasis.parent,
      child: NapaWidget.decode(data['child']),
    );
  }
}
