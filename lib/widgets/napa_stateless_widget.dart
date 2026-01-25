import 'package:flutter/widgets.dart';
import 'napa_widget.dart';

/// Wrapper class for [StatelessWidget].
/// https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
///
abstract class NapaStatelessWidget extends NapaWidget {

  NapaStatelessWidget({super.childMode});

  @override
  String get widgetName => 'StatelessWidget';
}
