/*
 * @Author: T-Mac
 * @Date: 2023-08-18 10:07:16
 * @Description: 行情报表页面
 */

import 'package:discover_road/pages/Stock/Model/AStockModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class HQListPage extends StatefulWidget {
  const HQListPage({super.key, required this.title});

  final String title;

  @override
  _ScrollableTableExampleState createState() => _ScrollableTableExampleState();
}

class _ScrollableTableExampleState extends State<HQListPage> {
  final List _titleList = [
    {"title": "最新", "type1": 32, "type2": 0},
    {"title": "涨幅", "type1": 32, "type2": 0},
    {"title": "涨跌", "type1": 32, "type2": 0},
    {"title": "换手", "type1": 32, "type2": 0},
    {"title": "现量", "type1": 32, "type2": 0},
    {"title": "开盘", "type1": 32, "type2": 0},
    {"title": "最高", "type1": 32, "type2": 0},
    {"title": "最低", "type1": 32, "type2": 0},
    {"title": "金额", "type1": 32, "type2": 0},
    {"title": "涨速", "type1": 32, "type2": 0},
    {"title": "振幅", "type1": 32, "type2": 0},
    {"title": "昨收", "type1": 32, "type2": 0}
  ];

  List stockList = stockFromJson(convert.jsonEncode(hqListData));

  final double _leftWidth = 100;
  final double _cellWidth = 100;
  final double _cellHeight = 50;
  final double _titleHeight = 35;
  final ScrollController _titleController = ScrollController();
  final ScrollController _contentController = ScrollController();

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_updateContent);
    _contentController.addListener(_updateTitle);
  }

  void _updateTitle() {
    if (_titleController.offset != _contentController.offset) {
      _titleController.jumpTo(_contentController.offset);
    }
  }

  void _updateContent() {
    if (_contentController.offset != _titleController.offset) {
      _contentController.jumpTo(_titleController.offset);
    }
  }

  @override
  void dispose() {
    _titleController.removeListener(_updateContent);
    _contentController.removeListener(_updateTitle);
    super.dispose();
  }

  Container _buildTitleContainer(int i) {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("点击了${_titleList[i]["title"]}");
        },
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 139, 139, 139), width: 0.5),
            ),
          ),
          alignment: Alignment.center,
          width: _cellWidth,
          height: _titleHeight,
          child: Text(
            _titleList[i]["title"],
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  _buildRightTitle() {
    List<Widget> list = [];
    for (int i = 0; i < _titleList.length; i++) {
      list.add(_buildTitleContainer(i));
    }
    return list;
  }

  _buildRightContent(int index) {
    List<Widget> list = [];
    for (int i = 0; i < _titleList.length; i++) {
      Stock stock = stockList[index];
      list.add(
        Container(
          alignment: const Alignment(0, 0),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 173, 173, 173), width: 0.5),
          )),
          width: _cellWidth,
          height: _cellHeight,
          child: GestureDetector(
            child: Text(
              '${stock.price}',
              // "行$index 列${i + 1}",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            onTap: () {
              clickItem(index);
            },
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 139, 139, 139), width: 0.5),
                  )),
                  width: _leftWidth,
                  height: _titleHeight,
                  alignment: Alignment.center,
                  child: Text('名称', style: TextStyle(color: Colors.green)),
                ),
                Expanded(
                    child: Container(
                  width: _titleList.length * _cellWidth,
                  child: SingleChildScrollView(
                    controller: _titleController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _buildRightTitle(),
                    ),
                  ),
                ))
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: _leftWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Stock stock = stockList[index];
                            return GestureDetector(
                                onTap: () {
                                  clickItem(index);
                                },
                                child: Container(
                                  alignment: const Alignment(0, 0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 173, 173, 173),
                                        width: 0.5),
                                  )),
                                  width: _cellWidth,
                                  height: _cellHeight,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          stock.name,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          stock.code,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 98, 98, 98)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                          itemCount: hqListData.length,
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        controller: _contentController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: _titleList.length * _cellWidth,
                          child: ListView.builder(
                            itemCount: hqListData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: _buildRightContent(index),
                                ),
                              );
                            },
                          ),
                          // ),
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  void clickItem(num) {
    print("点击了第${num}行");
  }
}

List hqListData = [
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "白云机场", "code": "60001", "price": 464.38, "rise": "131.96%"},
  {"name": "华人健康", "code": "60002", "price": 446.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60003", "price": 768.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60004", "price": 134.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60005", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60006", "price": 75.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60007", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
  {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
];
