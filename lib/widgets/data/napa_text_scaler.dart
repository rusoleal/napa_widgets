
import 'package:flutter/cupertino.dart';

class NapaTextScaler {
  double textScaleFactor;

  NapaTextScaler.linear(this.textScaleFactor);

  TextScaler toTextScaler() {
    return TextScaler.linear(textScaleFactor);
  }

  dynamic toJson() {
    return <String, dynamic>{
      'type': 'linear',
      'textScaleFactor': textScaleFactor,
    };
  }

  static NapaTextScaler? decode(dynamic data) {
    if (data == null) {
      return data;
    }

    return NapaTextScaler.linear(data['textScaleFactor']);
  }
}