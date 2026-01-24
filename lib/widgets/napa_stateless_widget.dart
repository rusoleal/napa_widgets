import 'napa_widget.dart';

abstract class NapaStatelessWidget extends NapaWidget {

  NapaStatelessWidget({super.childMode});

  @override
  String get widgetName => 'StatelessWidget';
}
