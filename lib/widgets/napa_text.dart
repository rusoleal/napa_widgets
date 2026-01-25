import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/napa_text_scaler.dart';
import 'data/napa_text_style.dart';
import 'napa_stateless_widget.dart';
import 'tojson_extensions.dart';

/// Wrapper class for [Text].
/// https://api.flutter.dev/flutter/widgets/Text-class.html
///
class NapaText extends NapaStatelessWidget {
  String text;
  NapaTextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  TextOverflow? overflow;
  NapaTextScaler? textScaler;
  int? maxLines;
  String? semanticsLabel;
  String? semanticsIdentifier;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;
  Color? selectionColor;

  NapaText(this.text, {
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) {
    properties.addAll([
      InspectableProperty<String>(
        name: 'text',
        getValue: (obj) => text,
        setValue: (obj, value, customData) => text = value,
      ),
      InspectableProperty<NapaTextStyle>(
        name: 'style',
        nullable: true,
        getValue: (obj) => style,
        setValue: (obj, value, customData) => style = value,
      ),
      InspectableProperty<TextAlign>(
        name: 'textAlign',
        nullable: true,
        getValue: (obj) => textAlign,
        setValue: (obj, value, customData) => textAlign = value,
        values: () => TextAlign.values,
      ),
      InspectableProperty<TextDirection>(
        name: 'textDirection',
        nullable: true,
        getValue: (obj) => textDirection,
        setValue: (obj, value, customData) => textDirection = value,
        values: () => TextDirection.values,
      ),
      InspectableProperty<bool>(
        name: 'softWrap',
        nullable: true,
        getValue: (obj) => softWrap,
        setValue: (obj, value, customData) => softWrap = value,
      ),
      InspectableProperty<TextOverflow>(
        name: 'overflow',
        nullable: true,
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
      InspectableProperty<String>(
        name: 'semanticsLabel',
        nullable: true,
        getValue: (obj) => semanticsLabel,
        setValue: (obj, value, customData) => semanticsLabel = value,
      ),
      InspectableProperty<String>(
        name: 'semanticsIdentifier',
        nullable: true,
        getValue: (obj) => semanticsIdentifier,
        setValue: (obj, value, customData) => semanticsIdentifier = value,
      ),
      InspectableProperty<TextWidthBasis>(
        name: 'textWidthBasis',
        nullable: true,
        getValue: (obj) => textWidthBasis,
        setValue: (obj, value, customData) => textWidthBasis = value,
        values: () => TextWidthBasis.values,
      ),
      InspectableProperty<Color>(
        name: 'selectionColor',
        nullable: true,
        getValue: (obj) => selectionColor,
        setValue: (obj, value, customData) => selectionColor = value,
      ),
    ]);
  }

  @override
  String get widgetName => 'Text';

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      'text': text,
      if (style != null) 'style': style!.toJson(),
      if (strutStyle != null) 'strutStyle': strutStyle!.toJson(),
      if (textAlign != null) 'textAlign': textAlign!.name,
      if (textDirection != null) 'textDirection': textDirection!.name,
      if (locale != null) 'locale': locale!.toJson(),
      if (softWrap != null) 'softWrap': softWrap!,
      if (overflow != null) 'overflow': overflow!.name,
      if (textScaler != null) 'textScaler': textScaler!.toJson(),
      if (maxLines != null) 'maxLines': maxLines!,
      if (semanticsLabel != null) 'semanticsLabel': semanticsLabel!,
      if (semanticsIdentifier != null)
        'semanticsIdentifier': semanticsIdentifier!,
      if (textWidthBasis != null) 'textWidthBasis': textWidthBasis!.name,
      if (textHeightBehavior != null)
        'textHeightBehavior': textHeightBehavior!.toJson(),
      if (selectionColor != null) 'selectionColor': selectionColor!.toJson(),
    });
  }

  @override
  String toString() => '$widgetName("$text")';

  @override
  Widget toWidget() => Text(
    text,
    style: style?.textStyle,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaler: textScaler?.toTextScaler(),
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    semanticsIdentifier: semanticsIdentifier,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    selectionColor: selectionColor,
  );

  static NapaText? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaText(
      data['text'],
      style: NapaTextStyle.decode(data['style']),
      strutStyle: decodeStrutStyle(data['strutStyle']),
      textAlign: decodeTextAlign(data['textAlign']),
      textDirection: decodeTextDirection(data['textDirection']),
      locale: decodeLocale(data['locale']),
      softWrap: data['softWrap'],
      overflow: decodeTextOverflow(data['overflow']),
      textScaler: NapaTextScaler.decode(data['textScaler']),
      maxLines: data['maxLines'],
      semanticsLabel: data['semanticsLabel'],
      semanticsIdentifier: data['semanticsIdentifier'],
      textWidthBasis: decodeTextWidthBasis(data['textWidthBasis']),
      textHeightBehavior: decodeTextHeightBehavior(data['textHeightBehavior']),
      selectionColor: decodeColor(data['selectionColor'])
    );
  }
}
