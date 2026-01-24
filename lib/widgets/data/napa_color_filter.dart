
import 'dart:ui';
import '../tojson_extensions.dart';

abstract class NapaColorFilter {

  ColorFilter get colorFilter;

  dynamic toJson();

  static NapaColorFilter? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    switch (data['_type']) {
      case 'linearToSrgbGamma': return NapaColorFilterLinearToSrgbGamma();
      case 'matrix': return NapaColorFilterMatrix(data['matrix']);
      case 'mode': return NapaColorFilterMode(decodeColor(data['color'])!, decodeBlendMode(data['blendMode'])!);
      case 'srgbToLinearGamma': return NapaColorFilterSrgbToLinearGamma();
      default: return null;
    }
  }
}

class NapaColorFilterLinearToSrgbGamma extends NapaColorFilter {

  @override
  ColorFilter get colorFilter => ColorFilter.linearToSrgbGamma();

  @override
  toJson() {
    return <String,dynamic>{
      '_type': 'linearToSrgbGamma'
    };
  }
}

class NapaColorFilterMatrix extends NapaColorFilter {

  List<double> matrix;

  NapaColorFilterMatrix(this.matrix);

  @override
  ColorFilter get colorFilter => ColorFilter.matrix(matrix);

  @override
  toJson() {
    return <String,dynamic>{
      '_type': 'matrix',
      'matrix': matrix
    };
  }
}

class NapaColorFilterMode extends NapaColorFilter {

  Color color;
  BlendMode blendMode;

  NapaColorFilterMode(this.color, this.blendMode);

  @override
  ColorFilter get colorFilter => ColorFilter.mode(color, blendMode);

  @override
  toJson() {
    return <String,dynamic>{
      '_type': 'mode',
      'color': color.toJson(),
      'blendMode': blendMode.name
    };
  }
}

class NapaColorFilterSrgbToLinearGamma extends NapaColorFilter {

  @override
  ColorFilter get colorFilter => ColorFilter.srgbToLinearGamma();

  @override
  toJson() {
    return <String,dynamic>{
      '_type': 'srgbToLinearGamma'
    };
  }
}
