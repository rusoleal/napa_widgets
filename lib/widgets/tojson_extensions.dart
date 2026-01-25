import 'dart:convert';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'data/image_wrapper.dart';
import 'napa_widget.dart';
import 'data/napa_text_decoration.dart';

NapaTextDecoration decodeNapaTextDecoration(String name) {
  switch (name) {
    case 'linethrough':
      return .linethrough;
    case 'overline':
      return .overline;
    case 'underline':
      return .underline;
    case 'none':
    default:
      return .none;
  }
}

List<NapaTextDecoration>? decodeNapaTextDecorationList(dynamic data) {
  if (data == null) {
    return null;
  }

  return data.map((e) {
    return decodeNapaTextDecoration(e);
  }).toList();
}

StrokeJoin decodeStrokeJoin(String name) {
  switch (name) {
    case 'bevel':
      return .bevel;
    case 'round':
      return .round;
    case 'miter':
    default:
      return .miter;
  }
}

StrokeCap decodeStrokeCap(String name) {
  switch (name) {
    case 'round':
      return .round;
    case 'square':
      return .square;
    case 'butt':
    default:
      return .butt;
  }
}

PaintingStyle decodePaintintStyle(String name) {
  switch (name) {
    case 'stroke':
      return .stroke;
    case 'fill':
    default:
      return .fill;
  }
}

extension FontFeatureToJson on FontFeature {
  dynamic toJson() {
    return <String, dynamic>{'feature': feature, 'value': value};
  }
}

List<FontFeature>? decodeFontFeatures(dynamic data) {
  if (data == null) {
    return null;
  }

  return data.map((e) {
    return FontFeature(e['feature'], e['value']);
  }).toList();
}

BlurStyle decodeBlurStyle(String name) {
  switch (name) {
    case 'inner':
      return .inner;
    case 'outer':
      return .outer;
    case 'normal':
      return .normal;
    case 'solid':
      return .solid;
    default:
      return .normal;
  }
}

TileMode? decodeTileMode(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'clamp':
      return TileMode.clamp;
    case 'decal':
      return TileMode.decal;
    case 'mirror':
      return TileMode.mirror;
    case 'repeated':
      return TileMode.repeated;
    default:
      return null;
  }
}

extension CustomPainterToJson on CustomPainter {
  dynamic toJson() {
    return <String, dynamic>{};
  }
}

extension ImageWrapperToJson on ImageWrapper {
  dynamic toJson() {
    return <String, dynamic>{'name': name, 'data': base64Encode(data)};
  }
}

ImageWrapper? decodeImageWrapper(dynamic data) {
  if (data == null) {
    return null;
  }

  return ImageWrapper(data['name'], base64Decode(data['data']));
}

extension EdgeInsetsGeometryToJson on EdgeInsetsGeometry {
  dynamic toJson() {
    EdgeInsets resolved = resolve(TextDirection.ltr);
    return <String, dynamic>{
      'bottom': resolved.bottom,
      'top': resolved.top,
      'left': resolved.left,
      'right': resolved.right,
    };
  }
}

EdgeInsetsGeometry? decodeEdgeInsetsGeometry(dynamic data) {
  if (data == null) {
    return null;
  }

  return EdgeInsetsGeometry.fromLTRB(
    data['left'],
    data['top'],
    data['right'],
    data['bottom'],
  );
}

extension AlignmentGeometryToJson on AlignmentGeometry {
  dynamic toJson() {
    Alignment resolved = resolve(TextDirection.ltr);
    return <String, dynamic>{'x': resolved.x, 'y': resolved.y};
  }
}

extension ColorToJson on Color {
  dynamic toJson() {
    return <String, dynamic>{
      'r': r,
      'g': g,
      'b': b,
      'a': a,
      'colorSpace': colorSpace.name,
    };
  }
}

/*extension Matrix4ToJson on Matrix4 {
  dynamic toJson() {
    return storage.toList();
  }
}

Matrix4? decodeMatrix4(dynamic data) {
  if (data == null) {
    return null;
  }

  return Matrix4.fromList(data);
}*/

extension RectToJson on Rect {
  dynamic toJson() {
    return <String, dynamic>{
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
    };
  }
}

Rect? decodeRect(dynamic data) {
  if (data == null) {
    return null;
  }
  return Rect.fromLTRB(
    data['left'],
    data['top'],
    data['right'],
    data['bottom'],
  );
}

