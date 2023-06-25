import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DelectWidgetPage extends StatefulWidget {
  const DelectWidgetPage({super.key});

  @override
  State<DelectWidgetPage> createState() => _DelectWidgetPageState();
}

class _DelectWidgetPageState extends State<DelectWidgetPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return const Text('data1');
    } else {
      return FButton(
        height: 40,
        alignment: Alignment.center,
        text: "FButton #1",
        style: TextStyle(color: Colors.white),
        color: Color(0xffffab91),
        highlightColor: Colors.blue,
        onPressed: () {
          print('FButton');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'update text',
        child: const Icon(Icons.update),
      ),
      appBar: AppBar(
        title: const Text('删除小部件'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: _getToggleChild(),
    );
  }
}
