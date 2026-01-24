import 'napa_widget.dart';
import 'napa_widget_def.dart';

class NapaWidgetCollection {
  String name;
  String? path;
  NapaWidget? icon;
  List<NapaWidgetDef> widgets;

  NapaWidgetCollection({
    required this.name,
    this.path,
    this.icon,
    List<NapaWidgetDef>? widgets,
  }) : widgets = widgets ?? [];

  dynamic toJson() {
    return <String, dynamic>{
      'name': name,
      if (icon != null) 'icon': icon!.toJson(),
      'widgets': widgets.map((e) => e.toJson()).toList(),
    };
  }

  static NapaWidgetCollection? decode(dynamic data, String? path) {
    if (data == null) {
      return null;
    }

    return NapaWidgetCollection(
      name: data['name'],
      icon: NapaWidget.decode(data['icon']),
      path: path,
      widgets: (data['widgets'] as List)
          .map((e) => NapaWidgetDef.decode(e)!)
          .toList(),
    );
  }
}
