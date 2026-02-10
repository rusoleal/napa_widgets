# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**napa_widgets** is a Flutter/Dart package that provides inspectable and serializable wrappers around standard Flutter widgets. It enables runtime property inspection, JSON serialization/deserialization of widget trees, and Lua-scripted custom painting.

## Common Commands

```bash
# Get dependencies
flutter pub get

# Run tests
flutter test

# Run a single test file
flutter test test/napa_widgets_test.dart

# Analyze code (lint)
flutter analyze

# Run the example app
cd example && flutter run

# Dry-run publish check
flutter pub publish --dry-run
```

## Architecture

### Widget Hierarchy

All widgets extend `NapaWidget` (in `lib/widgets/napa_widget.dart`), which mixes in `Inspectable` from the `inspectable_property` package. The hierarchy mirrors Flutter's own:

```
NapaWidget (abstract, with Inspectable)
├── NapaStatelessWidget        → Container, Text, Padding, Image, etc.
├── NapaStatefulWidget
├── NapaRenderObjectWidget
│   ├── NapaSingleChildRenderObjectWidget  → Align, Opacity, CustomPaint, Clip*, etc.
│   └── NapaMultiChildRenderObjectWidget   → Flex (→ Column, Row), Stack, Wrap, Flow, ListView
└── NapaProxyWidget
    └── NapaParentDataWidget   → Expanded, Flexible, Positioned
```

### Three Core Capabilities per Widget

Every NapaWidget implements three key methods:
1. **`toWidget()`** — converts to an actual Flutter Widget (recursive for children)
2. **`toJson()`** — serializes to a `Map<String, dynamic>` with a `_name` field identifying the widget type
3. **`decode(data)`** — static factory that deserializes from JSON (each widget registers its decoder)

### Widget Registration System

`NapaWidget._register` is a static map of widget name → decode function. All built-in widgets are pre-registered. Custom widgets must call `NapaWidget.registerNapaWidget('Name', MyWidget.decode)` to be deserializable.

### Standard Pattern for Adding a New Widget

1. Extend the appropriate base class (e.g., `NapaSingleChildRenderObjectWidget`)
2. Store properties as mutable instance fields
3. In constructor, call `properties.addAll([...])` with `InspectableProperty` entries for each field
4. Implement `widgetName` getter (returns the Flutter widget name, e.g., `'Padding'`)
5. Override `toJson()` — call `super.toJson()` then `..addAll({...})` with custom fields
6. Override `toWidget()` — construct the real Flutter widget, calling `child?.toWidget()` for children
7. Add a static `decode(data)` factory method
8. Register the widget in `NapaWidget._register` (in `napa_widget.dart`)
9. Export from `lib/napa_widgets.dart`

### Serialization Helpers

`lib/widgets/tojson_extensions.dart` contains extension methods (`.toJson()`) on Flutter types (EdgeInsetsGeometry, Color, FontFeature, etc.) and global `decode*()` helper functions for deserialization. Colors serialize as `#RRGGBBAA` hex strings.

### Data Classes (`lib/widgets/data/`)

Serializable wrappers for complex Flutter types: NapaPaint, NapaTextStyle, NapaMatrix4, NapaShader, NapaColorFilter, NapaImageFilter, NapaMaskFilter, NapaTextScaler, NapaTextDecoration, ImageWrapper. Each provides `toJson()`, `decode()`, and a getter to convert to the native Flutter type.

### Lua Scripting (`lib/scripting/`)

NapaCustomPaint and NapaFlow support Lua scripts via `lua_dardo_plus`. The `LuaUILib` (`lib/scripting/lua/lua_ui_lib.dart`) registers ~80+ drawing functions under the `ui.` namespace (e.g., `ui.newColor()`, `ui.newPath()`, `ui.newPaint()`). Scripts implement a `paint(canvas, size)` function that gets called by the internal CustomPainter.

### Inspection

Properties are exposed via `InspectableProperty<T>` from the `inspectable_property` package. Each property has a name, getter, optional setter, nullable flag, and optional enum values list. The base `NapaWidget` always adds a read-only `type` property.

## Key Dependencies

- `inspectable_property` — reflection/inspection mixin and property system
- `lua_dardo_plus` — Lua interpreter for scripted painting
- `vector_math` — Matrix4 support for transforms