extension DecorationToJson on Decoration {
  dynamic toJson() {
    if (this is BoxDecoration) {
      var box = this as BoxDecoration;
      return <String, dynamic>{
        '_type': 'BoxDecoration',
        'padding': box.padding.toJson(),
        //'image': box.image?.toJson(),
        'color': box.color?.toJson(),
        'backgroundBlendMode': box.backgroundBlendMode?.name,
        'border': box.border?.toJson(),
        'borderRadius': box.borderRadius?.toJson(),
        'boxShadow': box.boxShadow?.map((e) => e.toJson()).toList(),
        //'gradient': box.gradient?.toJson(),
        'shape': box.shape.name,
      };
    }

    return <String, dynamic>{'padding': padding.toJson()};
  }
}

Decoration? decodeDecoration(dynamic data) {
  if (data == null) {
    return null;
  }

  String type = data['_type'];
  switch (type) {
    case 'BoxDecoration':
      return BoxDecoration(
        color: decodeColor(data['color']),
        backgroundBlendMode: decodeBlendMode(data['backgroundBlendMode']),
        shape: decodeBoxShape(data['shape']),
      );
    default:
      return null;
  }
}

BoxShape decodeBoxShape(String name) {
  switch (name) {
    case 'circle':
      return BoxShape.circle;
    case 'rectangle':
      return BoxShape.rectangle;
    default:
      return BoxShape.rectangle;
  }
}

extension BoxShadowToJson on BoxShadow {
  dynamic toJson() {
    return <String, dynamic>{
      'blurRadius': blurRadius,
      'blurSigma': blurSigma,
      'blurStyle': blurStyle.name,
      'color': color.toJson(),
      'offset': offset.toJson(),
      'spreadRadius': spreadRadius,
    };
  }
}

extension OffsetToJson on Offset {
  dynamic toJson() {
    return <String, dynamic>{'dx': dx, 'dy': dy};
  }
}

Offset? decodeOffset(dynamic data) {
  if (data == null) {
    return null;
  }

  return Offset(data['dx'], data['dy']);
}

extension BorderRadiusGeometryToJson on BorderRadiusGeometry {
  dynamic toJson() {
    var resolved = resolve(null);
    return <String, dynamic>{
      'bottomLeft': resolved.bottomLeft.toJson(),
      'bottomRight': resolved.bottomRight.toJson(),
      'topLeft': resolved.topLeft.toJson(),
      'topRight': resolved.topRight.toJson(),
    };
  }
}

extension RadiusToJson on Radius {
  dynamic toJson() {
    return <String, dynamic>{'x': x, 'y': y};
  }
}

extension BoxBorderToJson on BoxBorder {
  dynamic toJson() {
    if (this is Border) {
      var border = this as Border;
      return {
        'left': border.left.toJson(),
        'top': border.top.toJson(),
        'right': border.right.toJson(),
        'bottom': border.bottom.toJson(),
      };
    }
    return null;
  }
}

extension BorderSideToJson on BorderSide {
  dynamic toJson() {
    return <String, dynamic>{
      'color': color.toJson(),
      'width': width,
      'strokeAlign': strokeAlign,
      'strokeInset': strokeInset,
      'strokeOffset': strokeOffset,
      'strokeOutset': strokeOutset,
      'style': style.name,
    };
  }
}

extension BoxConstraintsToJson on BoxConstraints {
  dynamic toJson() {
    return <String, dynamic>{
      'minWidth': minWidth,
      'maxWidth': maxWidth,
      'minHeight': minHeight,
      'maxHeight': maxHeight,
    };
  }
}

extension SizeToJson on Size {
  dynamic toJson() {
    return <String, dynamic>{'width': width, 'height': height};
  }
}

Size? decodeSize(dynamic data) {
  if (data == null) {
    return null;
  }

  return Size(data['width'], data['height']);
}

extension TextScalerToJson on TextScaler {
  dynamic toJson() {
    return <String, dynamic>{
      'type': 'linear',
      'textScaleFactor': textScaleFactor,
    };
  }
}

TextScaler? decodeTextScaler(dynamic data) {
  if (data == null) {
    return data;
  }

  return TextScaler.linear(data['textScaleFactor']);
}

extension TextHeightBehaviorToJson on TextHeightBehavior {
  dynamic toJson() {
    return <String, dynamic>{
      'applyHeightToFirstAscent': applyHeightToFirstAscent,
      'applyHeightToLastDescent': applyHeightToLastDescent,
      'leadingDistribution': leadingDistribution.name,
    };
  }
}

TextHeightBehavior? decodeTextHeightBehavior(dynamic data) {
  if (data == null) {
    return null;
  }

  return TextHeightBehavior(
    applyHeightToFirstAscent: data['applyHeightToFirstAscent'],
    applyHeightToLastDescent: data['applyHeightToLastDescent'],
    leadingDistribution: decodeTextLeadingDistribution(
      data['leadingDistribution'],
    )!,
  );
}

