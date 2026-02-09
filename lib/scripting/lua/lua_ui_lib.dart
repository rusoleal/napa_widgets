
import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/painting.dart' show LinearGradient;//, RadialGradient;
import 'package:lua_dardo_plus/lua.dart';

class LuaUILib {

  static int openLib(LuaState state) {
    state.newLib({
      'newColor': _luaNewColor,
      'newColorFrom': _luaNewColorFrom,
      'newOffset': _luaNewOffset,
      'newOffsetFromDirection': _luaNewOffsetFromDirection,
      'newRectFromCenter': _luaNewRectFromCenter,
      'newRectFromCircle': _luaNewRectFromCircle,
      'newRectFromLTRB': _luaNewRectFromLTRB,
      'newRectFromLTWH': _luaNewRectFromLTWH,
      'newRectFromPoints': _luaNewRectFromPoints,
      'newRRectFromLTRBAndCorners': _luaRRectFromLTRBAndCorners,
      'newRRectFromLTRBR': _luaRRectFromLTRBR,
      'newRRectFromLTRBXY': _luaRRectFromLTRBXY,
      'newRRectFromRectAndCorners': _luaRRectFromRectAndCorners,
      'newRRectFromRectAndRadius': _luaRRectFromRectAndRadius,
      'newRRectFromRectXY': _luaRRectFromRectXY,
      'newPaint': _luaNewPaint,
      'newRadiusCircular': _luaNewRadiusCircular,
      'newRadiusElliptical': _luaNewRadiusElliptical,
      'newPath': _luaNewPath,
      'newPathFrom': _luaNewPathFrom,
      'newParagraphStyle': _luaNewParagraphStyle,
      'newParagraphBuilder': _luaNewParagraphBuilder,
      'newTextStyle': _luaNewTextStyle,
      'newLinearShader': _luaNewLinearShader,
      'newRadialGradient': _luaNewRadialGradient,
      'newMaskFilterBlur': _luaNewMaskFilterBlur,
      'newImageFilterBlur': _luaNewImageFilterBlur,
      'bounceIn': _luaBounceIn,
      'bounceInOut': _luaBounceInOut,
      'bounceOut': _luaBounceOut,
      'decelerate': _luaDecelerate,
      'ease': _luaEase,
      'easeIn': _luaEaseIn,
      'easeInBack': _luaEaseInBack,
      'easeInCirc': _luaEaseInCirc,
      'easeInCubic': _luaEaseInCubic,
      'easeInExpo': _luaEaseInExpo,
      'easeInOut': _luaEaseInOut,
      'easeInOutBack': _luaEaseInOutBack,
      'easeInOutCirc': _luaEaseInOutCirc,
      'easeInOutCubic': _luaEaseInOutCubic,
      'easeInOutCubicEmphasized': _luaEaseInOutCubicEmphasized,
      'easeInOutExpo': _luaEaseInOutExpo,
      'easeInOutQuad': _luaEaseInOutQuad,
      'easeInOutQuart': _luaEaseInOutQuart,
      'easeInOutQuint': _luaEaseInOutQuint,
      'easeInOutSine': _luaEaseInOutSine,
      'easeInQuad': _luaEaseInQuad,
      'easeInQuart': _luaEaseInQuart,
      'easeInQuint': _luaEaseInQuint,
      'easeInSine': _luaEaseInSine,
      'easeInToLinear': _luaEaseInToLinear,
      'easeOut': _luaEaseOut,
      'easeOutBack': _luaEaseOutBack,
      'easeOutCirc': _luaEaseOutCirc,
      'easeOutCubic': _luaEaseOutCubic,
      'easeOutExpo': _luaEaseOutExpo,
      'easeOutQuad': _luaEaseOutQuad,
      'easeOutQuart': _luaEaseOutQuart,
      'easeOutQuint': _luaEaseOutQuint,
      'easeOutSine': _luaEaseOutSine,
      'elasticIn': _luaElasticIn,
      'elasticInOut': _luaElasticInOut,
      'elasticOut': _luaElasticOut,
      'fastEaseInToSlowEaseOut': _luaFastEaseInToSlowEaseOut,
      'fastLinearToSlowEaseIn': _luaFastLinearToSlowEaseIn,
      'fastOutSlowIn': _luaFastOutSlowIn,
      'linear': _luaLinear,
      'linearToEaseOut': _luaLinearToEaseOut,
      'slowMiddle': _luaSlowMiddle,
    });

    state.newTable();
    for (int a=0; a<TileMode.values.length; a++) {
      state.pushString(TileMode.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"TileMode");

    state.newTable();
    for (int a=0; a<BlurStyle.values.length; a++) {
      state.pushString(BlurStyle.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"BlurStyle");

    state.newTable();
    for (int a=0; a<BlendMode.values.length; a++) {
      state.pushString(BlendMode.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"BlendMode");

    state.newTable();
    for (int a=0; a<PaintingStyle.values.length; a++) {
      state.pushString(PaintingStyle.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"PaintingStyle");

    state.newTable();
    for (int a=0; a<FilterQuality.values.length; a++) {
      state.pushString(FilterQuality.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"FilterQuality");

    state.newTable();
    for (int a=0; a<StrokeCap.values.length; a++) {
      state.pushString(StrokeCap.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"StrokeCap");

    state.newTable();
    for (int a=0; a<StrokeJoin.values.length; a++) {
      state.pushString(StrokeJoin.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"StrokeJoin");

    state.newTable();
    for (int a=0; a<ColorSpace.values.length; a++) {
      state.pushString(ColorSpace.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"ColorSpace");

    state.newTable();
    for (int a=0; a<ClipOp.values.length; a++) {
      state.pushString(ClipOp.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"ClipOp");

    state.newTable();
    for (int a=0; a<PathFillType.values.length; a++) {
      state.pushString(PathFillType.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"PathFillType");

    state.newTable();
    for (int a=0; a<TextAlign.values.length; a++) {
      state.pushString(TextAlign.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"TextAlign");

    state.newTable();
    for (int a=0; a<TextDirection.values.length; a++) {
      state.pushString(TextDirection.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"TextDirection");

    state.newTable();
    for (int a=0; a<FontStyle.values.length; a++) {
      state.pushString(FontStyle.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"FontStyle");

    state.newTable();
    for (int a=0; a<PlaceholderAlignment.values.length; a++) {
      state.pushString(PlaceholderAlignment.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"PlaceholderAlignment");

    state.newTable();
    for (int a=0; a<TextBaseline.values.length; a++) {
      state.pushString(TextBaseline.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"TextBaseline");

    state.newTable();
    for (int a=0; a<TextDecorationStyle.values.length; a++) {
      state.pushString(TextDecorationStyle.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"TextDecorationStyle");

    state.newTable();
    for (int a=0; a<TextLeadingDistribution.values.length; a++) {
      state.pushString(TextLeadingDistribution.values[a].name);
      state.pushInteger(a);
      state.setTable(-3);
    }
    state.setField(-2,"TextLeadingDistribution");

    // Canvas metatable
    state.newMetatable('MTCanvas');
    state.pushValue(-1);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaClipPath);
    state.setField(-2, 'clipPath');
    state.pushDartFunction(_luaClipRect);
    state.setField(-2, 'clipRect');
    state.pushDartFunction(_luaClipRRect);
    state.setField(-2, 'clipRRect');
    state.pushDartFunction(_luaDrawArc);
    state.setField(-2, 'drawArc');
    // TODO drawAtlas
    state.pushDartFunction(_luaDrawCircle);
    state.setField(-2, 'drawCircle');
    state.pushDartFunction(_luaDrawColor);
    state.setField(-2, 'drawColor');
    state.pushDartFunction(_luaDrawDRRect);
    state.setField(-2, 'drawDRRect');
    state.pushDartFunction(_luaDrawImage);
    state.setField(-2, 'drawImage');
    state.pushDartFunction(_luaDrawImageNine);
    state.setField(-2, 'drawImageNine');
    state.pushDartFunction(_luaDrawImageRect);
    state.setField(-2, 'drawImageRect');
    state.pushDartFunction(_luaDrawLine);
    state.setField(-2, 'drawLine');
    state.pushDartFunction(_luaDrawOval);
    state.setField(-2, 'drawOval');
    state.pushDartFunction(_luaDrawPaint);
    state.setField(-2, 'drawPaint');
    state.pushDartFunction(_luaDrawParagraph);
    state.setField(-2, 'drawParagraph');
    state.pushDartFunction(_luaDrawPath);
    state.setField(-2, 'drawPath');
    state.pushDartFunction(_luaDrawPicture);
    state.setField(-2, 'drawPicture');
    // TODO drawPoints
    // TODO drawRawAtlas
    // TODO drawRawPoints
    state.pushDartFunction(_luaDrawRect);
    state.setField(-2, 'drawRect');
    state.pushDartFunction(_luaDrawRRect);
    state.setField(-2, 'drawRRect');
    state.pushDartFunction(_luaDrawShadow);
    state.setField(-2, 'drawShadow');
    // TODO drawVertices
    state.pushDartFunction(_luaGetDestinationClipBounds);
    state.setField(-2, 'getDestinationClipBounds');
    state.pushDartFunction(_luaGetLocalClipBounds);
    state.setField(-2, 'getLocalClipBounds');
    state.pushDartFunction(_luaGetSaveCount);
    state.setField(-2, 'getSaveCount');
    // TODO getTransform
    state.pushDartFunction(_luaRestore);
    state.setField(-2, 'restore');
    state.pushDartFunction(_luaRestoreToCount);
    state.setField(-2, 'restoreToCount');
    state.pushDartFunction(_luaRotate);
    state.setField(-2, 'rotate');
    state.pushDartFunction(_luaSave);
    state.setField(-2, 'save');
    state.pushDartFunction(_luaSaveLayer);
    state.setField(-2, 'saveLayer');
    state.pushDartFunction(_luaScale);
    state.setField(-2, 'scale');
    state.pushDartFunction(_luaSkew);
    state.setField(-2, 'skew');
    // TODO transform
    state.pushDartFunction(_luaTranslate);
    state.setField(-2, 'translate');
    state.setField(-2, 'MTCanvas');

    // Color metatable
    state.newMetatable('MTColor');
    state.pushDartFunction(_luaColorIndex);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaColorComputeLuminance);
    state.setField(-2, 'computeLuminance');
    state.setField(-2, 'MTColor');

    // Paint metatable
    state.newMetatable('MTPaint');
    state.pushDartFunction(_luaPaintIndex);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaPaintNewIndex);
    state.setField(-2, '__newindex');
    state.setField(-2, 'MTPaint');

    // Offset metatable
    state.newMetatable('MTOffset');
    state.pushDartFunction(_luaOffsetIndex);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaOffsetScale);
    state.setField(-2, 'scale');
    state.pushDartFunction(_luaOffsetTranslate);
    state.setField(-2, 'translate');
    state.setField(-2, 'MTOffset');

    // Size metatable
    state.newMetatable('MTSize');
    state.pushDartFunction(_luaSizeIndex);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaSizeToString);
    state.setField(-2, '__tostring');
    state.setField(-2, 'MTSize');

    // Rect metatable
    state.newMetatable('MTRect');
    state.pushDartFunction(_luaRectIndex);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaRectContains);
    state.setField(-2, 'contains');
    state.pushDartFunction(_luaRectDeflate);
    state.setField(-2, 'deflate');
    state.pushDartFunction(_luaRectExpandToInclude);
    state.setField(-2, 'expandToInclude');
    state.pushDartFunction(_luaRectInflate);
    state.setField(-2, 'inflate');
    state.pushDartFunction(_luaRectIntersect);
    state.setField(-2, 'intersect');
    state.pushDartFunction(_luaRectOverlaps);
    state.setField(-2, 'overlaps');
    state.pushDartFunction(_luaRectShift);
    state.setField(-2, 'shift');
    state.pushDartFunction(_luaRectTranslate);
    state.setField(-2, 'translate');
    state.pushDartFunction(_luaRectLerp);
    state.setField(-2, 'lerp');
    state.setField(-2, 'MTRect');

    // RRect metatable
    state.newMetatable('MTRRect');
    state.pushDartFunction(_luaRRectIndex);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaRRectGetBlRadius);
    state.setField(-2, 'blRadius');
    state.pushDartFunction(_luaRRectGetBlRadiusX);
    state.setField(-2, 'blRadiusX');
    state.pushDartFunction(_luaRRectGetBlRadiusY);
    state.setField(-2, 'blRadiusY');
    state.pushDartFunction(_luaRRectGetBottom);
    state.setField(-2, 'bottom');
    state.pushDartFunction(_luaRRectGetBrRadius);
    state.setField(-2, 'brRadius');
    state.pushDartFunction(_luaRRectGetBrRadiusX);
    state.setField(-2, 'brRadiusX');
    state.pushDartFunction(_luaRRectGetBrRadiusY);
    state.setField(-2, 'brRadiusY');
    state.pushDartFunction(_luaRRectGetCenter);
    state.setField(-2, 'center');
    state.pushDartFunction(_luaRRectHasNaN);
    state.setField(-2, 'hasNaN');
    state.pushDartFunction(_luaRRectGetHeight);
    state.setField(-2, 'height');
    state.pushDartFunction(_luaRRectIsCircle);
    state.setField(-2, 'isCircle');
    state.pushDartFunction(_luaRRectIsEllipse);
    state.setField(-2, 'isEllipse');
    state.pushDartFunction(_luaRRectIsEmpty);
    state.setField(-2, 'isEmpty');
    state.pushDartFunction(_luaRRectIsFinite);
    state.setField(-2, 'isFinite');
    state.pushDartFunction(_luaRRectIsRect);
    state.setField(-2, 'isRect');
    state.pushDartFunction(_luaRRectIsStadium);
    state.setField(-2, 'isStadium');
    state.pushDartFunction(_luaRRectGetLeft);
    state.setField(-2, 'left');
    state.pushDartFunction(_luaRRectGetLongestSide);
    state.setField(-2, 'longestSide');
    state.pushDartFunction(_luaRRectGetMiddleRect);
    state.setField(-2, 'middleRect');
    state.pushDartFunction(_luaRRectGetOuterRect);
    state.setField(-2, 'outerRect');
    state.pushDartFunction(_luaRRectGetRight);
    state.setField(-2, 'right');
    state.pushDartFunction(_luaRRectGetSafeInnerRect);
    state.setField(-2, 'safeInnerRect');
    state.pushDartFunction(_luaRRectGetShortestSide);
    state.setField(-2, 'shortestSide');
    state.pushDartFunction(_luaRRectGetTallMiddlerect);
    state.setField(-2, 'tallMiddleRect');
    state.pushDartFunction(_luaRRectGetTlRadius);
    state.setField(-2, 'tlRadius');
    state.pushDartFunction(_luaRRectGetTlRadiusX);
    state.setField(-2, 'tlRadiusX');
    state.pushDartFunction(_luaRRectGetTlRadiusY);
    state.setField(-2, 'tlRadiusY');
    state.pushDartFunction(_luaRRectGetTop);
    state.setField(-2, 'top');
    state.pushDartFunction(_luaRRectGetTrRadius);
    state.setField(-2, 'trRadius');
    state.pushDartFunction(_luaRRectGetTrRadiusX);
    state.setField(-2, 'trRadiusX');
    state.pushDartFunction(_luaRRectGetTrRadiusY);
    state.setField(-2, 'trRadiusY');
    state.pushDartFunction(_luaRRectGetWideMiddleRect);
    state.setField(-2, 'wideMiddleRect');
    state.pushDartFunction(_luaRRectGetWidth);
    state.setField(-2, 'width');
    state.pushDartFunction(_luaRRectContains);
    state.setField(-2, 'contains');
    state.pushDartFunction(_luaRRectDeflate);
    state.setField(-2, 'deflate');
    state.pushDartFunction(_luaRRectInflate);
    state.setField(-2, 'inflate');
    state.pushDartFunction(_luaRRectScaleRadii);
    state.setField(-2, 'scaleRadii');
    state.pushDartFunction(_luaRRectShift);
    state.setField(-2, 'shift');
    state.setField(-2, 'MTRRect');

    // Radius metatable
    state.newMetatable('MTRadius');
    state.pushValue(-1);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaRadiusGetX);
    state.setField(-2, 'x');
    state.pushDartFunction(_luaRadiusGetY);
    state.setField(-2, 'y');
    state.pushDartFunction(_luaRadiusClamp);
    state.setField(-2, 'clamp');
    state.pushDartFunction(_luaRadiusClampValues);
    state.setField(-2, 'clampValues');
    state.setField(-2, 'MTRadius');

    // Path metatable
    state.newMetatable('MTPath');
    state.pushValue(-1);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaPathSetFillType);
    state.setField(-2, 'setFillType');
    state.pushDartFunction(_luaPathGetFillType);
    state.setField(-2, 'getFillType');
    state.pushDartFunction(_luaPathAddArc);
    state.setField(-2, 'addArc');
    state.pushDartFunction(_luaPathAddOval);
    state.setField(-2, 'addOval');
    state.pushDartFunction(_luaPathAddPath);
    state.setField(-2, 'addPath');
    state.pushDartFunction(_luaPathAddRect);
    // TODO addPolygon
    state.setField(-2, 'addRect');
    state.pushDartFunction(_luaPathAddRRect);
    state.setField(-2, 'addRRect');
    state.pushDartFunction(_luaPathArcTo);
    state.setField(-2, 'arcTo');
    state.pushDartFunction(_luaPathArcToPoint);
    state.setField(-2, 'arcToPoint');
    state.pushDartFunction(_luaPathClose);
    state.setField(-2, 'close');
    state.pushDartFunction(_luaPathComputeMetrics);
    state.setField(-2, 'computeMetrics');
    state.pushDartFunction(_luaPathConicTo);
    state.setField(-2, 'conicTo');
    state.pushDartFunction(_luaPathContains);
    state.setField(-2, 'contains');
    state.pushDartFunction(_luaPathCubicTo);
    state.setField(-2, 'cubicTo');
    state.pushDartFunction(_luaPathExtendWithPath);
    state.setField(-2, 'extendWithPath');
    state.pushDartFunction(_luaPathGetBounds);
    state.setField(-2, 'getBounds');
    state.pushDartFunction(_luaPathLineTo);
    state.setField(-2, 'lineTo');
    state.pushDartFunction(_luaPathMoveTo);
    state.setField(-2, 'moveTo');
    state.pushDartFunction(_luaPathQuadraticBezierTo);
    state.setField(-2, 'quadraticBezierTo');
    state.pushDartFunction(_luaPathRelativeArcToPoint);
    state.setField(-2, 'relativeArcToPoint');
    state.pushDartFunction(_luaPathRelativeConicTo);
    state.setField(-2, 'relativeConicTo');
    state.pushDartFunction(_luaPathRelativeCubicTo);
    state.setField(-2, 'relativeCubicTo');
    state.pushDartFunction(_luaPathRelativeLineTo);
    state.setField(-2, 'relativeLineTo');
    state.pushDartFunction(_luaPathRelativeMoveTo);
    state.setField(-2, 'relativeMoveTo');
    state.pushDartFunction(_luaPathRelativeQuadraticBezierTo);
    state.setField(-2, 'relativeQuadraticBezierTo');
    state.pushDartFunction(_luaPathReset);
    state.setField(-2, 'reset');
    state.pushDartFunction(_luaPathShift);
    state.setField(-2, 'shift');
    // TODO transform
    state.setField(-2, 'MTPath');

    // Paragraph metatable
    state.newMetatable('MTParagraph');
    state.pushValue(-1);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaParagraphAlphabeticBaseline);
    state.setField(-2, 'alphabeticBaseline');
    state.pushDartFunction(_luaParagraphDidExceedMaxLines);
    state.setField(-2, 'didExceedMaxLines');
    state.pushDartFunction(_luaParagraphHeight);
    state.setField(-2, 'height');
    state.pushDartFunction(_luaParagraphIdeographicBaseline);
    state.setField(-2, 'ideographicBaseline');
    state.pushDartFunction(_luaParagraphLongestLine);
    state.setField(-2, 'longestLine');
    state.pushDartFunction(_luaParagraphMaxIntrinsicWidth);
    state.setField(-2, 'maxIntrinsicWidth');
    state.pushDartFunction(_luaParagraphMinIntrinsicWidth);
    state.setField(-2, 'minIntrinsicWidth');
    state.pushDartFunction(_luaParagraphNumberOfLines);
    state.setField(-2, 'numberOfLines');
    state.pushDartFunction(_luaParagraphWidth);
    state.setField(-2, 'width');
    // TODO computeLineMetrics
    // TODO dispose
    // TODO getBoxesForPlaceholders
    // TODO getBoxesForRange
    // TODO getClosestGlyphInfoForOffset
    // TODO getGlyphInfoAt
    // TODO getLineBoundary
    // TODO getLineMetricsAt
    // TODO getLineNumberAt
    // TODO getPositionForOffset
    // TODO getWordBoundary
    state.pushDartFunction(_luaParagraphLayout);
    state.setField(-2, 'layout');
    state.setField(-2, 'MTParagraph');

    // ParagraphBuilder metatable
    state.newMetatable('MTParagraphBuilder');
    state.pushValue(-1);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaParagraphBuilderPlaceholderCount);
    state.setField(-2, 'placeholderCount');
    state.pushDartFunction(_luaParagraphBuilderAddPlaceholder);
    state.setField(-2, 'addPlaceholder');
    state.pushDartFunction(_luaParagraphBuilderAddText);
    state.setField(-2, 'addText');
    state.pushDartFunction(_luaParagraphBuilderBuild);
    state.setField(-2, 'build');
    state.pushDartFunction(_luaParagraphBuilderPop);
    state.setField(-2, 'pop');
    state.pushDartFunction(_luaParagraphBuilderPushStyle);
    state.setField(-2, 'pushStyle');
    state.setField(-2, 'MTParagraphBuilder');

    state.newMetatable('MTImage');
    state.pushValue(-1);
    state.setField(-2, '__index');
    state.pushDartFunction(_luaImageGetWidth);
    state.setField(-2, 'width');
    state.pushDartFunction(_luaImageGetHeight);
    state.setField(-2, 'height');
    state.pushDartFunction(_luaImageGetColorSpace);
    state.setField(-2, 'colorSpace');
    state.setField(-2, 'MTImage');

    return 1;
  }

  static int _luaNewOffset(LuaState state) {
    double dx = state.toNumber(1);
    double dy = state.toNumber(2);
    Userdata data = state.newUserdata();
    data.data = Offset(dx,dy);

    // assign metatable
    state.getMetatableAux('MTOffset');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewOffsetFromDirection(LuaState state) {
    double direction = state.toNumber(1);
    double distance = state.checkNumber(2) ?? 1.0;
    Userdata data = state.newUserdata();
    data.data = Offset.fromDirection(direction, distance);

    // assign metatable
    state.getMetatableAux('MTOffset');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewColor(LuaState state) {
    int value = state.toInteger(1);
    Userdata data = state.newUserdata();
    data.data = Color(value);

    // assign metatable
    state.getMetatableAux('MTColor');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewColorFrom(LuaState state) {
    double alpha = state.toNumber(1);
    double red = state.toNumber(2);
    double green = state.toNumber(3);
    double blue = state.toNumber(4);
    ColorSpace colorSpace = ColorSpace.values[state.toIntegerX(5) ?? ColorSpace.sRGB.index] ;
    Userdata data = state.newUserdata();
    data.data = Color.from(alpha: alpha, red: red, green: green, blue: blue, colorSpace: colorSpace);

    // assign metatable
    state.getMetatableAux('MTColor');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRectFromCenter(LuaState state) {

    Userdata? center = state.toUserdata(1);
    double width = state.toNumber(2);
    double height = state.toNumber(3);

    Userdata data = state.newUserdata();
    data.data = Rect.fromCenter(center: center!.data, width: width, height: height);

    // assign metatable
    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRectFromCircle(LuaState state) {

    Userdata? center = state.toUserdata(1);
    double radius = state.toNumber(2);

    Userdata data = state.newUserdata();
    data.data = Rect.fromCircle(center: center!.data, radius: radius);

    // assign metatable
    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRectFromLTRB(LuaState state) {

    double left = state.toNumber(1);
    double top = state.toNumber(2);
    double right = state.toNumber(3);
    double bottom = state.toNumber(4);

    Userdata data = state.newUserdata();
    data.data = Rect.fromLTRB(left, top, right, bottom);

    // assign metatable
    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRectFromLTWH(LuaState state) {

    double left = state.toNumber(1);
    double top = state.toNumber(2);
    double width = state.toNumber(3);
    double height = state.toNumber(4);

    Userdata data = state.newUserdata();
    data.data = Rect.fromLTWH(left, top, width, height);

    // assign metatable
    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRectFromPoints(LuaState state) {

    Userdata? a = state.toUserdata(1);
    Userdata? b = state.toUserdata(2);

    Userdata data = state.newUserdata();
    data.data = Rect.fromPoints(a!.data, b!.data);

    // assign metatable
    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewPaint(LuaState state) {
    Userdata data = state.newUserdata();
    data.data = Paint();

    // assign metatable
    state.getMetatableAux('MTPaint');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaPaintIndex(LuaState state) {
    Userdata<dynamic>? p = state.toUserdata(1);
    Paint paint = p?.data as Paint;

    final key = state.checkString(2);
    switch (key) {
      case 'blendMode':
        state.pushInteger(paint.blendMode.index);
        return 1;
      case 'color':
        Userdata color = state.newUserdata();
        color.data = paint.color;
        state.getMetatableAux('MTColor');
        state.setMetatable(-2);
        return 1;
      //case 'colorFilter':
      case 'filterQuality':
        state.pushInteger(paint.filterQuality.index);
        return 1;
      //case 'imageFilter':
      case 'invertColors':
        state.pushBoolean(paint.invertColors);
        return 1;
      case 'isAntiAlias':
        state.pushBoolean(paint.isAntiAlias);
        return 1;
      //case 'maskFilter':
      //case 'shader':
      case 'strokeCap':
        state.pushInteger(paint.strokeCap.index);
        return 1;
      case 'strokeJoin':
        state.pushInteger(paint.strokeJoin.index);
        return 1;
      case 'strokeMiterLimit':
        state.pushNumber(paint.strokeMiterLimit);
        return 1;
      case 'strokeWidth':
        state.pushNumber(paint.strokeWidth);
        return 1;
      case 'style':
        state.pushInteger(paint.style.index);
        return 1;
    }

    state.getMetatableAux('MTPaint');
    state.getField(-1, key);
    return 1;
  }

  static int _luaPaintNewIndex(LuaState state) {
    Userdata<dynamic>? p = state.toUserdata(1);
    Paint paint = p?.data as Paint;

    final key = state.checkString(2);
    switch (key) {
      case 'blendMode':
        int blendMode = state.toInteger(3);
        paint.blendMode = BlendMode.values[blendMode];
        return 0;
      case 'color':
        Userdata? color = state.toUserdata(3);
        paint.color = color?.data as Color;
        return 0;
    //case 'colorFilter':
      case 'filterQuality':
        int filterQuality = state.toInteger(3);
        paint.filterQuality = FilterQuality.values[filterQuality];
        return 0;
    //case 'imageFilter':
      case 'invertColors':
        paint.invertColors = state.toBoolean(3);
        return 0;
      case 'isAntiAlias':
        paint.isAntiAlias = state.toBoolean(3);
        return 0;
    //case 'maskFilter':
    //case 'shader':
      case 'strokeCap':
        int strokeCap = state.toInteger(3);
        paint.strokeCap = StrokeCap.values[strokeCap];
        return 0;
      case 'strokeJoin':
        int strokeJoin = state.toInteger(3);
        paint.strokeJoin = StrokeJoin.values[strokeJoin];
        return 0;
      case 'strokeMiterLimit':
        paint.strokeMiterLimit = state.toNumber(3);
        return 0;
      case 'strokeWidth':
        paint.strokeWidth = state.toNumber(3);
        return 0;
      case 'style':
        int style = state.toInteger(3);
        paint.style = PaintingStyle.values[style];
        return 0;
    }

    state.getMetatableAux('MTPaint');
    state.getField(-1, key);
    return 1;
  }

  static int _luaSave(LuaState state) {
    Userdata<dynamic>? canvas = state.toUserdata(1);
    (canvas?.data as Canvas).save();
    return 0;
  }

  static int _luaSaveLayer(LuaState state) {
    Userdata<dynamic>? canvas = state.toUserdata(1);
    Userdata? bounds = state.toUserdata(2);
    Userdata? paint = state.toUserdata(3);
    (canvas?.data as Canvas).saveLayer(bounds?.data as Rect?, paint!.data as Paint);
    return 0;
  }

  static int _luaRestore(LuaState state) {
    Userdata<dynamic>? canvas = state.toUserdata(1);
    (canvas?.data as Canvas).restore();
    return 0;
  }

  static int _luaRestoreToCount(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    int count = state.toInteger(2);
    canvas.restoreToCount(count);
    return 0;
  }

  static int _luaDrawColor(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    Userdata? color = state.toUserdata(2);
    int blendMode = state.toInteger(3);
    canvas.drawColor(color!.data as Color, BlendMode.values[blendMode]);
    return 0;
  }

  static int _luaDrawDRRect(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? outer = state.toUserdata(2);
    Userdata? inner = state.toUserdata(3);
    Userdata? paint = state.toUserdata(4);
    canvas.drawDRRect(
      outer!.data as RRect,
      inner!.data as RRect,
      paint!.data as Paint);
    return 0;
  }

  static int _luaDrawImage(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? image = state.toUserdata(2);
    if (image?.data is Image) {
      Userdata? offset = state.toUserdata(3);
      Userdata? paint = state.toUserdata(4);
      (canvas!.data as Canvas).drawImage(
          image!.data as Image,
          offset!.data as Offset,
          paint!.data as Paint);
    }
    return 0;
  }

  static int _luaDrawImageNine(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? image = state.toUserdata(2);
    Userdata? center = state.toUserdata(3);
    Userdata? dst = state.toUserdata(4);
    Userdata? paint = state.toUserdata(5);
    (canvas!.data as Canvas).drawImageNine(
        image!.data as Image,
        center!.data as Rect,
        dst!.data as Rect,
        paint!.data as Paint);
    return 0;
  }

  static int _luaDrawImageRect(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? image = state.toUserdata(2);
    Userdata? src = state.toUserdata(3);
    Userdata? dst = state.toUserdata(4);
    Userdata? paint = state.toUserdata(5);
    (canvas!.data as Canvas).drawImageRect(
        image!.data as Image,
        src!.data as Rect,
        dst!.data as Rect,
        paint!.data as Paint);
    return 0;
  }

  static int _luaDrawPaint(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    Userdata? p = state.toUserdata(2);
    Paint paint = p?.data as Paint;
    canvas.drawPaint(paint);
    return 0;
  }

  static int _luaDrawParagraph(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? paragraph = state.toUserdata(2);
    Userdata? offset = state.toUserdata(3);

    (canvas!.data as Canvas).drawParagraph(
        paragraph!.data as Paragraph,
        offset!.data as Offset
    );
    return 0;
  }

  static int _luaDrawPath(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? path = state.toUserdata(2);
    Userdata? paint = state.toUserdata(3);

    (canvas!.data as Canvas).drawPath(path!.data as Path, paint!.data as Paint);
    return 0;
  }

  static int _luaDrawPicture(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? picture = state.toUserdata(2);

    (canvas!.data as Canvas).drawPicture(picture!.data as Picture);
    return 0;
  }

  static int _luaClipPath(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? path =  state.toUserdata(2);
    bool doAntiAlias = state.toBoolean(3);
    // TODO state.checkBoolean()???

    (canvas!.data as Canvas).clipPath(path!.data as Path, doAntiAlias: doAntiAlias);
    return 0;
  }

  static int _luaClipRect(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? rect =  state.toUserdata(2);
    ClipOp clipOp = ClipOp.values[state.toIntegerX(3) ?? ClipOp.intersect.index];
    // TODO state.checkBoolean()???
    bool doAntiAlias = true;
    canvas.clipRect(rect!.data as Rect, clipOp: clipOp, doAntiAlias: doAntiAlias);

    return 0;
  }

  static int _luaClipRRect(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? rrect =  state.toUserdata(2);
    // TODO state.checkBoolean()???
    bool doAntiAlias = true;
    canvas.clipRRect(rrect!.data as RRect, doAntiAlias: doAntiAlias);

    return 0;
  }

  static int _luaDrawArc(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? rect =  state.toUserdata(2);
    double startAngle = state.toNumber(3);
    double sweepAngle = state.toNumber(4);
    bool useCenter = state.toBoolean(5);
    Userdata? paint = state.toUserdata(6);

    canvas.drawArc(rect!.data as Rect, startAngle, sweepAngle, useCenter, paint!.data as Paint);
    return 0;
  }

  static int _luaDrawCircle(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? center = state.toUserdata(2);
    double radius = state.toNumber(3);
    Userdata? p = state.toUserdata(4);
    Paint paint = p?.data as Paint;

    canvas.drawCircle(center!.data as Offset, radius, paint);
    return 0;
  }

  static int _luaDrawLine(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? p1 = state.toUserdata(2);
    Userdata? p2 = state.toUserdata(3);
    Userdata? p = state.toUserdata(4);
    Paint paint = p?.data as Paint;

    canvas.drawLine(p1!.data as Offset, p2!.data as Offset, paint);
    return 0;
  }

  static int _luaDrawOval(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? rect = state.toUserdata(2);
    Userdata? paint = state.toUserdata(3);
    canvas.drawOval(rect!.data as Rect, paint!.data as Paint);
    return 0;
  }

  static int _luaDrawRect(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? rect = state.toUserdata(2);
    Userdata? paint = state.toUserdata(3);

    canvas.drawRect(rect!.data as Rect, paint!.data as Paint);
    return 0;
  }

  static int _luaDrawRRect(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata? rrect = state.toUserdata(2);
    Userdata? paint = state.toUserdata(3);

    canvas.drawRRect(rrect!.data as RRect, paint!.data as Paint);
    return 0;
  }

  static int _luaDrawShadow(LuaState state) {
    Userdata? canvas = state.toUserdata(1);
    Userdata? path = state.toUserdata(2);
    Userdata? color = state.toUserdata(3);
    double elevation = state.toNumber(4);
    bool transparentOccluder = state.toBoolean(5);

    (canvas!.data as Canvas).drawShadow(
      path!.data as Path,
      color!.data as Color,
      elevation,
      transparentOccluder
    );
    return 0;
  }

  static int _luaGetDestinationClipBounds(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata toReturn = state.newUserdata();
    toReturn.data = canvas.getDestinationClipBounds();

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaGetLocalClipBounds(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);

    Userdata toReturn = state.newUserdata();
    toReturn.data = canvas.getLocalClipBounds();

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaGetSaveCount(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    state.pushInteger(canvas.getSaveCount());
    return 1;
  }

  static int _luaRotate(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    double radians = state.toNumber(2);
    canvas.rotate(radians);
    return 0;
  }

  static int _luaScale(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    double sx = state.toNumber(2);
    double? sy = state.checkNumber(3);
    canvas.scale(sx, sy);
    return 0;
  }

  static int _luaSkew(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    double sx = state.toNumber(2);
    double sy = state.toNumber(3);
    canvas.skew(sx, sy);
    return 0;
  }

  static int _luaTranslate(LuaState state) {
    Userdata<dynamic>? c = state.toUserdata(1);
    Canvas canvas = (c?.data as Canvas);
    double sx = state.toNumber(2);
    double sy = state.toNumber(3);
    canvas.translate(sx, sy);
    return 0;
  }

  static int _luaColorIndex(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Color color = p?.data as Color;

    final key = state.checkString(2);
    switch (key) {
      case 'a':
        state.pushNumber(color.a);
        return 1;
      case 'b':
        state.pushNumber(color.b);
        return 1;
      case 'colorSpace':
        state.pushInteger(color.colorSpace.index);
        return 1;
      case 'g':
        state.pushNumber(color.g);
        return 1;
      case 'r':
        state.pushNumber(color.r);
        return 1;
    }

    state.getMetatableAux('MTColor');
    state.getField(-1, key);
    return 1;
  }

  static int _luaColorComputeLuminance(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Color color = p?.data as Color;

    state.pushNumber(color.computeLuminance());
    return 1;
  }

  static int _luaOffsetIndex(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Offset offset = p?.data as Offset;

    final key = state.checkString(2);
    switch (key) {
      case 'direction':
        state.pushNumber(offset.direction);
        return 1;
      case 'distance':
        state.pushNumber(offset.distance);
        return 1;
      case 'distanceSquared':
        state.pushNumber(offset.distanceSquared);
        return 1;
      case 'dx':
        state.pushNumber(offset.dx);
        return 1;
      case 'dy':
        state.pushNumber(offset.dy);
        return 1;
      case 'isFinite':
        state.pushBoolean(offset.isFinite);
        return 1;
      case 'isInfinite':
        state.pushBoolean(offset.isInfinite);
        return 1;
    }

    state.getMetatableAux('MTOffset');
    state.getField(-1, key);
    return 1;
  }

  static int _luaOffsetScale(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Offset offset = p?.data as Offset;
    double scaleX = state.toNumber(2);
    double scaleY = state.toNumber(3);

    Offset newOffset = offset.scale(scaleX, scaleY);
    Userdata toReturn = state.newUserdata();
    toReturn.data = newOffset;

    state.getMetatableAux('MTOffset');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaOffsetTranslate(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Offset offset = p?.data as Offset;
    double translateX = state.toNumber(2);
    double translateY = state.toNumber(3);

    Offset newOffset = offset.translate(translateX, translateY);
    Userdata toReturn = state.newUserdata();
    toReturn.data = newOffset;

    state.getMetatableAux('MTOffset');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaSizeIndex(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Size size = p?.data as Size;

    final key = state.checkString(2);
    switch (key) {
      case 'aspectRatio':
        state.pushNumber(size.aspectRatio);
        return 1;
      case 'flipped':
        var data = state.newUserdata();
        data.data = size.flipped;
        state.getMetatableAux('MTSize');
        state.setMetatable(-2);
        return 1;
      case 'height':
        state.pushNumber(size.height);
        return 1;
      case 'isEmpty':
        state.pushBoolean(size.isEmpty);
        return 1;
      case 'isFinite':
        state.pushBoolean(size.isFinite);
        return 1;
      case 'isInfinite':
        state.pushBoolean(size.isInfinite);
        return 1;
      case 'longestSide':
        state.pushNumber(size.longestSide);
        return 1;
      case 'shortestSide':
        state.pushNumber(size.shortestSide);
        return 1;
      case 'width':
        state.pushNumber(size.width);
        return 1;
    }

    state.getMetatableAux('MTSize');
    state.getField(-1, key);
    return 1;
  }

  static int _luaSizeToString(LuaState state) {
    Userdata? p = state.toUserdata(1);
    state.pushString((p!.data as Size).toString());
    return 1;
  }

  static int _luaRectIndex(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Rect rect = p?.data as Rect;

    final key = state.checkString(2);
    switch (key) {
      case 'bottom':
        state.pushNumber(rect.bottom);
        return 1;
      case 'bottomCenter':
        var data = state.newUserdata();
        data.data = rect.bottomCenter;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'bottomLeft':
        var data = state.newUserdata();
        data.data = rect.bottomLeft;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'bottomRight':
        var data = state.newUserdata();
        data.data = rect.bottomRight;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'center':
        var data = state.newUserdata();
        data.data = rect.center;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'centerLeft':
        var data = state.newUserdata();
        data.data = rect.centerLeft;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'centerRight':
        var data = state.newUserdata();
        data.data = rect.centerRight;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'hasNaN':
        state.pushBoolean(rect.hasNaN);
        return 1;
      case 'height':
        state.pushNumber(rect.height);
        return 1;
      case 'isEmpty':
        state.pushBoolean(rect.isEmpty);
        return 1;
      case 'isFinite':
        state.pushBoolean(rect.isFinite);
        return 1;
      case 'isInfinite':
        state.pushBoolean(rect.isInfinite);
        return 1;
      case 'left':
        state.pushNumber(rect.left);
        return 1;
      case 'longestSide':
        state.pushNumber(rect.longestSide);
        return 1;
      case 'right':
        state.pushNumber(rect.right);
        return 1;
      case 'shortestSide':
        state.pushNumber(rect.shortestSide);
        return 1;
      case 'size':
        var data = state.newUserdata();
        data.data = rect.size;
        state.getMetatableAux('MTSize');
        state.setMetatable(-2);
        return 1;
      case 'top':
        state.pushNumber(rect.top);
        return 1;
      case 'topCenter':
        var data = state.newUserdata();
        data.data = rect.topCenter;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'topLeft':
        var data = state.newUserdata();
        data.data = rect.topLeft;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'topRight':
        var data = state.newUserdata();
        data.data = rect.topRight;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case 'width':
        state.pushNumber(rect.width);
        return 1;
    }

    state.getMetatableAux('MTRect');
    state.getField(-1, key);
    return 1;
  }


  static int _luaRectContains(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Rect r = p!.data as Rect;
    Userdata? offset = state.toUserdata(2);

    state.pushBoolean(r.contains(offset!.data as Offset));
    return 1;
  }

  static int _luaRectDeflate(LuaState state) {
    Userdata? p = state.toUserdata(1);
    Rect r = p!.data as Rect;
    double delta = state.toNumber(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = r.deflate(delta);

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRectExpandToInclude(LuaState state) {
    Userdata? r1 = state.toUserdata(1);
    Userdata? r2 = state.toUserdata(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (r1!.data as Rect).expandToInclude(r2!.data as Rect);

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRectInflate(LuaState state) {
    Userdata? r1 = state.toUserdata(1);
    double delta = state.toNumber(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (r1!.data as Rect).inflate(delta);

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRectIntersect(LuaState state) {
    Userdata? r1 = state.toUserdata(1);
    Userdata? r2 = state.toUserdata(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (r1!.data as Rect).intersect(r2!.data as Rect);

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRectOverlaps(LuaState state) {
    Userdata? r1 = state.toUserdata(1);
    Userdata? r2 = state.toUserdata(2);

    state.pushBoolean((r1!.data as Rect).overlaps(r2!.data as Rect));

    return 1;
  }

  static int _luaRectShift(LuaState state) {
    Userdata? r1 = state.toUserdata(1);
    Userdata? offset = state.toUserdata(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (r1!.data as Rect).shift(offset!.data as Offset);

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRectTranslate(LuaState state) {
    Userdata? r1 = state.toUserdata(1);
    double translateX = state.toNumber(2);
    double translateY = state.toNumber(3);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (r1!.data as Rect).translate(translateX, translateY);

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRectLerp(LuaState state) {
    Userdata r1 = state.toUserdata(1)!;
    Userdata r2 = state.toUserdata(2)!;
    double t = state.toNumber(3);

    Userdata toReturn = state.newUserdata();
    toReturn.data = Rect.lerp(r1.data as Rect, r2.data as Rect, t)??Rect.zero;

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRadiusCircular(LuaState state) {
    double radius = state.toNumber(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = Radius.circular(radius);

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewRadiusElliptical(LuaState state) {
    double x = state.toNumber(1);
    double y = state.toNumber(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = Radius.elliptical(x,y);

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRadiusGetX(LuaState state) {
    Userdata? radius = state.toUserdata(1);
    state.pushNumber((radius!.data as Radius).x);
    return 1;
  }

  static int _luaRadiusGetY(LuaState state) {
    Userdata? radius = state.toUserdata(1);
    state.pushNumber((radius!.data as Radius).y);
    return 1;
  }

  static int _luaRadiusClamp(LuaState state) {
    Userdata? radius = state.toUserdata(1);
    Userdata? minimum = state.toUserdata(2);
    Userdata? maximum = state.toUserdata(3);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (radius!.data as Radius).clamp(minimum: minimum?.data as Radius?, maximum: maximum?.data as Radius?);

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRadiusClampValues(LuaState state) {
    Userdata? radius = state.toUserdata(1);
    double? minimumX = state.checkNumber(2);
    double? minimumY = state.checkNumber(3);
    double? maximumX = state.checkNumber(4);
    double? maximumY = state.checkNumber(5);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (radius!.data as Radius).clampValues(
      minimumX: minimumX,
      minimumY: minimumY,
      maximumX: maximumX,
      maximumY: maximumY
    );

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectFromLTRBAndCorners(LuaState state) {
    double left = state.toNumber(1);
    double top = state.toNumber(2);
    double right = state.toNumber(3);
    double bottom = state.toNumber(4);
    Userdata? topLeft = state.toUserdata(5);
    Userdata? topRight = state.toUserdata(6);
    Userdata? bottomRight = state.toUserdata(7);
    Userdata? bottomLeft = state.toUserdata(8);

    Userdata toReturn = state.newUserdata();
    toReturn.data = RRect.fromLTRBAndCorners(left, top, right, bottom,
      topLeft: (topLeft?.data as Radius?) ?? Radius.zero,
      topRight: (topRight?.data as Radius?) ?? Radius.zero,
      bottomRight: (bottomRight?.data as Radius?) ?? Radius.zero,
      bottomLeft: (bottomLeft?.data as Radius?) ?? Radius.zero,
    );

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectFromLTRBR(LuaState state) {
    double left = state.toNumber(1);
    double top = state.toNumber(2);
    double right = state.toNumber(3);
    double bottom = state.toNumber(4);
    Userdata? radius = state.toUserdata(5);

    Userdata toReturn = state.newUserdata();
    toReturn.data = RRect.fromLTRBR(left, top, right, bottom, radius!.data as Radius);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectFromLTRBXY(LuaState state) {
    double left = state.toNumber(1);
    double top = state.toNumber(2);
    double right = state.toNumber(3);
    double bottom = state.toNumber(4);
    double radiusX = state.toNumber(5);
    double radiusY = state.toNumber(6);

    Userdata toReturn = state.newUserdata();
    toReturn.data = RRect.fromLTRBXY(left, top, right, bottom, radiusX, radiusY);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectFromRectAndCorners(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    Userdata? topLeft = state.toUserdata(2);
    Userdata? topRight = state.toUserdata(3);
    Userdata? bottomRight = state.toUserdata(4);
    Userdata? bottomLeft = state.toUserdata(5);

    Userdata toReturn = state.newUserdata();
    toReturn.data = RRect.fromRectAndCorners(rect!.data as Rect,
      topLeft: (topLeft?.data as Radius?) ?? Radius.zero,
      topRight: (topRight?.data as Radius?) ?? Radius.zero,
      bottomRight: (bottomRight?.data as Radius?) ?? Radius.zero,
      bottomLeft: (bottomLeft?.data as Radius?) ?? Radius.zero,
    );

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectFromRectAndRadius(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    Userdata? radius = state.toUserdata(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = RRect.fromRectAndRadius(rect!.data as Rect, radius!.data as Radius);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectFromRectXY(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    double radiusX = state.toNumber(2);
    double radiusY = state.toNumber(3);

    Userdata toReturn = state.newUserdata();
    toReturn.data = RRect.fromRectXY(rect!.data as Rect, radiusX, radiusY);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectIndex(LuaState state) {
    Userdata? p = state.toUserdata(1);
    RRect rect = p?.data as RRect;

    final key = state.checkString(2);
    switch (key) {
      case 'blRadius':
        var data = state.newUserdata();
        data.data = rect.blRadius;
        state.getMetatableAux('MTRadius');
        state.setMetatable(-2);
        return 1;
      case 'blRadiusX':
        state.pushNumber(rect.blRadiusX);
        return 1;
      case 'blRadiusY':
        state.pushNumber(rect.blRadiusY);
        return 1;
      case 'bottom':
        state.pushNumber(rect.bottom);
        return 1;
      case 'brRadius':
        var data = state.newUserdata();
        data.data = rect.brRadius;
        state.getMetatableAux('MTRadius');
        state.setMetatable(-2);
        return 1;
      case 'brRadiusX':
        state.pushNumber(rect.brRadiusX);
        return 1;
      case 'brRadiusY':
        state.pushNumber(rect.brRadiusY);
        return 1;
      case 'center':
        var data = state.newUserdata();
        data.data = rect.center;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.center;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.centerLeft;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.centerRight;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        state.pushBoolean(rect.hasNaN);
        return 1;
      case '':
        state.pushNumber(rect.height);
        return 1;
      case '':
        state.pushBoolean(rect.isEmpty);
        return 1;
      case '':
        state.pushBoolean(rect.isFinite);
        return 1;
      case '':
        state.pushBoolean(rect.isInfinite);
        return 1;
      case '':
        state.pushNumber(rect.left);
        return 1;
      case '':
        state.pushNumber(rect.longestSide);
        return 1;
      case '':
        state.pushNumber(rect.right);
        return 1;
      case '':
        state.pushNumber(rect.shortestSide);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.size;
        state.getMetatableAux('MTSize');
        state.setMetatable(-2);
        return 1;
      case '':
        state.pushNumber(rect.top);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.topCenter;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.topLeft;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        var data = state.newUserdata();
        data.data = rect.topRight;
        state.getMetatableAux('MTOffset');
        state.setMetatable(-2);
        return 1;
      case '':
        state.pushNumber(rect.width);
        return 1;
    }

    state.getMetatableAux('MTRRect');
    state.getField(-1, key);
    return 1;

  }

  static int _luaRRectGetBlRadius(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).blRadius;

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetBlRadiusX(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).blRadiusX);
    return 1;
  }

  static int _luaRRectGetBlRadiusY(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).blRadiusY);
    return 1;
  }

  static int _luaRRectGetBottom(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).bottom);
    return 1;
  }

  static int _luaRRectGetBrRadius(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).brRadius;

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetBrRadiusX(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).brRadiusX);
    return 1;
  }

  static int _luaRRectGetBrRadiusY(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).brRadiusY);
    return 1;
  }

  static int _luaRRectGetCenter(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).center;

    state.getMetatableAux('MTOffset');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectHasNaN(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).hasNaN);
    return 1;
  }

  static int _luaRRectGetHeight(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).height);
    return 1;
  }

  static int _luaRRectIsCircle(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).isCircle);
    return 1;
  }

  static int _luaRRectIsEllipse(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).isEllipse);
    return 1;
  }

  static int _luaRRectIsEmpty(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).isEmpty);
    return 1;
  }

  static int _luaRRectIsFinite(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).isFinite);
    return 1;
  }

  static int _luaRRectIsRect(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).isRect);
    return 1;
  }

  static int _luaRRectIsStadium(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushBoolean((rect!.data as RRect).isStadium);
    return 1;
  }

  static int _luaRRectGetLeft(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).left);
    return 1;
  }

  static int _luaRRectGetLongestSide(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).longestSide);
    return 1;
  }

  static int _luaRRectGetMiddleRect(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).middleRect;

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetOuterRect(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).outerRect;

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetRight(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).right);
    return 1;
  }

  static int _luaRRectGetSafeInnerRect(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).safeInnerRect;

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetShortestSide(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).shortestSide);
    return 1;
  }

  static int _luaRRectGetTallMiddlerect(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).tallMiddleRect;

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetTlRadius(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).tlRadius;

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetTlRadiusX(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).tlRadiusX);
    return 1;
  }

  static int _luaRRectGetTlRadiusY(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).tlRadiusY);
    return 1;
  }

  static int _luaRRectGetTop(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).top);
    return 1;
  }

  static int _luaRRectGetTrRadius(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).trRadius;

    state.getMetatableAux('MTRadius');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetTrRadiusX(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).trRadiusX);
    return 1;
  }

  static int _luaRRectGetTrRadiusY(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).trRadiusY);
    return 1;
  }

  static int _luaRRectGetWideMiddleRect(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).wideMiddleRect;

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectGetWidth(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    state.pushNumber((rect!.data as RRect).width);
    return 1;
  }

  static int _luaRRectContains(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    Userdata? point = state.toUserdata(2);

    state.pushBoolean((rect!.data as RRect).contains(point!.data as Offset));
    return 1;
  }

  static int _luaRRectDeflate(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    double delta = state.toNumber(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).deflate(delta);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectInflate(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    double delta = state.toNumber(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).inflate(delta);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectScaleRadii(LuaState state) {
    Userdata? rect = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).scaleRadii();

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaRRectShift(LuaState state) {
    Userdata? rect = state.toUserdata(1);
    Userdata? offset = state.toUserdata(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (rect!.data as RRect).shift(offset!.data as Offset);

    state.getMetatableAux('MTRRect');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaNewPath(LuaState state) {
    Userdata toReturn = state.newUserdata();
    toReturn.data = Path();

    state.getMetatableAux('MTPath');
    state.setMetatable(-2);
    return 1;
  }

  static int _luaNewPathFrom(LuaState state) {
    Userdata? source =  state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = Path.from(source!.data as Path);

    state.getMetatableAux('MTPath');
    state.setMetatable(-2);
    return 1;
  }

  static int _luaPathGetFillType(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    state.pushInteger((path!.data as Path).fillType.index);
    return 1;
  }

  static int _luaPathSetFillType(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    int fillType = state.toInteger(2);
    (path!.data as Path).fillType = PathFillType.values[fillType];
    return 0;
  }

  static int _luaPathAddArc(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? oval =  state.toUserdata(2);
    double startAngle = state.toNumber(3);
    double sweepAngle = state.toNumber(4);

    (path!.data as Path).addArc(oval!.data as Rect, startAngle, sweepAngle);
    return 0;
  }

  static int _luaPathAddOval(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? oval =  state.toUserdata(2);

    (path!.data as Path).addOval(oval!.data as Rect);
    return 0;
  }

  static int _luaPathAddPath(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? inputPath =  state.toUserdata(2);
    Userdata? offset =  state.toUserdata(3);

    (path!.data as Path).addPath(inputPath!.data as Path, offset!.data as Offset);
    return 0;
  }

  static int _luaPathAddRect(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? rect =  state.toUserdata(2);

    (path!.data as Path).addRect(rect!.data as Rect);
    return 0;
  }

  static int _luaPathAddRRect(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? rect =  state.toUserdata(2);

    (path!.data as Path).addRRect(rect!.data as RRect);
    return 0;
  }

  static int _luaPathArcTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? rect =  state.toUserdata(2);
    double startAngle = state.toNumber(3);
    double sweepAngle = state.toNumber(4);
    bool forceMoveTo = state.toBoolean(5);

    (path!.data as Path).arcTo(rect!.data as Rect, startAngle, sweepAngle, forceMoveTo);
    return 0;
  }

  static int _luaPathArcToPoint(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? arcEnd =  state.toUserdata(2);
    Userdata? radius =  state.toUserdata(3);
    double rotation = state.toNumber(4);
    bool largeArc = state.toBoolean(5);
    bool clockwise = state.toBoolean(6);

    (path!.data as Path).arcToPoint(arcEnd!.data as Offset,
      radius: radius!.data as Radius,
      rotation: rotation,
      largeArc: largeArc,
      clockwise: clockwise
    );
    return 0;
  }

  static int _luaPathClose(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    (path!.data as Path).close();
    return 0;
  }

  static int _luaPathComputeMetrics(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    bool forceClosed = state.toBoolean(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (path!.data as Path).computeMetrics(forceClosed: forceClosed);

    state.getMetatableAux('MTPathMetrics');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaPathConicTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x1 = state.toNumber(2);
    double y1 = state.toNumber(3);
    double x2 = state.toNumber(4);
    double y2 = state.toNumber(5);
    double w = state.toNumber(6);

    (path!.data as Path).conicTo(x1, y1, x2, y2, w);
    return 0;
  }

  static int _luaPathContains(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? point = state.toUserdata(2);

    state.pushBoolean((path!.data as Path).contains(point!.data as Offset));
    return 1;
  }

  static int _luaPathCubicTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x1 = state.toNumber(2);
    double y1 = state.toNumber(3);
    double x2 = state.toNumber(4);
    double y2 = state.toNumber(5);
    double x3 = state.toNumber(6);
    double y3 = state.toNumber(7);

    (path!.data as Path).cubicTo(x1, y1, x2, y2, x3, y3);
    return 0;
  }

  static int _luaPathExtendWithPath(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? inputPath =  state.toUserdata(2);
    Userdata? offset =  state.toUserdata(3);

    (path!.data as Path).extendWithPath(inputPath!.data as Path, offset!.data as Offset);
    return 0;
  }

  static int _luaPathGetBounds(LuaState state) {
    Userdata? path =  state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (path!.data as Path).getBounds();

    state.getMetatableAux('MTRect');
    state.setMetatable(-2);
    return 1;
  }

  static int _luaPathLineTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x = state.toNumber(2);
    double y = state.toNumber(3);

    (path!.data as Path).lineTo(x, y);
    return 0;
  }

  static int _luaPathMoveTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x = state.toNumber(2);
    double y = state.toNumber(3);

    (path!.data as Path).moveTo(x, y);
    return 0;
  }

  static int _luaPathQuadraticBezierTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x1 = state.toNumber(2);
    double y1 = state.toNumber(3);
    double x2 = state.toNumber(4);
    double y2 = state.toNumber(5);

    (path!.data as Path).quadraticBezierTo(x1, y1, x2, y2);
    return 0;
  }

  static int _luaPathRelativeArcToPoint(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? offset =  state.toUserdata(2);
    Userdata? radius =  state.toUserdata(3);
    double rotation = state.toNumber(4);
    bool largeArc = state.toBoolean(5);
    bool clockwise = state.toBoolean(6);

    (path!.data as Path).relativeArcToPoint(offset!.data as Offset,
      radius: radius!.data as Radius,
      rotation: rotation,
      largeArc: largeArc,
      clockwise: clockwise
    );
    return 0;
  }

  static int _luaPathRelativeConicTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x1 = state.toNumber(2);
    double y1 = state.toNumber(3);
    double x2 = state.toNumber(4);
    double y2 = state.toNumber(5);
    double w = state.toNumber(6);

    (path!.data as Path).relativeConicTo(x1, y1, x2, y2, w);
    return 0;
  }

