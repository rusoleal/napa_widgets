import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:napa_widgets/widgets/napa_center.dart';
import 'package:napa_widgets/widgets/napa_container.dart';
import 'package:napa_widgets/widgets/napa_padding.dart';
import 'package:napa_widgets/widgets/napa_text.dart';
import 'package:napa_widgets/widgets/napa_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Napa widgets example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _ted;
  late ScrollController _scrollController;
  Widget? widgetToPresent;

  @override
  void initState() {
    super.initState();

    final testWidget = NapaCenter(
      child: NapaContainer(
        color: Colors.blue,
        child: NapaPadding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: NapaText('Hello world!!!'),
        ),
      ),
    );
    widgetToPresent = testWidget.toWidget();
    final serializableObject = testWidget.toJson();

    // beauty json
    final encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(serializableObject);

    _ted = TextEditingController(text: jsonString);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: .max,
          crossAxisAlignment: .stretch,
          children: [
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                trackVisibility: true,
                thumbVisibility: true,
                child: TextField(
                  scrollController: _scrollController,
                  controller: _ted,
                  autofocus: true,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  onChanged: (value) {
                    try {
                      final deserializedObject = jsonDecode(value);
                      final napaWidget = NapaWidget.decode(deserializedObject);
                      widgetToPresent = napaWidget?.toWidget();
                    } on Exception catch (ex) {
                      widgetToPresent = Center(
                        child: Text(
                          ex.toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(child: Container(child: widgetToPresent)),
          ],
        ),
      ),
    );
  }
}
