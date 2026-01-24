import 'dart:ui';
import '../tojson_extensions.dart';
import 'napa_color_filter.dart';
import 'napa_image_filter.dart';
import 'napa_mask_filter.dart';
import 'napa_shader.dart';

class NapaPaint {
  BlendMode blendMode;
  Color color;
  NapaColorFilter? colorFilter;
  FilterQuality filterQuality;
  NapaImageFilter? imageFilter;
  bool invertColors;
  bool isAntiAlias;
  NapaMaskFilter? maskFilter;
  NapaShader? shader;
  StrokeCap strokeCap;
  StrokeJoin strokeJoin;
  double strokeMiterLimit;
  double strokeWidth;
  PaintingStyle style;

  NapaPaint({
    this.isAntiAlias = true,
    this.color = const Color(0xff000000),
    this.blendMode = BlendMode.srcOver,
    this.style = .fill,
    this.strokeWidth = 0.0,
    this.strokeCap = .butt,
    this.strokeJoin = .miter,
    this.strokeMiterLimit = 4.0,
    this.maskFilter,
    this.filterQuality = .none,
    this.shader,
    this.colorFilter,
    this.imageFilter,
    this.invertColors = false,
  });

  Paint get paint => Paint()
    ..isAntiAlias = isAntiAlias
    ..color = color
    ..blendMode = blendMode
    ..style = style
    ..strokeWidth = strokeWidth
    ..strokeCap = strokeCap
    ..strokeJoin = strokeJoin
    ..strokeMiterLimit = strokeMiterLimit
    ..maskFilter = maskFilter?.maskFilter
    ..filterQuality = filterQuality
    //..shader=shader
    ..colorFilter = colorFilter?.colorFilter
    ..imageFilter = imageFilter?.imageFilter
    ..invertColors = invertColors;

  dynamic toJson() {
    return <String, dynamic>{
      'isAntiAlias': isAntiAlias,
      'color': color.toJson(),
      'blendMode': blendMode.name,
      'style': style.name,
      'strokeWidth': strokeWidth,
      'strokeCap': strokeCap.name,
      'strokeJoin': strokeJoin.name,
      'strokeMiterLimit': strokeMiterLimit,
      if (maskFilter != null) 'maskFilter': maskFilter?.toJson(),
      'filterQuality': filterQuality.name,
      if (shader != null) 'shader': shader?.toJson(),
      if (colorFilter != null) 'colorFilter': colorFilter?.toJson(),
      if (imageFilter != null) 'imageFilter': imageFilter?.toJson(),
      'invertColors': invertColors,
    };
  }

  static NapaPaint? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaPaint(
      isAntiAlias: data['isAntiAlias'],
      color: decodeColor(data['color'])!,
      blendMode: decodeBlendMode(data['blendMode'])!,
      style: decodePaintintStyle(data['style']),
      strokeWidth: data['strokeWidth'],
      strokeCap: decodeStrokeCap(data['strokeCap']),
      strokeJoin: decodeStrokeJoin(data['strokeJoin']),
      strokeMiterLimit: data['strokeMiterLimit'],
      maskFilter: NapaMaskFilter.decode(data['maskFilter']),
      filterQuality: decodeFilterQuality(data['filterQuality']),
      //shader: decodeShader(data['shader']),
      colorFilter: NapaColorFilter.decode(data['colorFilter']),
      imageFilter: NapaImageFilter.decode(data['imageFilter']),
      invertColors: data['invertColors']
    );
  }
}
