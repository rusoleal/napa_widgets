import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inspectable_property/inspectable.dart';

import 'napa_single_child_render_object_widget.dart';
import 'napa_widget.dart';
import 'tojson_extensions.dart';

class NapaOldFilmEffect extends NapaSingleChildRenderObjectWidget {
  bool enabled;
  Color color;

  NapaOldFilmEffect({
    super.child,
    this.enabled = true,
    this.color = Colors.black,
  }) {
    properties.addAll([
      InspectableProperty<bool>(
        name: 'enabled',
        getValue: (obj) => enabled,
        setValue: (obj, value, customData) => enabled = value,
      ),
      InspectableProperty<Color>(
        name: 'color',
        getValue: (obj) => color,
        setValue: (obj, value, customData) => color = value,
      ),
    ]);
  }

  @override
  toJson() {
    return super.toJson()
      ..addAll(<String, dynamic>{'enabled': enabled, 'color': color.toJson()});
  }

  @override
  String get widgetName => 'OldFilmEffect';

  @override
  Widget toWidget() {
    return _OldFilmEffect(
      color: color,
      enabled: enabled,
      child: child?.toWidget(),
    );
  }

  static NapaOldFilmEffect? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaOldFilmEffect(
      enabled: data['enabled'],
      color: decodeColor(data['color'])!,
      child: NapaWidget.decode(data['child']),
    );
  }
}

class _OldFilmEffect extends StatefulWidget {
  final bool enabled;
  final Color color;
  final Widget? child;

  const _OldFilmEffect({
    required this.enabled,
    required this.color,
    this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _OldFilmEffectState();
  }
}

class _OldFilmEffectState extends State<_OldFilmEffect>
    with SingleTickerProviderStateMixin {
  ui.Image? img;
  AnimationController? controller;
  late bool lastEnabledState;
  final Random _random = Random();
  Offset _noiseOffset = Offset.zero;
  double _noiseRotation = 0;
  Timer? t;
  List<(Offset, double, double)> _timerData = [];

  @override
  void initState() {
    super.initState();

    lastEnabledState = widget.enabled;

    controller = AnimationController.unbounded(vsync: this)
      ..repeat(min: 0, max: 1, period: Duration(milliseconds: 1000));
    controller!.addListener(controllerChanged);
    if (!widget.enabled) {
      controller!.stop();
    }

    _loadImageFromAsset('assets/old_movie.png').then((value) {
      img = value;
      if (mounted) {
        setState(() {});
      }
    });

    timerEvent();
  }

  void timerEvent() {
    _timerData = [
      (
        Offset(_random.nextDouble() * 0.2, _random.nextDouble() * 0.2),
        _random.nextDouble() * 2.0 * pi,
        _random.nextDouble() * 2.0 + 0.5,
      ),
      (
        Offset(_random.nextDouble() * 0.2, _random.nextDouble() * 0.2),
        _random.nextDouble() * 2.0 * pi,
        _random.nextDouble() * 2.0 + 0.5,
      ),
    ];

    t = Timer(Duration(milliseconds: _random.nextInt(500)), timerEvent);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    t?.cancel();
    controller?.removeListener(controllerChanged);
    controller?.dispose();
    super.dispose();
  }

  void controllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _noiseOffset = Offset(
      _random.nextDouble() * 3 - 1.5,
      _random.nextDouble() * 3 - 1.5,
    );
    _noiseRotation = _random.nextDouble() * 0.01 - 0.005;

    if (lastEnabledState != widget.enabled) {
      if (widget.enabled) {
        controller?.repeat(
          min: 0,
          max: 1,
          period: Duration(milliseconds: 1000),
        );
      } else {
        controller?.stop();
      }
    }
    lastEnabledState = widget.enabled;

    return ClipRect(
      child: CustomPaint(
        foregroundPainter: widget.enabled
            ? _OldFilmCustomPainter(
                img: img,
                color: widget.color,
                noiseOffset: _noiseOffset,
                noiseRotation: _noiseRotation,
                timerData: _timerData,
              )
            : null,
        child: widget.child,
      ),
    );
  }
}

class _OldFilmCustomPainter extends CustomPainter {
  final Color color;
  final ui.Image? img;
  final Offset noiseOffset;
  final double noiseRotation;
  final List<(Offset, double, double)> timerData;

  const _OldFilmCustomPainter({
    required this.color,
    this.img,
    required this.noiseOffset,
    required this.noiseRotation,
    required this.timerData,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (img == null) {
      return;
    }

    // tint noisy image with input color
    Paint p = Paint()
      ..filterQuality = .medium
      ..colorFilter = ColorFilter.mode(color, .srcATop);

    for (var data in timerData) {
      canvas.save();

      // transform image
      //canvas.translate(timerOffset.dx * size.width, timerOffset.dy * size.height);
      canvas.rotate(data.$2);
      canvas.scale(data.$3);

      // simulate white noise
      canvas.translate(size.width / 2, size.height / 2);
      canvas.rotate(noiseRotation);
      canvas.translate(-size.width / 2, -size.height / 2);
      canvas.translate(noiseOffset.dx, noiseOffset.dy);

      canvas.drawImageRect(
        img!,
        Rect.fromLTWH(0, 0, img!.width.toDouble(), img!.height.toDouble()),
        Rect.fromLTWH(0, 0, size.width, size.height),
        p,
      );

      canvas.restore();
    }

    /*ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle())
      ..pushStyle(ui.TextStyle(color: color))
      ..addText(debug.toString());
    var paragraph = pb.build();
    paragraph.layout(ui.ParagraphConstraints(width: size.width));
    canvas.drawParagraph(paragraph, Offset.zero);*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Future<ui.Image> _loadImageFromAsset(String assetName) async {
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    var image = AssetImage(assetName);
    var key = await image.obtainKey(ImageConfiguration.empty);
    var stream = image.loadBuffer(
      key,
      PaintingBinding.instance.instantiateImageCodecFromBuffer,
    );
    var completer = Completer<ui.Image>();
    stream.addListener(
      ImageStreamListener((image, synchronousCall) {
        completer.complete(image.image);
      }),
    );
    return completer.future;
  }
  var buffer = await ui.ImmutableBuffer.fromAsset(assetName);
  var codec = await ui.instantiateImageCodecFromBuffer(buffer);
  var frame = await codec.getNextFrame();
  return frame.image;
}
