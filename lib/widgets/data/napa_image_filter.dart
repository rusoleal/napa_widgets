import 'dart:ui';
import 'package:flutter/widgets.dart';

import '../tojson_extensions.dart';
import 'napa_matrix4.dart';

abstract class NapaImageFilter {
  ImageFilter get imageFilter;

  String get name;

  dynamic toJson();

  static NapaImageFilter? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    String type = data['type'];
    switch (type) {
      case 'blur':
        return NapaImageFilterBlur(
          sigmaX: data['sigmaX'],
          sigmaY: data['sigmaY'],
          tileMode: decodeTileMode(data['tileMode']),
        );
      case 'compose':
        return NapaImageFilterCompose(
          outer: NapaImageFilter.decode(data['outer'])!,
          inner: NapaImageFilter.decode(data['inner'])!,
        );
      case 'dilate':
        return NapaImageFilterDilate(
          radiusX: data['radiusX'],
          radiusY: data['radiusY'],
        );
      case 'erode':
        return NapaImageFilterErode(
          radiusX: data['radiusX'],
          radiusY: data['radiusY'],
        );
      case 'matrix':
        return NapaImageFilterMatrix(
          matrix: NapaMatrix4Compose.decode(data['matrix'])!,
          filterQuality: decodeFilterQuality(data['filterQuality']),
        );
      default:
        return null;
    }
  }
}

class NapaImageFilterBlur extends NapaImageFilter {
  double sigmaX;
  double sigmaY;
  TileMode? tileMode;

  NapaImageFilterBlur({this.sigmaX = 0.0, this.sigmaY = 0.0, this.tileMode});

  @override
  ImageFilter get imageFilter =>
      ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY, tileMode: tileMode);

  @override
  toJson() {
    return <String, dynamic>{
      'type': 'blur',
      'sigmaX': sigmaX,
      'sigmaY': sigmaY,
      if (tileMode != null) 'tileMode': tileMode!.name,
    };
  }
  
  @override
  String get name => 'Blur';
}

class NapaImageFilterCompose extends NapaImageFilter {
  NapaImageFilter outer;
  NapaImageFilter inner;

  NapaImageFilterCompose({required this.outer, required this.inner});

  @override
  ImageFilter get imageFilter =>
      ImageFilter.compose(outer: outer.imageFilter, inner: inner.imageFilter);

  @override
  toJson() {
    return <String, dynamic>{
      'type': 'compose',
      'outer': outer.toJson(),
      'inner': inner.toJson(),
    };
  }
  
  @override
  String get name => 'Compose';
}

class NapaImageFilterDilate extends NapaImageFilter {
  double radiusX;
  double radiusY;

  NapaImageFilterDilate({this.radiusX = 0.0, this.radiusY = 0.0});

  @override
  ImageFilter get imageFilter =>
      ImageFilter.dilate(radiusX: radiusX, radiusY: radiusY);

  @override
  toJson() {
    return <String, dynamic>{
      'type': 'dilate',
      'radiusX': radiusX,
      'radiusY': radiusY,
    };
  }
  
  @override
  String get name => 'Dilate';
}

class NapaImageFilterErode extends NapaImageFilter {
  double radiusX;
  double radiusY;

  NapaImageFilterErode({this.radiusX = 0.0, this.radiusY = 0.0});

  @override
  ImageFilter get imageFilter =>
      ImageFilter.erode(radiusX: radiusX, radiusY: radiusY);

  @override
  toJson() {
    return <String, dynamic>{
      'type': 'erode',
      'radiusX': radiusX,
      'radiusY': radiusY,
    };
  }
  
  @override
  String get name => 'Erode';
}

class NapaImageFilterMatrix extends NapaImageFilter {
  NapaMatrix4Compose matrix;
  FilterQuality filterQuality;

  NapaImageFilterMatrix({
    required this.matrix,
    this.filterQuality = FilterQuality.medium,
  });

  @override
  ImageFilter get imageFilter =>
      ImageFilter.matrix(matrix.matrix.storage, filterQuality: filterQuality);

  @override
  toJson() {
    return <String, dynamic>{
      'type': 'matrix',
      'matrix': matrix.toJson(),
      'filterQuality': filterQuality.name,
    };
  }
  
  @override
  String get name => 'Matrix';
}

class NapaImageFilterShader extends NapaImageFilter {
  NapaImageFilterShader();

  @override
  ImageFilter get imageFilter => ImageFilter.matrix(Matrix4.identity().storage);

  @override
  toJson() {
    return <String, dynamic>{'type': 'shader'};
  }
  
  @override
  String get name => 'Shader';
}
