## 0.6.0

* Added NapaAnimatedCrossFade widget.
* Added NapaAnimatedSwitcher widget.
* Added NapaFocus widget.
* Added NapaFocusScope widget.
* Added NapaPageView widget.
* Added NapaRichText widget with NapaTextSpan data class.
* Added NapaSemantics widget.
* Added NapaAnimatedAlign widget.
* Added NapaAnimatedContainer widget.
* Added NapaAnimatedOpacity widget.
* Added NapaAnimatedPadding widget.
* Added NapaAnimatedPositioned widget.
* Added NapaAnimatedRotation widget.
* Added NapaAnimatedScale widget.
* Added NapaAnimatedSize widget.
* Added NapaAnimatedSlide widget.
* Added NapaExcludeSemantics widget.
* Added NapaGridView widget (GridView.count variant).
* Added NapaInteractiveViewer widget.
* Added NapaMergeSemantics widget.
* Added NapaPhysicalModel widget.
* Added Duration and Curve serialization helpers (decodeDuration, decodeCurve).
* Added NapaDefaultTextStyle widget.
* Added NapaDirectionality widget.
* Added NapaFractionallySizedBox widget.
* Added NapaIntrinsicHeight widget.
* Added NapaIntrinsicWidth widget.
* Added NapaLimitedBox widget.
* Added NapaListener widget.
* Added NapaMouseRegion widget with SystemMouseCursor serialization support.
* Added NapaOverflowBox widget.
* Added NapaSafeArea widget.
* Added NapaSizedOverflowBox widget.
* Added NapaUnconstrainedBox widget.
* Added NapaAbsorbPointer widget.
* Added NapaColoredBox widget.
* Added NapaConstrainedBox widget.
* Added NapaIgnorePointer widget.
* Added NapaIndexedStack widget.
* Added NapaOffstage widget.
* Added NapaSingleChildScrollView widget.
* Added NapaVisibility widget.
* Unit testing for all new widgets.

## 0.5.0

* Added NapaGestureDetector widget with full serialization and inspection support.

## 0.4.1

* Unit testing for napa widgets.
* Fix some serialization errors.

## 0.4.0

* Custom NapaWidgets must be registered via NapaWidget.registerNapaWidget() method.
* Dependency for Lua scripting library.
* NapaCustomPaint with Lua script.

## 0.3.0

* New widget implementations:
* ListView.
* RepaintBoundary.
* ClipOval.
* ClipPath.
* ClipRect.
* ClipRRect.
* ClipRSuperellipse.

## 0.2.2

* Change inspectable enum properties to Enum type. Now Enum properties can use built-in enum editor.

## 0.2.1

* Fix export of NapaWidget base class.

## 0.2.0

* Document napa widgets.
* Replace TextScaler by NapaTextScaler. Removed deprecated property.
* Throw exception for unknown deserialized widgets.

## 0.1.0

* Initial version with basic widgets.
