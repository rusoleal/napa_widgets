
import 'dart:ui';

import '../tojson_extensions.dart';

class NapaMaskFilter {
  BlurStyle style;
  double sigma;

  NapaMaskFilter(this.style, this.sigma);

  dynamic toJson() {
    return <String,dynamic>{
      'style': style.name,
      'sigma': sigma
    };
  }

  MaskFilter get maskFilter => MaskFilter.blur(style, sigma);

  static NapaMaskFilter? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaMaskFilter(
      decodeBlurStyle(data['style']),
      data['sigma']
    );
  }
}