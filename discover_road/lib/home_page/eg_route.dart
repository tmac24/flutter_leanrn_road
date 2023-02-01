import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key, required this.title});

  final String title;

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('路由demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(4.0),
            height: 64.0,
            color: Color.fromARGB(255, 12, 12, 12),
            child: CupertinoButton(
                onPressed: onPressed, child: const Text('点击 pop 页面并返回数据给上个页面')),
          ),
          // ignore: prefer_if_null_operators
          Text('上个页面传递过来的数据为：${widget.title != null ? widget.title : ''}'),
        ],
      ),
    );
  }

  void onPressed() {}
}
