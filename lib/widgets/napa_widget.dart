import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'napa_align.dart';
import 'napa_aspect_ratio.dart';
import 'napa_backdrop_filter.dart';
import 'napa_baseline.dart';
import 'napa_center.dart';
import 'napa_clip_rect.dart';
import 'napa_column.dart';
import 'napa_container.dart';
import 'napa_custom_paint.dart';
import 'napa_decorated_box.dart';
import 'napa_expanded.dart';
import 'napa_fitted_box.dart';
import 'napa_flex.dart';
import 'napa_flexible.dart';
import 'napa_image.dart';
import 'napa_old_film_effect.dart';
import 'napa_opacity.dart';
import 'napa_padding.dart';
import 'napa_positioned.dart';
import 'napa_rotated_box.dart';
import 'napa_row.dart';
import 'napa_sized_box.dart';
import 'napa_stack.dart';
import 'napa_text.dart';
import 'napa_transform.dart';
import 'napa_wrap.dart';

abstract class NapaWidget with Inspectable {
  final NapaChildMode childMode;

  NapaWidget({this.childMode = NapaChildMode.noChild}) {
    properties.addAll([
      InspectableProperty<String>(
        name: 'type',
        readOnly: true,
        getValue: (obj) => widgetName,
      ),
    ]);
  }

  dynamic toJson() {
    return <String, dynamic>{'_name': widgetName};
  }

  String get widgetName => 'Widget';

  @override
  String toString() => widgetName;

  Widget? get treePreview => null;

  Widget toWidget();

  static NapaWidget? decode(dynamic data) {
    if (data is Map<String, dynamic>) {
      String name = data['_name'];
      switch (name) {
        case 'Align':
          return NapaAlign.decode(data);
        case 'AspectRatio':
          return NapaAspectRatio.decode(data);
        case 'BackdropFilter':
          return NapaBackdropFilter.decode(data);
        case 'Baseline':
          return NapaBaseline.decode(data);
        case 'Center':
          return NapaCenter.decode(data);
        //case 'ClipPath':
        //  return NapaClipPath.decode(data);
        case 'ClipRect':
          return NapaClipRect.decode(data);
        case 'Column':
          return NapaColumn.decode(data);
        case 'Container':
          return NapaContainer.decode(data);
        case 'CustomPaint':
          return NapaCustomPaint.decode(data);
        case 'DecoratedBox':
          return NapaDecoratedBox.decode(data);
        case 'Expanded':
          return NapaExpanded.decode(data);
        case 'FittedBox':
          return NapaFittedBox.decode(data);
        case 'Flex':
          return NapaFlex.decode(data);
        case 'Flexible':
          return NapaFlexible.decode(data);
        //case 'Icon':
        //  return NapaIcon.decode(data);
        case 'Image':
          return NapaImage.decode(data);
        //case 'ListView':
        //  return NapaListView.decode(data);
        case 'OldFilmEffect':
          return NapaOldFilmEffect.decode(data);
        case 'Opacity':
          return NapaOpacity.decode(data);
        case 'Padding':
          return NapaPadding.decode(data);
        case 'Positioned':
          return NapaPositioned.decode(data);
        case 'RotatedBox':
          return NapaRotatedBox.decode(data);
        case 'Row':
          return NapaRow.decode(data);
        case 'SizedBox':
          return NapaSizedBox.decode(data);
        case 'Stack':
          return NapaStack.decode(data);
        case 'Text':
          return NapaText.decode(data);
        case 'Transform':
          return NapaTransform.decode(data);
        case 'Wrap':
          return NapaWrap.decode(data);
      }
    }

    return null;
  }
}

enum NapaChildMode { noChild, singleChild, multiChild }
