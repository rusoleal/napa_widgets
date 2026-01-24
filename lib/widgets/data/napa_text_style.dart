import 'package:flutter/material.dart';
import '../tojson_extensions.dart';
import 'napa_paint.dart';
import 'napa_text_decoration.dart';

class NapaTextStyle {
  bool inherit;
  Color? color;
  Color? backgroundColor;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  TextBaseline? textBaseline;
  double? height;
  TextLeadingDistribution? leadingDistribution;
  Locale? locale;
  NapaPaint? foreground;
  NapaPaint? background;
  List<Shadow>? shadows;
  List<FontFeature>? fontFeatures;
  List<FontVariation>? fontVariations;
  List<NapaTextDecoration>? decoration;
  Color? decorationColor;
  TextDecorationStyle? decorationStyle;
  double? decorationThickness;
  String? debugLabel;
  String? fontFamily;
  List<String>? fontFamilyFallback;
  String? package;
  TextOverflow? overflow;

  NapaTextStyle({
    this.inherit = true,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
    this.overflow,
  });

  TextStyle get textStyle => TextStyle(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    leadingDistribution: leadingDistribution,
    locale: locale,
    foreground: foreground?.paint,
    background: background?.paint,
    shadows: shadows,
    fontFeatures: fontFeatures,
    fontVariations: fontVariations,
    decoration: _getDecoration(),
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    package: package,
    overflow: overflow,
  );

  TextDecoration? _getDecoration() {
    if (decoration == null) {
      return null;
    }

    return TextDecoration.combine(
      decoration!.map((e) {
        switch (e) {
          case .linethrough:
            return TextDecoration.lineThrough;
          case .none:
            return TextDecoration.none;
          case .overline:
            return TextDecoration.overline;
          case .underline:
            return TextDecoration.underline;
        }
      }).toList(),
    );
  }

  dynamic toJson() {
    return <String, dynamic>{
      'inherit': inherit,
      if (color != null) 'color': color!.toJson(),
      if (backgroundColor != null) 'backgroundColor': backgroundColor!.toJson(),
      if (fontSize != null) 'fontSize': fontSize!,
      if (fontWeight != null) 'fontWeight': fontWeight!.value,
      if (fontStyle != null) 'fontStyle': fontStyle!.name,
      if (letterSpacing != null) 'letterSpacing': letterSpacing!,
      if (wordSpacing != null) 'wordSpacing': wordSpacing!,
      if (textBaseline != null) 'textBaseline': textBaseline!.name,
      if (height != null) 'height': height!,
      if (leadingDistribution != null)
        'leadingDistribution': leadingDistribution!.name,
      if (locale != null) 'locale': locale!.toJson(),
      if (foreground != null) 'foreground': foreground!.toJson(),
      if (background != null) 'background': background!.toJson(),
      if (shadows != null) 'shadows': shadows!.map((e) => e.toJson()).toList(),
      if (fontFeatures != null)
        'fontFeatures': fontFeatures!.map((e) => e.toJson()).toList(),
      if (fontVariations != null)
        'fontVariations': fontVariations!.map((e) => e.toJson()).toList(),
      if (decoration != null)
        'decoration': decoration!.map((e) => e.name).toList(),
      if (decorationColor != null) 'decorationColor': decorationColor!.toJson(),
      if (decorationStyle != null) 'decorationStyle': decorationStyle!.name,
      if (decorationThickness != null)
        'decorationThickness': decorationThickness!,
      if (debugLabel != null) 'debugLabel': debugLabel,
      if (fontFamily != null) 'fontFamily': fontFamily,
      if (fontFamilyFallback != null) 'fontFamilyFallback': fontFamilyFallback!,
      if (package != null) 'package': package!,
      if (overflow != null) 'overflow': overflow!.name,
    };
  }

  static NapaTextStyle? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaTextStyle(
      inherit: data['inherit'],
      color: decodeColor(data['color']),
      backgroundColor: decodeColor(data['backgroundColor']),
      fontSize: data['fontSize'],
      fontWeight: decodeFontWeight(data['fontWeight']),
      fontStyle: decodeFontStyle(data['fontStyle']),
      letterSpacing: data['letterSpacing'],
      wordSpacing: data['wordSpacing'],
      textBaseline: decodeTextBaseline(data['textBaseline']),
      height: data['height'],
      leadingDistribution: decodeTextLeadingDistribution(data['leadingDistribution']),
      locale: decodeLocale(data['locale']),
      foreground: NapaPaint.decode(data['foreground']),
      background: NapaPaint.decode(data['background']),
      shadows: decodeShadows(data['shadows']),
      fontFeatures: decodeFontFeatures(data['fontFeatures']),
      fontVariations: decodeFontVariations(data['fontVariations']),
      decoration: decodeNapaTextDecorationList(data['decoration']),
      decorationColor: decodeColor(data['decorationColor']),
      decorationStyle: decodeTextDecorationStyle(data['decorationStyle']),
      decorationThickness: data['decorationThickness'],
      debugLabel: data['debugLabel'],
      fontFamily: data['fontFamily'],
      fontFamilyFallback: data['fontFamilyFallback'],
      package: data['package'],
      overflow: decodeTextOverflow(data['overflow'])
    );
  }
}