extension LocaleToJson on Locale {
  dynamic toJson() {
    return <String, dynamic>{
      'languageCode': languageCode,
      if (scriptCode != null) 'scriptCode': scriptCode!,
      if (countryCode != null) 'countryCode': countryCode!,
    };
  }
}

Locale? decodeLocale(dynamic data) {
  if (data == null) {
    return null;
  }

  return Locale.fromSubtags(
    languageCode: data['languageCode'],
    countryCode: data['countryCode'],
    scriptCode: data['scriptCode'],
  );
}

extension StrutStyleToJson on StrutStyle {
  dynamic toJson() {
    return <String, dynamic>{
      if (fontFamily != null) 'fontFamily': fontFamily!,
      if (fontFamilyFallback != null) 'fontFamilyFallback': fontFamilyFallback!,
      if (fontSize != null) 'fontSize': fontSize!,
      if (height != null) 'height': height!,
      if (leadingDistribution != null)
        'leadingDistribution': leadingDistribution!.name,
      if (leading != null) 'leading': leading!,
      if (fontWeight != null) 'fontWeight': fontWeight!.value,
      if (fontStyle != null) 'fontStyle': fontStyle!.name,
      if (forceStrutHeight != null) 'forceStrutHeight': forceStrutHeight!,
    };
  }
}

StrutStyle? decodeStrutStyle(dynamic data) {
  if (data == null) {
    return data;
  }

  return StrutStyle(
    fontFamily: data['fontFamily'],
    //fontFamilyFallback: ,
    fontSize: data['fontSize'],
    height: data['height'],
    leadingDistribution: decodeTextLeadingDistribution(
      data['leadingDistribution'],
    ),
    leading: data['leading'],
    fontWeight: decodeFontWeight(data['fontWeight']),
    fontStyle: decodeFontStyle(data['fontStyle']),
    forceStrutHeight: data['forceStrutHeight'],
  );
}

TextDecorationStyle? decodeTextDecorationStyle(String? name) {
  if (name == null) {
    return null;
  }
  switch (name) {
    case 'dashed':
      return TextDecorationStyle.dashed;
    case 'dotted':
      return TextDecorationStyle.dotted;
    case 'double':
      return TextDecorationStyle.double;
    case 'solid':
      return TextDecorationStyle.solid;
    case 'wavy':
      return TextDecorationStyle.wavy;
    default:
      return null;
  }
}

TextLeadingDistribution? decodeTextLeadingDistribution(String? name) {
  if (name == null) {
    return null;
  }
  switch (name) {
    case 'even':
      return TextLeadingDistribution.even;
    case 'proportional':
      return TextLeadingDistribution.proportional;
    default:
      return null;
  }
}

FontStyle? decodeFontStyle(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'italic':
      return FontStyle.italic;
    case 'normal':
      return FontStyle.normal;
    default:
      return null;
  }
}

FontWeight? decodeFontWeight(int? value) {
  if (value == null) {
    return null;
  }

  switch (value) {
    case 100:
      return FontWeight.w100;
    case 200:
      return FontWeight.w200;
    case 300:
      return FontWeight.w300;
    case 400:
      return FontWeight.w400;
    case 500:
      return FontWeight.w500;
    case 600:
      return FontWeight.w600;
    case 700:
      return FontWeight.w700;
    case 800:
      return FontWeight.w800;
    case 900:
      return FontWeight.w900;
    default:
      return null;
  }
}

extension FontVariationToJson on FontVariation {
  dynamic toJson() {
    return <String, dynamic>{'axis': axis, 'value': value};
  }
}

List<FontVariation>? decodeFontVariations(dynamic data) {
  if (data == null) {
    return null;
  }

  return data.map((e) {
    return FontVariation(e['axis'], e['value']);
  }).toList();
}

extension ShadowToJson on Shadow {
  dynamic toJson() {
    return <String, dynamic>{
      'color': color.toJson(),
      'offset': offset.toJson(),
      'blurRadius': blurRadius,
    };
  }
}

List<Shadow>? decodeShadows(dynamic data) {
  if (data == null) {
    return null;
  }

  return data
      .map(
        (e) => Shadow(
          color: decodeColor(e['color'])!,
          offset: decodeOffset(e['offset'])!,
          blurRadius: e['blurRadius'],
        ),
      )
      .toList();
}

