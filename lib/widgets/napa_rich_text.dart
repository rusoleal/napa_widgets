import 'package:flutter/widgets.dart';
import 'napa_stateless_widget.dart';
import 'napa_widget.dart';
import 'data/napa_text_span.dart';

/// Wrapper class for [RichText].
/// https://api.flutter.dev/flutter/widgets/RichText-class.html
///
class NapaRichText extends NapaStatelessWidget {
  NapaTextSpan text;
  TextAlign textAlign;
  TextDirection? textDirection;
  bool softWrap;
  TextOverflow overflow;
  int? maxLines;
  TextWidthBasis textWidthBasis;

  NapaRichText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
  }) : super(childMode: NapaChildMode.noChildren);

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{
        'text': text.toJson(),
        'textAlign': textAlign.name,
        if (textDirection != null) 'textDirection': textDirection!.name,
        'softWrap': softWrap,
        'overflow': overflow.name,
        if (maxLines != null) 'maxLines': maxLines,
        'textWidthBasis': textWidthBasis.name,
      });
  }

  @override
  String get widgetName => 'RichText';

  @override
  Widget toWidget() => RichText(
    text: text.textSpan,
    textAlign: textAlign,
    textDirection: textDirection,
    softWrap: softWrap,
    overflow: overflow,
    maxLines: maxLines,
    textWidthBasis: textWidthBasis,
  );

  static NapaRichText? decode(dynamic data) {
    if (data == null) return null;
    return NapaRichText(
      text: NapaTextSpan.decode(data['text']) ?? NapaTextSpan(),
      textAlign: TextAlign.values.firstWhere(
        (e) => e.name == data['textAlign'],
        orElse: () => TextAlign.start,
      ),
      textDirection: data['textDirection'] != null
          ? TextDirection.values.firstWhere(
              (e) => e.name == data['textDirection'],
              orElse: () => TextDirection.ltr,
            )
          : null,
      softWrap: data['softWrap'] ?? true,
      overflow: TextOverflow.values.firstWhere(
        (e) => e.name == data['overflow'],
        orElse: () => TextOverflow.clip,
      ),
      maxLines: data['maxLines'] as int?,
      textWidthBasis: TextWidthBasis.values.firstWhere(
        (e) => e.name == data['textWidthBasis'],
        orElse: () => TextWidthBasis.parent,
      ),
    );
  }
}
