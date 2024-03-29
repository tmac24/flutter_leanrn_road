import 'package:flutter/material.dart';

class ScrollableTableExample extends StatefulWidget {
  const ScrollableTableExample({Key? key}) : super(key: key);

  @override
  _ScrollableTableExampleState createState() => _ScrollableTableExampleState();
}

class _ScrollableTableExampleState extends State<ScrollableTableExample> {
  final List<String> _titleList = [
    "标题1",
    "标题2",
    "标题3",
    "标题4",
    "标题5",
    "标题6",
    "标题7"
  ];
  final double _leftWidth = 100;
  final double _cellWidth = 100;
  final double _cellHeight = 45;
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
          print("点击了${_titleList[i]}");
        },
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          alignment: Alignment.center,
          width: _cellWidth,
          height: _cellHeight,
          child: Text(
            _titleList[i],
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
      list.add(
        Container(
          alignment: const Alignment(0, 0),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                  right: BorderSide(color: Colors.black, width: 1))),
          width: _cellWidth,
          height: _cellHeight,
          child: GestureDetector(
            child: Text(
              "行$index 列${i + 1}",
              style: TextStyle(color: Colors.black),
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
        title: const Text('VHScrollableTable'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(color: Colors.black, width: 1))),
                  width: _leftWidth,
                  height: _cellHeight,
                  alignment: Alignment.center,
                  child: Text('标题', style: TextStyle(color: Colors.green)),
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
                            return GestureDetector(
                                onTap: () {
                                  clickItem(index);
                                },
                                child: Container(
                                  alignment: const Alignment(0, 0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black, width: 1),
                                          right: BorderSide(
                                              color: Colors.black, width: 1))),
                                  width: _cellWidth,
                                  height: _cellHeight,
                                  child: Container(
                                    child: Text('左侧$index'),
                                  ),
                                ));
                          },
                          itemCount: 200,
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        controller: _contentController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: _titleList.length * _cellWidth,
                          child: ListView.builder(
                            itemCount: 200,
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
}

void clickItem(num) {
  print("点击了第${num}行");
}