  static int _luaPathRelativeCubicTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x1 = state.toNumber(2);
    double y1 = state.toNumber(3);
    double x2 = state.toNumber(4);
    double y2 = state.toNumber(5);
    double x3 = state.toNumber(6);
    double y3 = state.toNumber(7);

    (path!.data as Path).relativeCubicTo(x1, y1, x2, y2, x3, y3);
    return 0;
  }

  static int _luaPathRelativeLineTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x = state.toNumber(2);
    double y = state.toNumber(3);

    (path!.data as Path).relativeLineTo(x, y);
    return 0;
  }

  static int _luaPathRelativeMoveTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x = state.toNumber(2);
    double y = state.toNumber(3);

    (path!.data as Path).relativeMoveTo(x, y);
    return 0;
  }

  static int _luaPathRelativeQuadraticBezierTo(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    double x1 = state.toNumber(2);
    double y1 = state.toNumber(3);
    double x2 = state.toNumber(4);
    double y2 = state.toNumber(5);

    (path!.data as Path).relativeQuadraticBezierTo(x1, y1, x2, y2);
    return 0;
  }

  static int _luaPathReset(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    (path!.data as Path).reset();
    return 0;
  }

  static int _luaPathShift(LuaState state) {
    Userdata? path =  state.toUserdata(1);
    Userdata? offset =  state.toUserdata(2);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (path!.data as Path).shift(offset!.data as Offset);

    state.getMetatableAux('MTPath');
    state.setMetatable(-2);
    return 1;
  }

  static int _luaParagraphAlphabeticBaseline(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).alphabeticBaseline);
    return 1;
  }

  static int _luaParagraphDidExceedMaxLines(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushBoolean((paragraph!.data as Paragraph).didExceedMaxLines);
    return 1;
  }

  static int _luaParagraphHeight(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).height);
    return 1;
  }

  static int _luaParagraphIdeographicBaseline(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).ideographicBaseline);
    return 1;
  }

  static int _luaParagraphLongestLine(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).longestLine);
    return 1;
  }

  static int _luaParagraphMaxIntrinsicWidth(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).maxIntrinsicWidth);
    return 1;
  }

  static int _luaParagraphMinIntrinsicWidth(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).minIntrinsicWidth);
    return 1;
  }

  static int _luaParagraphNumberOfLines(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushInteger((paragraph!.data as Paragraph).numberOfLines);
    return 1;
  }

  static int _luaParagraphWidth(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    state.pushNumber((paragraph!.data as Paragraph).width);
    return 1;
  }

  static int _luaParagraphLayout(LuaState state) {
    Userdata? paragraph =  state.toUserdata(1);
    double constraints = state.toNumber(2);
    (paragraph!.data as Paragraph).layout(ParagraphConstraints(width: constraints));
    return 0;
  }

  static int _luaNewParagraphStyle(LuaState state) {
    TextAlign? textAlign;
    TextDirection? textDirection;
    int? maxLines;
    String? fontFamily;
    double? fontSize;
    double? height;
    TextHeightBehavior? textHeightBehavior;
    FontWeight? fontWeight;
    FontStyle? fontStyle;
    StrutStyle? strutStyle;
    String? ellipsis;
    Locale? locale;

    if (state.isTable(1)) {
      state.getField(1, 'textAlign');
      int? textAlignIndex = state.toIntegerX(-1);
      if (textAlignIndex != null) {
        textAlign = TextAlign.values[textAlignIndex];
      }

      state.getField(1, 'textDirection');
      int? textDirectionIndex = state.toIntegerX(-1);
      if (textDirectionIndex != null) {
        textDirection = TextDirection.values[textDirectionIndex];
      }

      state.getField(1, 'maxLines');
      maxLines = state.toIntegerX(-1);

      state.getField(1, 'fontFamily');
      fontFamily = state.toStr(-1);

      state.getField(1, 'fontSize');
      fontSize = state.toNumberX(-1);

      state.getField(1, 'height');
      height = state.toNumberX(-1);

      // TODO TextHeightBehavior
      // TODO FontWeight

      state.getField(1, 'fontStyle');
      int? fontStyleIndex = state.toIntegerX(-1);
      if (fontStyleIndex != null) {
        fontStyle = FontStyle.values[fontStyleIndex];
      }

      // TODO StrutStyle

      state.getField(1, 'ellipsis');
      ellipsis = state.toStr(-1);

      // TODO Locale
    }

    Userdata toReturn = state.newUserdata();
    toReturn.data = ParagraphStyle(
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      fontFamily: fontFamily,
      fontSize: fontSize,
      height: height,
      textHeightBehavior: textHeightBehavior,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      strutStyle: strutStyle,
      ellipsis: ellipsis,
      locale: locale
    );
    return 1;
  }

  static int _luaNewParagraphBuilder(LuaState state) {
    Userdata? style = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = ParagraphBuilder(style!.data as ParagraphStyle);

    state.getMetatableAux('MTParagraphBuilder');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaParagraphBuilderPlaceholderCount(LuaState state) {
    Userdata? paragraphBuilder = state.toUserdata(1);
    state.pushInteger((paragraphBuilder!.data as ParagraphBuilder).placeholderCount);
    return 1;
  }

  static int _luaParagraphBuilderAddPlaceholder(LuaState state) {
    Userdata? paragraphBuilder = state.toUserdata(1);
    double width = state.toNumber(2);
    double height = state.toNumber(3);
    PlaceholderAlignment alignment = PlaceholderAlignment.values[state.toInteger(4)];
    // TODO scale
    // TODO baselineOffset
    // TODO baseline

    (paragraphBuilder!.data as ParagraphBuilder).addPlaceholder(width, height, alignment);
    return 0;
  }

  static int _luaParagraphBuilderAddText(LuaState state) {
    Userdata? paragraphBuilder = state.toUserdata(1);
    String text = state.toStr(2)!;
    (paragraphBuilder!.data as ParagraphBuilder).addText(text);
    return 0;
  }

  static int _luaParagraphBuilderBuild(LuaState state) {
    Userdata? paragraphBuilder = state.toUserdata(1);

    Userdata toReturn = state.newUserdata();
    toReturn.data = (paragraphBuilder!.data as ParagraphBuilder).build();

    state.getMetatableAux('MTParagraph');
    state.setMetatable(-2);

    return 1;
  }

  static int _luaParagraphBuilderPop(LuaState state) {
    Userdata? paragraphBuilder = state.toUserdata(1);
    (paragraphBuilder!.data as ParagraphBuilder).pop();
    return 0;
  }

  static int _luaParagraphBuilderPushStyle(LuaState state) {
    Userdata? paragraphBuilder = state.toUserdata(1);
    Userdata? style = state.toUserdata(2);
    (paragraphBuilder!.data as ParagraphBuilder).pushStyle((style!.data as TextStyle));
    return 0;
  }

  static int _luaNewTextStyle(LuaState state) {
    Color? color;
    TextDecoration? decoration;
    Color? decorationColor;
    TextDecorationStyle? decorationStyle;
    double? decorationThickness;
    FontWeight? fontWeight;
    FontStyle? fontStyle;
    TextBaseline? textBaseline;
    String? fontFamily;
    List<String>? fontFamilyFallback;
    double? fontSize;
    double? letterSpacing;
    double? wordSpacing;
    double? height;
    TextLeadingDistribution? leadingDistribution;
    Locale? locale;
    Paint? background;
    Paint? foreground;
    List<Shadow>? shadows;
    List<FontFeature>? fontFeatures;
    List<FontVariation>? fontVariations;

    if (state.isTable(1)) {
      state.getField(1, 'color');
      color = state.toUserdata(-1)?.data as Color?;

      // TODO TextDecoration

      state.getField(1, 'decorationColor');
      decorationColor = state.toUserdata(-1)?.data as Color?;

      state.getField(1, 'decorationStyle');
      int? decorationStyleIndex = state.toIntegerX(-1);
      if (decorationStyleIndex != null) {
        decorationStyle = TextDecorationStyle.values[decorationStyleIndex];
      }

      state.getField(1, 'decorationThickness');
      decorationThickness = state.toNumberX(-1);

      // TODO FontWeight

      state.getField(1, 'fontStyle');
      int? fontStyleIndex = state.toIntegerX(-1);
      if (fontStyleIndex != null) {
        fontStyle = FontStyle.values[fontStyleIndex];
      }

      state.getField(1, 'textBaseline');
      int? textBaselineIndex = state.toIntegerX(-1);
      if (textBaselineIndex != null) {
        textBaseline = TextBaseline.values[textBaselineIndex];
      }

      state.getField(1, 'fontFamily');
      fontFamily = state.toStr(-1);

      // TODO fontFamilyFallback

      state.getField(1, 'fontSize');
      fontSize = state.toNumberX(-1);

      state.getField(1, 'letterSpacing');
      letterSpacing = state.toNumberX(-1);

      state.getField(1, 'wordSpacing');
      wordSpacing = state.toNumberX(-1);

      state.getField(1, 'height');
      height = state.toNumberX(-1);

      state.getField(1, 'leadingDistribution');
      int? leadingDistributionIndex = state.toIntegerX(-1);
      if (leadingDistributionIndex != null) {
        leadingDistribution = TextLeadingDistribution.values[leadingDistributionIndex];
      }

      // TODO Locale

      state.getField(1, 'background');
      background = state.toUserdata(-1)?.data as Paint?;

      state.getField(1, 'foreground');
      foreground = state.toUserdata(-1)?.data as Paint?;

      // TODO shadows
      // TODO fontFeatures
      // TODO fontVariations
    }

    Userdata toReturn = state.newUserdata();
    toReturn.data = TextStyle(
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      textBaseline: textBaseline,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      leadingDistribution: leadingDistribution,
      locale: locale,
      background: background,
      foreground: foreground,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations
    );

    return 1;
  }

  static int _luaNewLinearShader(LuaState state) {
    List<Color> colors = [];
    Rect rect = Rect.zero;

    if (state.isTable(1)) {
      state.getField(1, 'colors');
      state.pushNil();
      while (state.next(-2)) {
        colors.add(state.toUserdata(-1)?.data as Color);
        state.pop(1);
      }

      state.getField(1,'rect');
      var data = state.toUserdata(-1)!;
      rect = data.data as Rect;
    }

    var shader = LinearGradient(colors: colors).createShader(rect);
    var toReturn = state.newUserdata();
    toReturn.data = shader;
    return 1;
  }

  static int _luaNewRadialGradient(LuaState state) {
    return 1;
  }

  static int _luaNewMaskFilterBlur(LuaState state) {

    var style = BlurStyle.values[state.toInteger(1)];
    double sigma = state.toNumber(2);
    var blur = MaskFilter.blur(style, sigma);

    var toReturn = state.newUserdata();
    toReturn.data = blur;

    return 1;
  }

  static int _luaNewImageFilterBlur(LuaState state) {

    double x = state.toNumber(1);
    double y = state.toNumber(2);
    int? tileModeInteger = state.toIntegerX(3);
    TileMode? tileMode = tileModeInteger != null ? TileMode.values[tileModeInteger] : null;

    var toReturn = state.newUserdata();
    toReturn.data = ImageFilter.blur(sigmaX: x, sigmaY: y, tileMode: tileMode);

    return 1;
  }

  static int _luaImageGetWidth(LuaState state) {
    Userdata? image = state.toUserdata(1);
    state.pushInteger((image!.data as Image).width);
    return 1;
  }

  static int _luaImageGetHeight(LuaState state) {
    Userdata? image = state.toUserdata(1);
    state.pushInteger((image!.data as Image).height);
    return 1;
  }

  static int _luaImageGetColorSpace(LuaState state) {
    Userdata? image = state.toUserdata(1);
    state.pushInteger((image!.data as Image).colorSpace.index);
    return 1;
  }

  static int _luaBounceIn(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.bounceIn.transform(value));
    return 1;
  }

  static int _luaBounceInOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.bounceInOut.transform(value));
    return 1;
  }

  static int _luaBounceOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.bounceOut.transform(value));
    return 1;
  }

  static int _luaDecelerate(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.decelerate.transform(value));
    return 1;
  }

  static int _luaEase(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.ease.transform(value));
    return 1;
  }

  static int _luaEaseIn(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeIn.transform(value));
    return 1;
  }

  static int _luaEaseInBack(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInBack.transform(value));
    return 1;
  }

  static int _luaEaseInCirc(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInCirc.transform(value));
    return 1;
  }

  static int _luaEaseInCubic(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInCubic.transform(value));
    return 1;
  }

  static int _luaEaseInExpo(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInExpo.transform(value));
    return 1;
  }

  static int _luaEaseInOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOut.transform(value));
    return 1;
  }

  static int _luaEaseInOutBack(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutBack.transform(value));
    return 1;
  }

  static int _luaEaseInOutCirc(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutCirc.transform(value));
    return 1;
  }

  static int _luaEaseInOutCubic(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutCubic.transform(value));
    return 1;
  }

  static int _luaEaseInOutCubicEmphasized(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutCubicEmphasized.transform(value));
    return 1;
  }

  static int _luaEaseInOutExpo(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutExpo.transform(value));
    return 1;
  }

  static int _luaEaseInOutQuad(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutQuad.transform(value));
    return 1;
  }

  static int _luaEaseInOutQuart(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutQuart.transform(value));
    return 1;
  }

  static int _luaEaseInOutQuint(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutQuint.transform(value));
    return 1;
  }

  static int _luaEaseInOutSine(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInOutSine.transform(value));
    return 1;
  }

  static int _luaEaseInQuad(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInQuad.transform(value));
    return 1;
  }

  static int _luaEaseInQuart(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInQuart.transform(value));
    return 1;
  }

  static int _luaEaseInQuint(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInQuint.transform(value));
    return 1;
  }

  static int _luaEaseInSine(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInSine.transform(value));
    return 1;
  }

  static int _luaEaseInToLinear(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeInToLinear.transform(value));
    return 1;
  }

  static int _luaEaseOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOut.transform(value));
    return 1;
  }

  static int _luaEaseOutBack(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutBack.transform(value));
    return 1;
  }

  static int _luaEaseOutCirc(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutCirc.transform(value));
    return 1;
  }

  static int _luaEaseOutCubic(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutCubic.transform(value));
    return 1;
  }

  static int _luaEaseOutExpo(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutExpo.transform(value));
    return 1;
  }

  static int _luaEaseOutQuad(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutQuad.transform(value));
    return 1;
  }

  static int _luaEaseOutQuart(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutQuart.transform(value));
    return 1;
  }

  static int _luaEaseOutQuint(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutQuint.transform(value));
    return 1;
  }

  static int _luaEaseOutSine(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.easeOutSine.transform(value));
    return 1;
  }

  static int _luaElasticIn(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.elasticIn.transform(value));
    return 1;
  }

  static int _luaElasticInOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.elasticInOut.transform(value));
    return 1;
  }

  static int _luaElasticOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.elasticOut.transform(value));
    return 1;
  }

  static int _luaFastEaseInToSlowEaseOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.fastEaseInToSlowEaseOut.transform(value));
    return 1;
  }

  static int _luaFastLinearToSlowEaseIn(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.fastLinearToSlowEaseIn.transform(value));
    return 1;
  }

  static int _luaFastOutSlowIn(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.fastOutSlowIn.transform(value));
    return 1;
  }

  static int _luaLinear(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.linear.transform(value));
    return 1;
  }

  static int _luaLinearToEaseOut(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.linearToEaseOut.transform(value));
    return 1;
  }

  static int _luaSlowMiddle(LuaState state) {
    double value = state.toNumber(1);
    state.pushNumber(Curves.slowMiddle.transform(value));
    return 1;
  }

}