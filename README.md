Napa widgets are an inspectable and serializable version of common Flutter widgets.

## Features

* Inspect in real time internal properties.
* JSON compatible serialization/deserialization. 

## Library status

| Widget name       | Status  | Comment                          |
|-------------------|---------|----------------------------------|
| Align             | Ok      |                                  |
| AspectRatio       | Ok      |                                  |
| BackdropFilter    | Ok      |                                  |
| Baseline          | Ok      |                                  |
| Center            | Ok      |                                  |
| ClipOval          | Ok      | No CustomClipper implementation. |
| ClipPath          | Pending | No CustomClipper implementation. |
| ClipRect          | Ok      | No CustomClipper implementation. |
| ClipRRect         | Ok      | No CustomClipper implementation. |
| ClipRSuperellipse | Ok      | No CustomClipper implementation. |
| Column            | Ok      |                                  |
| Container         | Ok      |                                  |
| CustomPaint       | Pending | Need's scripting.                |
| DecoratedBox      | Ok      |                                  |
| Expanded          | Ok      |                                  |
| FittedBox         | Ok      |                                  |
| Flex              | Ok      |                                  |
| Flexible          | Ok      |                                  |
| Flow              | Pending | Need's scripting.                |
| Icon              | Pending |                                  |
| Image             | Ok      |                                  |
| ImageFiltered     | Ok      |                                  |
| ListView          | Ok      |                                  |
| Opacity           | Ok      |                                  |
| Padding           | Ok      |                                  |
| Positioned        | Ok      |                                  |
| RepaintBoundary   | Ok      |                                  |
| RotatedBox        | Ok      |                                  |
| Row               | Ok      |                                  |
| ScrollView        | Pending |                                  |
| SizedBox          | Ok      |                                  |
| Stack             | Ok      |                                  |
| Text              | Ok      |                                  |
| Transform         | Ok      |                                  |
| Wrap              | Ok      |                                  |



## Usage

Compose Napa widgets and transform to regular widgets...

```dart
const napaWidget = NapaPadding(
  padding: EdgeInsetsGeometry.all(8.0),
  child: NapaText('Hello world!!!'),
);

Widget flutterWidget = napaWidget.toWidget();
```

