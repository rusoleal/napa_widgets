import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:napa_widgets/napa_widgets.dart';

/// Creates a simple child widget for testing single-child widgets.
NapaSizedBox createChildWidget() => NapaSizedBox(width: 10, height: 10);

/// Creates a simple child JSON map for decode tests.
Map<String, dynamic> createChildJson() => {
  '_name': 'SizedBox',
  'width': 10.0,
  'height': 10.0,
};

/// Returns a known Color value for testing.
Color testColor() => const Color.from(alpha: 1.0, red: 1.0, green: 0.0, blue: 0.0);

/// Returns a JSON-compatible map for testColor().
Map<String, dynamic> testColorJson() => {
  'r': 1.0,
  'g': 0.0,
  'b': 0.0,
  'a': 1.0,
  'colorSpace': 'sRGB',
};

/// Returns a known EdgeInsets value for testing.
EdgeInsets testEdgeInsets() => const EdgeInsets.all(8.0);

/// Returns a JSON-compatible map for testEdgeInsets().
Map<String, dynamic> testEdgeInsetsJson() => {
  'left': 8.0,
  'top': 8.0,
  'right': 8.0,
  'bottom': 8.0,
};

/// Returns a JSON-compatible map for Alignment.center.
Map<String, dynamic> testAlignmentCenterJson() => {'x': 0.0, 'y': 0.0};

/// Returns a JSON-compatible map for Alignment.topLeft.
Map<String, dynamic> testAlignmentTopLeftJson() => {'x': -1.0, 'y': -1.0};

/// Returns a JSON-compatible map for BorderRadius.zero.
Map<String, dynamic> testBorderRadiusZeroJson() => {
  'topLeft': {'x': 0.0, 'y': 0.0},
  'topRight': {'x': 0.0, 'y': 0.0},
  'bottomLeft': {'x': 0.0, 'y': 0.0},
  'bottomRight': {'x': 0.0, 'y': 0.0},
};

/// Returns a JSON-compatible map for BorderRadius.circular(10).
Map<String, dynamic> testBorderRadiusJson() => {
  'topLeft': {'x': 10.0, 'y': 10.0},
  'topRight': {'x': 10.0, 'y': 10.0},
  'bottomLeft': {'x': 10.0, 'y': 10.0},
  'bottomRight': {'x': 10.0, 'y': 10.0},
};

/// Returns a synthetic Uint8List for ImageWrapper testing.
Uint8List testImageData() => Uint8List.fromList([0x89, 0x50, 0x4E, 0x47]);

/// Returns a NapaImageFilterBlur for testing.
NapaImageFilterBlur testImageFilter() =>
    NapaImageFilterBlur(sigmaX: 5.0, sigmaY: 5.0);

/// Returns JSON for a NapaImageFilterBlur.
Map<String, dynamic> testImageFilterJson() => {
  'type': 'blur',
  'sigmaX': 5.0,
  'sigmaY': 5.0,
};

/// Returns a Size JSON map.
Map<String, dynamic> testSizeJson({double width = 0.0, double height = 0.0}) => {
  'width': width,
  'height': height,
};
