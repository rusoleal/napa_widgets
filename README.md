Napa widgets are an inspectable and serializable version of common Flutter widgets.

## Features

* Inspect in real time internal properties.
* JSON compatible serialization/deserialization. 

## Library status

| Widget name    | Status  |
|----------------|---------|
| Align          | Ok      |
| AspectRatio    | Ok      |
| BackdropFilter | Ok      |
| Baseline       | Ok      |
| BoxScrollView  | Pending |
| Center         | Ok      |
| ClipOval       | Pending |
| ClipPath       | Pending |
| ClipRect       | Ok      |
| ClipRRect      | Pending |
| Column         | Ok      |
| Container      | Ok      |
| CustomPaint    | Pending |
| DecoratedBox   | Ok      |
| Expanded       | Ok      |
| FittedBox      | Ok      |
| Flex           | Ok      |
| Fiexible       | Ok      |
| Icon           | Pending |
| Image          | Ok      |
| ImageFiltered  | Ok      |
| ListView       | Pending |
| Opacity        | Ok      |
| Padding        | Ok      |
| Positioned     | Ok      |
| RotatedBox     | Ok      |
| Row            | Ok      |
| ScrollView     | Pending |
| SizedBox       | Ok      |
| Stack          | Ok      |
| Text           | Ok      |
| Transform      | Ok      |
| Wrap           | Ok      |



## Usage

Compose Napa widgets and transform to regular widgets...

```dart
const napaWidget = NapaPadding(
  padding: EdgeInsetsGeometry.all(8.0),
  child: NapaText('Hello world!!!'),
);

Widget flutterWidget = napaWidget.toWidget();
```

