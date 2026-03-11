# napa_widgets

Inspectable and serializable wrappers around standard Flutter widgets. Build widget trees at runtime, serialize them to JSON, deserialize them back, and inspect or modify properties on the fly — with optional Lua scripting for custom painting and gesture logic.

## Features

- **Runtime inspection** — every widget exposes its properties through a unified `Inspectable` interface, making it easy to build property editors and live preview tools
- **JSON serialization** — full round-trip `toJson()` / `decode()` for the entire widget tree, including nested children and complex types
- **Widget registration** — a global registry allows custom widgets to plug into the same decode pipeline
- **Lua scripting** — `NapaCustomPaint`, `NapaFlow`, and `NapaGestureDetector` accept inline Lua scripts for runtime-defined drawing and interaction logic
- **70+ widgets covered** — layout, scrolling, animation, semantics, text, interaction, and more

## Usage

### Composing a widget tree

Build a tree of `NapaWidget`s and call `toWidget()` to get the standard Flutter widget:

```dart
import 'package:napa_widgets/napa_widgets.dart';

final napaTree = NapaPadding(
  padding: const EdgeInsets.all(16),
  child: NapaColumn(
    children: [
      NapaText('Hello, world!'),
      NapaSizedBox(height: 8),
      NapaContainer(
        color: const Color(0xFF2196F3),
        width: 120,
        height: 40,
      ),
    ],
  ),
);

// Convert to a real Flutter widget
Widget flutterWidget = napaTree.toWidget();
```

### Serialization

Serialize a widget tree to JSON and restore it:

```dart
// Serialize
Map<String, dynamic> json = napaTree.toJson();

// Deserialize
NapaWidget? restored = NapaWidget.decode(json);
```

A serialized `NapaText` looks like:

```json
{
  "_name": "Text",
  "data": "Hello, world!",
  "style": {
    "fontSize": 16.0,
    "color": { "r": 0.0, "g": 0.0, "b": 0.0, "a": 1.0, "colorSpace": "sRGB" }
  }
}
```

### Runtime inspection

Every widget exposes its properties via the `Inspectable` mixin:

```dart
final widget = NapaContainer(color: Colors.red, width: 100, height: 80);

for (final prop in widget.properties) {
  print('${prop.name}: ${prop.getValue(widget)}');
}

// Modify a property at runtime
final colorProp = widget.properties.firstWhere((p) => p.name == 'color');
colorProp.setValue(widget, Colors.blue, null);
```

### Registering custom widgets

Custom `NapaWidget` subclasses can be registered once at app startup:

```dart
NapaWidget.registerNapaWidget('MyWidget', MyNapaWidget.decode);
```

After registration, `NapaWidget.decode(json)` will dispatch to your class whenever `_name == 'MyWidget'`.

### Lua scripting

`NapaCustomPaint` accepts an inline Lua script that implements a `paint(canvas, size)` function. The `ui.*` namespace exposes ~80 drawing primitives:

```dart
final painter = NapaCustomPaint(
  painter: NapaCustomPainter(
    type: NapaCustomPainterType.lua,
    script: '''
      function paint(canvas, size)
        local paint = ui.newPaint()
        ui.paintSetColor(paint, ui.newColor(0.2, 0.6, 1.0, 1.0))
        ui.canvasDrawRect(canvas,
          ui.newRect(0, 0, size.width, size.height), paint)
      end
    ''',
  ),
);
```

### Implicit animations

All Flutter implicit animation widgets are supported. Changing a property and rebuilding produces a smooth transition:

```dart
NapaAnimatedContainer(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  width: isExpanded ? 200 : 100,
  color: isExpanded ? Colors.blue : Colors.grey,
  child: NapaText('Tap me'),
)
```

### Rich text

`NapaRichText` uses the `NapaTextSpan` data class for fully serializable styled text trees:

```dart
NapaRichText(
  text: NapaTextSpan(
    children: [
      NapaTextSpan(text: 'Hello ', style: NapaTextStyle(fontSize: 16)),
      NapaTextSpan(
        text: 'world',
        style: NapaTextStyle(fontSize: 16, color: const Color(0xFF2196F3)),
      ),
    ],
  ),
)
```

## Widget coverage

