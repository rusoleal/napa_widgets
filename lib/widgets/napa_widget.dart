import 'package:flutter/widgets.dart';
import 'package:inspectable_property/inspectable.dart';
import 'package:napa_widgets/napa_widgets.dart';

/// Wrapper class for Widget base class.
/// https://api.flutter.dev/flutter/widgets/Widget-class.html
///
/// Acts as base class for any [NapaWidget].
///
/// Exposes type as read-only property.
///
abstract class NapaWidget with Inspectable {

  /// Decoding register. Only NapaWidgets added to _register can be decoded.
  ///
  /// Custom [NapaWidgets] must be registered via [registerNapaWidget] function
  /// in order to be decoded
  ///
  /// By default, _register is populated with built-in [NapaWidgets].
  ///
  static final Map<String, NapaWidget? Function(dynamic data)> _register = {
    'AbsorbPointer': (data) => NapaAbsorbPointer.decode(data),
    'Align': (data) => NapaAlign.decode(data),
    'DefaultTextStyle': (data) => NapaDefaultTextStyle.decode(data),
    'Directionality': (data) => NapaDirectionality.decode(data),
    'AspectRatio': (data) => NapaAspectRatio.decode(data),
    'BackdropFilter': (data) => NapaBackdropFilter.decode(data),
    'Baseline': (data) => NapaBaseline.decode(data),
    'Center': (data) => NapaCenter.decode(data),
    'ClipPath': (data) => NapaClipPath.decode(data),
    'ClipOval': (data) => NapaClipOval.decode(data),
    'ClipRect': (data) => NapaClipRect.decode(data),
    'ClipRRect': (data) => NapaClipRRect.decode(data),
    'ClipRSuperellipse': (data) => NapaClipRSuperellipse.decode(data),
    'ColoredBox': (data) => NapaColoredBox.decode(data),
    'Column': (data) => NapaColumn.decode(data),
    'ConstrainedBox': (data) => NapaConstrainedBox.decode(data),
    'Container': (data) => NapaContainer.decode(data),
    'CustomPaint': (data) => NapaCustomPaint.decode(data),
    'DecoratedBox': (data) => NapaDecoratedBox.decode(data),
    'Expanded': (data) => NapaExpanded.decode(data),
    'FittedBox': (data) => NapaFittedBox.decode(data),
    'FractionallySizedBox': (data) => NapaFractionallySizedBox.decode(data),
    'GestureDetector': (data) => NapaGestureDetector.decode(data),
    'Flex': (data) => NapaFlex.decode(data),
    'Flexible': (data) => NapaFlexible.decode(data),
    'Flow': (data) => NapaFlow.decode(data),
    'IgnorePointer': (data) => NapaIgnorePointer.decode(data),
    'IntrinsicHeight': (data) => NapaIntrinsicHeight.decode(data),
    'IntrinsicWidth': (data) => NapaIntrinsicWidth.decode(data),
    //case 'Icon':
    //  return NapaIcon.decode(data);
    'Image': (data) => NapaImage.decode(data),
    'IndexedStack': (data) => NapaIndexedStack.decode(data),
    'LimitedBox': (data) => NapaLimitedBox.decode(data),
    'Listener': (data) => NapaListener.decode(data),
    'ListView': (data) => NapaListView.decode(data),
    'MouseRegion': (data) => NapaMouseRegion.decode(data),
    'Offstage': (data) => NapaOffstage.decode(data),
    'OverflowBox': (data) => NapaOverflowBox.decode(data),
    'Opacity': (data) => NapaOpacity.decode(data),
    'Padding': (data) => NapaPadding.decode(data),
    'Positioned': (data) => NapaPositioned.decode(data),
    'RepaintBoundary': (data) => NapaRepaintBoundary.decode(data),
    'RotatedBox': (data) => NapaRotatedBox.decode(data),
    'Row': (data) => NapaRow.decode(data),
    'SafeArea': (data) => NapaSafeArea.decode(data),
    'SingleChildScrollView': (data) => NapaSingleChildScrollView.decode(data),
    'SizedOverflowBox': (data) => NapaSizedOverflowBox.decode(data),
    'SizedBox': (data) => NapaSizedBox.decode(data),
    'Stack': (data) => NapaStack.decode(data),
    'Text': (data) => NapaText.decode(data),
    'Transform': (data) => NapaTransform.decode(data),
    'UnconstrainedBox': (data) => NapaUnconstrainedBox.decode(data),
    'Visibility': (data) => NapaVisibility.decode(data),
    'Wrap': (data) => NapaWrap.decode(data),
    'AnimatedAlign': (data) => NapaAnimatedAlign.decode(data),
    'AnimatedContainer': (data) => NapaAnimatedContainer.decode(data),
    'AnimatedOpacity': (data) => NapaAnimatedOpacity.decode(data),
    'AnimatedPadding': (data) => NapaAnimatedPadding.decode(data),
    'AnimatedPositioned': (data) => NapaAnimatedPositioned.decode(data),
    'AnimatedRotation': (data) => NapaAnimatedRotation.decode(data),
    'AnimatedScale': (data) => NapaAnimatedScale.decode(data),
    'AnimatedSize': (data) => NapaAnimatedSize.decode(data),
    'AnimatedSlide': (data) => NapaAnimatedSlide.decode(data),
    'ExcludeSemantics': (data) => NapaExcludeSemantics.decode(data),
    'GridView': (data) => NapaGridView.decode(data),
    'InteractiveViewer': (data) => NapaInteractiveViewer.decode(data),
    'MergeSemantics': (data) => NapaMergeSemantics.decode(data),
    'PhysicalModel': (data) => NapaPhysicalModel.decode(data),
    'AnimatedSwitcher': (data) => NapaAnimatedSwitcher.decode(data),
    'AnimatedCrossFade': (data) => NapaAnimatedCrossFade.decode(data),
    'PageView': (data) => NapaPageView.decode(data),
    'Focus': (data) => NapaFocus.decode(data),
    'FocusScope': (data) => NapaFocusScope.decode(data),
    'Semantics': (data) => NapaSemantics.decode(data),
    'RichText': (data) => NapaRichText.decode(data),
  };