Axis decodeAxis(String name) {
  switch (name) {
    case 'horizontal':
      return Axis.horizontal;
    case 'vertical':
      return Axis.vertical;
  }
  throw Exception('Axis unknown value: $name');
}

Clip decodeClip(String name) {
  switch (name) {
    case 'antiAlias':
      return Clip.antiAlias;
    case 'antiAliasWithSaveLayer':
      return Clip.antiAliasWithSaveLayer;
    case 'hardEdge':
      return Clip.hardEdge;
    case 'none':
      return Clip.none;
  }
  throw Exception('Clip unknown value: $name');
}

CrossAxisAlignment decodeCrossAxisAlignment(String name) {
  switch (name) {
    case 'baseline':
      return CrossAxisAlignment.baseline;
    case 'center':
      return CrossAxisAlignment.center;
    case 'end':
      return CrossAxisAlignment.end;
    case 'start':
      return CrossAxisAlignment.start;
    case 'stretch':
      return CrossAxisAlignment.stretch;
  }
  throw Exception('CrossAxisAlignment unknown value: $name');
}

MainAxisAlignment decodeMainAxisAlignment(String name) {
  switch (name) {
    case 'center':
      return MainAxisAlignment.center;
    case 'end':
      return MainAxisAlignment.end;
    case 'spaceAround':
      return MainAxisAlignment.spaceAround;
    case 'spaceBetween':
      return MainAxisAlignment.spaceBetween;
    case 'spaceEvenly':
      return MainAxisAlignment.spaceEvenly;
    case 'start':
      return MainAxisAlignment.start;
  }
  throw Exception('MainAxisAlignment unknown value: $name');
}

MainAxisSize decodeMainAxisSize(String name) {
  switch (name) {
    case 'min':
      return MainAxisSize.min;
    case 'max':
      return MainAxisSize.max;
  }
  throw Exception('MainAxisSize unknown value: $name');
}

TextBaseline? decodeTextBaseline(String? name) {
  if (name == null) {
    return null;
  }
  switch (name) {
    case 'alphabetic':
      return TextBaseline.alphabetic;
    case 'ideographic':
      return TextBaseline.ideographic;
  }
  throw Exception('TextBaseline unknown value: $name');
}

TextDirection? decodeTextDirection(String? name) {
  if (name == null) {
    return null;
  }
  switch (name) {
    case 'ltr':
      return TextDirection.ltr;
    case 'rtl':
      return TextDirection.rtl;
  }
  throw Exception('TextDirection unknown value: $name');
}

VerticalDirection decodeVerticalDirection(String name) {
  switch (name) {
    case 'down':
      return VerticalDirection.down;
    case 'up':
      return VerticalDirection.up;
  }
  throw Exception('VerticalDirection unknown value: $name');
}

ColorSpace decodeColorSpace(String? name) {
  if (name == null) {
    return ColorSpace.sRGB;
  }

  switch (name) {
    case 'sRGB':
      return ColorSpace.sRGB;
    case 'extendedSRGB':
      return ColorSpace.extendedSRGB;
    case 'displayP3':
      return ColorSpace.displayP3;
    default:
      return ColorSpace.sRGB;
  }
}

Color? decodeColor(dynamic data) {
  if (data is! Map) {
    return null;
  }

  double r = data['r'].toDouble();
  double g = data['g'].toDouble();
  double b = data['b'].toDouble();
  double a = data['a'].toDouble();
  ColorSpace cs = decodeColorSpace(data['colorSpace']);

  return Color.from(alpha: a, red: r, green: g, blue: b, colorSpace: cs);
}

BoxFit? decodeBoxFit(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'contain':
      return BoxFit.contain;
    case 'cover':
      return BoxFit.cover;
    case 'fill':
      return BoxFit.fill;
    case 'fitHeight':
      return BoxFit.fitHeight;
    case 'fitWidth':
      return BoxFit.fitWidth;
    case 'none':
      return BoxFit.none;
    case 'scaleDown':
      return BoxFit.scaleDown;
    default:
      return null;
  }
}

AlignmentGeometry? decodeAlignmentGeometry(dynamic data) {
  if (data == null) {
    return null;
  }

  return AlignmentGeometry.xy(data['x'], data['y']);
}

