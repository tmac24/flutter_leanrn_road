/*
 * @Author: T-Mac
 * @Date: 2023-08-17 15:40:52
 * @Description: 加载原生视图
 */
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class iosTestPage extends StatelessWidget {
  const iosTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

class MixPage extends StatefulWidget {
  const MixPage({super.key});

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
// 第一步添加 MethodChannel
  static const plantform = MethodChannel("test.flutter.io/testAction1");
// 获取iOS代码的返回值
  String iosResultString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("混合开发测试"),
      ),
      body: Center(
        child: Column(
          children: [
            buildButton(),
            Text(
              "获取iOS结果为：${iosResultString}",
              style: TextStyle(fontSize: 26),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return MaterialButton(
      onPressed: () {
        setState(() {
          testAction1();
        });
      },
      child: Text(
        "获取调用iOS代码结果",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
    );
  }

// 调用iOS代码
  Future testAction1() async {
    String result =
        await plantform.invokeMethod("testAction1", ['a', 'b', 'c']);
    print("获取iOS结果：====${result}");
    setState(() {
      iosResultString = result;
    });
  }
}
