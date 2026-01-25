import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'data/image_wrapper.dart';
import 'napa_stateful_widget.dart';
import 'tojson_extensions.dart';

class NapaImage extends NapaStatefulWidget {
  AlignmentGeometry alignment;
  Rect? centerSlice;
  Color? color;
  BlendMode? colorBlendMode;
  bool excludeFromSemantics;
  FilterQuality filterQuality;
  BoxFit? fit;
  bool gaplessPlayback;
  double? height;
  bool isAntiAlias;
  bool matchTextDirection;
  double? opacity;
  ImageRepeat repeat;
  double? width;
  ImageWrapper? data;

  NapaImage({
    this.alignment = Alignment.center,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.excludeFromSemantics = false,
    this.filterQuality = FilterQuality.medium,
    this.fit,
    this.gaplessPlayback = false,
    this.height,
    this.isAntiAlias = false,
    this.matchTextDirection = false,
    this.opacity,
    this.repeat = ImageRepeat.noRepeat,
    this.width,
    this.data,
  }) {
    properties.addAll([
      InspectableProperty<AlignmentGeometry>(
        name: 'alignment',
        getValue: (obj) => alignment,
        setValue: (obj, value, customData) => alignment = value,
      ),
      InspectableProperty<Rect>(
        name: 'centerSlice',
        nullable: true,
        getValue: (obj) => centerSlice,
        setValue: (obj, value, customData) => centerSlice = value,
      ),
      InspectableProperty<Color>(
        name: 'color',
        nullable: true,
        getValue: (obj) => color,
        setValue: (obj, value, customData) => color = value,
      ),
      InspectableProperty<BlendMode>(
        name: 'colorBlendMode',
        nullable: true,
        getValue: (obj) => colorBlendMode,
        setValue: (obj, value, customData) => colorBlendMode = value,
        values: () => BlendMode.values,
      ),
      InspectableProperty<bool>(
        name: 'excludeFromSemantics',
        getValue: (obj) => excludeFromSemantics,
        setValue: (obj, value, customData) => excludeFromSemantics = value,
      ),
      InspectableProperty<FilterQuality>(
        name: 'filterQuality',
        getValue: (obj) => filterQuality,
        setValue: (obj, value, customData) => filterQuality = value,
        values: () => FilterQuality.values,
      ),
      InspectableProperty<BoxFit>(
        name: 'fit',
        nullable: true,
        getValue: (obj) => fit,
        setValue: (obj, value, customData) => fit = value,
        values: () => BoxFit.values,
      ),
      InspectableProperty<bool>(
        name: 'gaplessPlayback',
        getValue: (obj) => gaplessPlayback,
        setValue: (obj, value, customData) => gaplessPlayback = value,
      ),
      InspectableProperty<double>(
        name: 'height',
        nullable: true,
        getValue: (obj) => height,
        setValue: (obj, value, customData) => height = value,
      ),
      InspectableProperty<bool>(
        name: 'isAntiAlias',
        getValue: (obj) => isAntiAlias,
        setValue: (obj, value, customData) => isAntiAlias = value,
      ),
      InspectableProperty<bool>(
        name: 'matchTextDirection',
        getValue: (obj) => matchTextDirection,
        setValue: (obj, value, customData) => matchTextDirection = value,
      ),
      InspectableProperty<double>(
        name: 'opacity',
        nullable: true,
        getValue: (obj) => opacity,
        setValue: (obj, value, customData) => opacity = value,
      ),
      InspectableProperty<ImageRepeat>(
        name: 'repeat',
        getValue: (obj) => repeat,
        setValue: (obj, value, customData) => repeat = value,
        values: () => ImageRepeat.values,
      ),
      InspectableProperty<double>(
        name: 'width',
        nullable: true,
        getValue: (obj) => width,
        setValue: (obj, value, customData) => width = value,
      ),
      InspectableProperty<ImageWrapper>(
        name: 'data',
        nullable: true,
        getValue: (obj) => data,
        setValue: (obj, value, customData) => data = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()..addAll(<String, dynamic>{
      'alignment': alignment.toJson(),
      if (centerSlice != null) 'centerSlice': centerSlice!.toJson(),
      if (color != null) 'color': color!.toJson(),
      if (colorBlendMode != null) 'colorBlendMode': colorBlendMode!.name,
      'excludeFromSemantics': excludeFromSemantics,
      'filterQuality': filterQuality.name,
      if (fit != null) 'fit': fit!.name,
      'gaplessPlayback': gaplessPlayback,
      if (height != null) 'height': height,
      'isAntiAlias': isAntiAlias,
      'matchTextDirection': matchTextDirection,
      if (opacity != null) 'opacity': opacity,
      'repeat': repeat.name,
      if (width != null) 'width': width,
      if (data != null) 'data': data!.toJson(),
    });
  }

  @override
  String get widgetName => 'Image';

  @override
  Widget toWidget() {
    if (data == null) {
      return Container();
    }

    return Image.memory(
      data!.data,
      alignment: alignment,
      centerSlice: centerSlice,
      color: color,
      colorBlendMode: colorBlendMode,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      fit: fit,
      gaplessPlayback: gaplessPlayback,
      height: height,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity == null ? null : AlwaysStoppedAnimation(opacity!),
      repeat: repeat,
      width: width,
    );
  }

  static NapaImage? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaImage(
      alignment: decodeAlignmentGeometry(data['alignment'])!,
      centerSlice: decodeRect(data['centerSlice']),
      color: decodeColor(data['color']),
      colorBlendMode: decodeBlendMode(data['colorBlendMode']),
      excludeFromSemantics: data['excludeFromSemantics'],
      filterQuality: decodeFilterQuality(data['filterQuality']),
      fit: decodeBoxFit(data['fit']),
      gaplessPlayback: data['gaplessPlayback'],
      height: data['height'],
      isAntiAlias: data['isAntiAlias'],
      matchTextDirection: data['matchTextDirection'],
      opacity: data['opacity'],
      repeat: decodeImageRepeat(data['repeat']),
      width: data['width'],
      data: decodeImageWrapper(data['data']),
    );
  }
}
