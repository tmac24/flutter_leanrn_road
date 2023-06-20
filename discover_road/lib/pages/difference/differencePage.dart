import 'package:flutter/material.dart';

class DifferencePage extends StatefulWidget {
  const DifferencePage({super.key});

  @override
  State<DifferencePage> createState() => _DifferencePageState();
}

class _DifferencePageState extends State<DifferencePage> {
  final difDatas = [
    'fsdfdsf',
    'rewrwer',
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
    print(difData);
  }
}