  final NapaChildMode childMode;

  NapaWidget({this.childMode = NapaChildMode.noChildren}) {
    properties.addAll([
      InspectableProperty<String>(
        name: 'type',
        readOnly: true,
        getValue: (obj) => widgetName,
      ),
    ]);
  }

  /// toJson returns a json compatible object.
  ///
  /// Descendants must override this method to expose custom properties.
  dynamic toJson() {
    return <String, dynamic>{'_name': widgetName};
  }

  String get widgetName => 'Widget';

  @override
  String toString() => widgetName;

  /// Get a Flutter widget equivalent object.
  ///
  /// Descendants must override it.
  Widget toWidget();

  /// Deserialize a json compatible object  into a [NapaWidget] or null.
  static NapaWidget? decode(dynamic data) {
    if (data is Map<String, dynamic>) {
      String name = '';
      try {
        try {
          name = data['_name'];
        } catch (ex) {
          throw Exception('_name property not found.');
        }
        final decodeRegister = _register[name];
        if (decodeRegister != null) {
          return decodeRegister(data);
        } else {
          throw Exception('Unknown implementation for widget \'$name\'');
        }
      } on _NapaException catch (ex) {
        throw _NapaException('Exception decoding widget \'$name\'\n$ex');
      }
    }

    return null;
  }

  /// Add a new [NapaWidget] implementation to decoding register.
  ///
  /// Only [NapaWidgets] added to the register has the ability to be
  /// decoded (deserialized).
  ///
  static void registerNapaWidget(
    String name,
    NapaWidget? Function(dynamic data) decodeFunction,
  ) {
    _register[name] = decodeFunction;
  }

  /// Remove a previously registered [NapaWidget] from the decoding register.
  ///
  /// Has no effect if [name] was never registered.
  ///
  static void unregisterNapaWidget(String name) {
    _register.remove(name);
  }
}

/// Describes [NapaWidget] descendants.
enum NapaChildMode {
  /// Widget has no children.
  noChildren,

  // Widget has one child.
  singleChild,

  // Widget has multiple children.
  multipleChildren,
}

class _NapaException implements Exception {

  String cause;

  _NapaException(this.cause);

  @override
  String toString() => cause;
}