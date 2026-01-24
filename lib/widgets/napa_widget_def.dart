import 'napa_widget.dart';

class NapaWidgetDef {
  String name;
  NapaWidget? icon;
  NapaWidget? widget;
  Map<String, String> input;

  NapaWidgetDef({
    required this.name,
    this.icon,
    this.widget,
    Map<String, String>? input,
  }) : input = input ?? <String, String>{};

  dynamic toJson() => <String, dynamic>{
    'name': name,
    if (icon != null) 'icon': icon!.toJson(),
    if (widget != null) 'widget': widget!.toJson(),
    'input': input,
  };

  static NapaWidgetDef? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaWidgetDef(
      name: data['name'],
      icon: NapaWidget.decode(data['icon']),
      widget: NapaWidget.decode(data['widget']),
      input: data['input'],
    );
  }
}