| Widget                | Status  | Lua scripting | Notes                             |
|-----------------------|---------|:-------------:|-----------------------------------|
| AbsorbPointer         | ✅      |               |                                   |
| Align                 | ✅      |               |                                   |
| AnimatedAlign         | ✅      |               |                                   |
| AnimatedContainer     | ✅      |               |                                   |
| AnimatedCrossFade     | ✅      |               |                                   |
| AnimatedOpacity       | ✅      |               |                                   |
| AnimatedPadding       | ✅      |               |                                   |
| AnimatedPositioned    | ✅      |               | Must be child of Stack            |
| AnimatedRotation      | ✅      |               |                                   |
| AnimatedScale         | ✅      |               |                                   |
| AnimatedSize          | ✅      |               |                                   |
| AnimatedSlide         | ✅      |               |                                   |
| AnimatedSwitcher      | ✅      |               |                                   |
| AspectRatio           | ✅      |               |                                   |
| BackdropFilter        | ✅      |               |                                   |
| Baseline              | ✅      |               |                                   |
| Center                | ✅      |               |                                   |
| ClipOval              | ✅      |               | No CustomClipper support          |
| ClipPath              | ⏳      |               | No CustomClipper support          |
| ClipRect              | ✅      |               | No CustomClipper support          |
| ClipRRect             | ✅      |               | No CustomClipper support          |
| ClipRSuperellipse     | ✅      |               | No CustomClipper support          |
| ColoredBox            | ✅      |               |                                   |
| Column                | ✅      |               |                                   |
| ConstrainedBox        | ✅      |               |                                   |
| Container             | ✅      |               |                                   |
| CustomPaint           | ✅      | ✅            |                                   |
| DecoratedBox          | ✅      |               |                                   |
| DefaultTextStyle      | ✅      |               |                                   |
| Directionality        | ✅      |               |                                   |
| ExcludeSemantics      | ✅      |               |                                   |
| Expanded              | ✅      |               |                                   |
| FittedBox             | ✅      |               |                                   |
| Flex                  | ✅      |               |                                   |
| Flexible              | ✅      |               |                                   |
| Flow                  | ⏳      | ✅            |                                   |
| Focus                 | ✅      |               | No event callbacks                |
| FocusScope            | ✅      |               | No event callbacks                |
| FractionallySizedBox  | ✅      |               |                                   |
| GestureDetector       | ✅      | ✅            |                                   |
| GridView              | ✅      |               | GridView.count variant            |
| Icon                  | ⏳      |               |                                   |
| IgnorePointer         | ✅      |               |                                   |
| Image                 | ✅      |               |                                   |
| ImageFiltered         | ✅      |               |                                   |
| IndexedStack          | ✅      |               |                                   |
| InteractiveViewer     | ✅      |               |                                   |
| IntrinsicHeight       | ✅      |               |                                   |
| IntrinsicWidth        | ✅      |               |                                   |
| LimitedBox            | ✅      |               |                                   |
| Listener              | ✅      |               |                                   |
| ListView              | ✅      |               |                                   |
| MergeSemantics        | ✅      |               |                                   |
| MouseRegion           | ✅      |               |                                   |
| Offstage              | ✅      |               |                                   |
| Opacity               | ✅      |               |                                   |
| OverflowBox           | ✅      |               |                                   |
| Padding               | ✅      |               |                                   |
| PageView              | ✅      |               |                                   |
| PhysicalModel         | ✅      |               |                                   |
| Positioned            | ✅      |               |                                   |
| RepaintBoundary       | ✅      |               |                                   |
| RichText              | ✅      |               |                                   |
| RotatedBox            | ✅      |               |                                   |
| Row                   | ✅      |               |                                   |
| SafeArea              | ✅      |               |                                   |
| Semantics             | ✅      |               |                                   |
| SingleChildScrollView | ✅      |               |                                   |
| SizedBox              | ✅      |               |                                   |
| SizedOverflowBox      | ✅      |               |                                   |
| Stack                 | ✅      |               |                                   |
| Text                  | ✅      |               |                                   |
| Transform             | ✅      |               |                                   |
| UnconstrainedBox      | ✅      |               |                                   |
| Visibility            | ✅      |               |                                   |
| Wrap                  | ✅      |               |                                   |

✅ Implemented &nbsp;&nbsp; ⏳ Pending

## Architecture

All widgets extend `NapaWidget`, which mixes in `Inspectable` from the [`inspectable_property`](https://pub.dev/packages/inspectable_property) package:

```
NapaWidget (abstract, Inspectable mixin)
├── NapaStatelessWidget
├── NapaStatefulWidget
├── NapaRenderObjectWidget
│   ├── NapaSingleChildRenderObjectWidget
│   └── NapaMultiChildRenderObjectWidget
└── NapaProxyWidget
    └── NapaParentDataWidget
```

Each widget implements three core capabilities:
- `toWidget()` — renders to a real Flutter `Widget`
- `toJson()` — serializes to `Map<String, dynamic>` (includes `_name` field)
- `static decode(data)` — deserializes from JSON

