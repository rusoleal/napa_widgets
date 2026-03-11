import 'package:flutter/widgets.dart';
import 'napa_text_style.dart';

/// Serializable wrapper for [TextSpan].
///
class NapaTextSpan {
  String? text;
  NapaTextStyle? style;
  String? semanticsLabel;
  List<NapaTextSpan>? children;

  NapaTextSpan({this.text, this.style, this.semanticsLabel, this.children});

  TextSpan get textSpan => TextSpan(
    text: text,
    style: style?.textStyle,
    semanticsLabel: semanticsLabel,
    children: children?.map((e) => e.textSpan).toList(),
  );

  dynamic toJson() => {
    if (text != null) 'text': text,
    if (style != null) 'style': style!.toJson(),
    if (semanticsLabel != null) 'semanticsLabel': semanticsLabel,
    if (children != null && children!.isNotEmpty)
      'children': children!.map((e) => e.toJson()).toList(),
  };

  static NapaTextSpan? decode(dynamic data) {
    if (data == null) return null;
    return NapaTextSpan(
      text: data['text'] as String?,
      style: NapaTextStyle.decode(data['style']),
      semanticsLabel: data['semanticsLabel'] as String?,
      children: (data['children'] as List?)
          ?.map((e) => NapaTextSpan.decode(e)!)
          .toList(),
    );
  }
}
