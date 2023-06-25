import 'package:discover_road/pages/difference/zdyWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'delectWidget.dart';

class DifferencePage extends StatefulWidget {
  const DifferencePage({super.key});

  @override
  State<DifferencePage> createState() => _DifferencePageState();
}

class _DifferencePageState extends State<DifferencePage> {
  final difDatas = [
    '删除小部件',
    '自定义小组件',
    'fsjwrkelw',
    'hrhw',
    '237498f',
    'hsjk34',
    '423kh423',
    'zkhewhkr'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('区别'),
      ),
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    return ListView.builder(
      itemCount: difDatas.length,
      itemBuilder: (context, index) {
        return Container(
          height: 45,
          color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
          child: Center(
            child: GestureDetector(
              onTap: () {
                _itemClick(difDatas[index]);
              },
              child: Text(
                difDatas[index],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        );
      },
    );
  }

  void _itemClick(String difData) {
    if (difData == '删除小部件') {
      Get.to(const DelectWidgetPage());
    } else if (difData == '自定义小组件') {
      Get.to(const ZDYWidgetPage());
    } else {}
    print(difData);
  }
}
