import 'package:flutter/material.dart';

class ZDYWidgetPage extends StatelessWidget {
  const ZDYWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义小组件'),
      ),
      body: const Center(
        child: CustomButton('hello'),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