BlendMode? decodeBlendMode(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'clear':
      return BlendMode.clear;
    case 'color':
      return BlendMode.color;
    case 'colorBurn':
      return BlendMode.colorBurn;
    case 'colorDodge':
      return BlendMode.colorDodge;
    case 'darken':
      return BlendMode.darken;
    case 'difference':
      return BlendMode.difference;
    case 'dst':
      return BlendMode.dst;
    case 'dstATop':
      return BlendMode.dstATop;
    case 'dstIn':
      return BlendMode.dstIn;
    case 'dstOut':
      return BlendMode.dstOut;
    case 'dstOver':
      return BlendMode.dstOver;
    case 'exclusion':
      return BlendMode.exclusion;
    case 'hardLight':
      return BlendMode.hardLight;
    case 'hue':
      return BlendMode.hue;
    case 'lighten':
      return BlendMode.lighten;
    case 'luminosity':
      return BlendMode.luminosity;
    case 'modulate':
      return BlendMode.modulate;
    case 'multiply':
      return BlendMode.multiply;
    case 'overlay':
      return BlendMode.overlay;
    case 'plus':
      return BlendMode.plus;
    case 'saturation':
      return BlendMode.saturation;
    case 'screen':
      return BlendMode.screen;
    case 'softLight':
      return BlendMode.softLight;
    case 'src':
      return BlendMode.src;
    case 'srcATop':
      return BlendMode.srcATop;
    case 'srcIn':
      return BlendMode.srcIn;
    case 'srcOut':
      return BlendMode.srcOut;
    case 'srcOver':
      return BlendMode.srcOver;
    case 'xor':
      return BlendMode.xor;
    default:
      return BlendMode.srcOver;
  }
}

DecorationPosition decodeDecorationPosition(String name) {
  switch (name) {
    case 'foreground':
      return DecorationPosition.foreground;
    case 'background':
    default:
      return DecorationPosition.background;
  }
}

FlexFit decodeFlexFit(String name) {
  switch (name) {
    case 'tight':
      return FlexFit.tight;
    case 'loose':
    default:
      return FlexFit.loose;
  }
}

StackFit decodeStackFit(String name) {
  switch (name) {
    case 'expand':
      return StackFit.expand;
    case 'passthrough':
      return StackFit.passthrough;
    case 'loose':
    default:
      return StackFit.loose;
  }
}

TextOverflow? decodeTextOverflow(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'clip':
      return TextOverflow.clip;
    case 'ellipsis':
      return TextOverflow.ellipsis;
    case 'fade':
      return TextOverflow.fade;
    case 'visible':
      return TextOverflow.visible;
    default:
      return null;
  }
}

TextAlign? decodeTextAlign(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'center':
      return TextAlign.center;
    case 'end':
      return TextAlign.end;
    case 'justify':
      return TextAlign.justify;
    case 'left':
      return TextAlign.left;
    case 'right':
      return TextAlign.right;
    case 'start':
      return TextAlign.start;
    default:
      return null;
  }
}

TextWidthBasis? decodeTextWidthBasis(String? name) {
  if (name == null) {
    return null;
  }

  switch (name) {
    case 'longestLine':
      return TextWidthBasis.longestLine;
    case 'parent':
      return TextWidthBasis.parent;
    default:
      return null;
  }
}

WrapAlignment decodeWrapAlignment(String name) {
  switch (name) {
    case 'center':
      return WrapAlignment.center;
    case 'end':
      return WrapAlignment.end;
    case 'spaceAround':
      return WrapAlignment.spaceAround;
    case 'spaceBetween':
      return WrapAlignment.spaceBetween;
    case 'spaceEvently':
      return WrapAlignment.spaceEvenly;
    case 'start':
    default:
      return WrapAlignment.start;
  }
}

WrapCrossAlignment decodeWrapCrossAlignment(String name) {
  switch (name) {
    case 'center':
      return WrapCrossAlignment.center;
    case 'end':
      return WrapCrossAlignment.end;
    case 'start':
    default:
      return WrapCrossAlignment.start;
  }
}

ImageRepeat decodeImageRepeat(String name) {
  switch (name) {
    case 'repeat':
      return ImageRepeat.repeat;
    case 'repeatX':
      return ImageRepeat.repeatX;
    case 'repeatY':
      return ImageRepeat.repeatY;
    case 'noRepeat':
    default:
      return ImageRepeat.noRepeat;
  }
}

FilterQuality decodeFilterQuality(String name) {
  switch (name) {
    case 'high':
      return FilterQuality.high;
    case 'low':
      return FilterQuality.low;
    case 'none':
      return FilterQuality.none;
    case 'medium':
    default:
      return FilterQuality.medium;
  }
}

List<NapaWidget>? decodeChildren(List<dynamic>? children) {
  if (children == null) {
    return null;
  }
  List<NapaWidget> toReturn = [];
  for (var child in children) {
    var widget = NapaWidget.decode(child);
    if (widget != null) {
      toReturn.add(widget);
    }
  }
  return toReturn;
}
