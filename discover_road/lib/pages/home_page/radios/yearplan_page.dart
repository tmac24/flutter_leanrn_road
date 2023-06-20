import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/define.dart';

class YearPlan extends StatefulWidget {
  @override
  _YearPlanState createState() => _YearPlanState();
}

class _YearPlanState extends State<YearPlan> {
  //定义可控制滚动组件
  ScrollController firstColumnController = ScrollController();
  ScrollController thirdColumnController = ScrollController();

  ScrollController firstRowController = ScrollController();
  ScrollController secondedRowController = ScrollController();

  //创建第一列行
  double numRowWidth = 100.0; //单个表宽
  double numRowHeight = 48.0; //表格高

  List<TableRow> _buildTableColumnOne() {
    List<TableRow> returnList = [];
    returnList.add(_buildSingleColumnOne(-1));
    for (int i = 0; i < 5; i++) {
      returnList.add(_buildSingleColumnOne(i));
    }
    return returnList;
  }

//创建tableRows
  List<TableRow> _buildTableRow() {
    List<TableRow> returnList = [];
    for (int j = 0; j < 6; j++) {
      returnList.add(_buildSingleRow(-1)); //添加行
    }
    return returnList;
  }

  //创建单行
  List<TableRow> _buildTableOneRow() {
    List<TableRow> returnList = [];
    for (int j = 0; j < 1; j++) {
      returnList.add(_buildSingleRow(-1)); //添加行
    }
    return returnList;
  }

  //创建第一列tableRow
  TableRow _buildSingleColumnOne(int index) {
    return TableRow(children: [
      _buildSideBox(index == -1 ? '第一列' : "软件质量管理", index == -1),
      // _buildSideBox(index == -1 ? '第二列' : "软件质量管理", index == -1),
    ]);
  }

  //创建一行tableRow
  TableRow _buildSingleRow(int index) {
    return TableRow(children: [
      _buildSideBox(index == -1 ? '工作内容' : "学习", index == -1),
      _buildSideBox(index == -1 ? '年度目标' : "成为顶尖开发", index == -1),
      _buildSideBox(index == -1 ? '关联部门' : "1信息技术事业部", index == -1),
      _buildSideBox(index == -1 ? '备注' : "不可能", index == -1),
      _buildSideBox(index == -1 ? '1' : "随意添加", index == -1),
    ]);
  }

  //创建单个表格
  Widget _buildSideBox(String title, isTitle) {
    return SizedBox(
        height: numRowHeight,
        width: numRowWidth,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 0.33, color: Colors.black),
              top: BorderSide(width: 0.33, color: Colors.black),
              right: BorderSide(width: 0.33, color: Colors.black),
              left: BorderSide(width: 0.33, color: Colors.black),
            )),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: isTitle ? 14 : 12, color: Colors.black),
            )));
  }

  @override
  void initState() {
    super.initState();
    //监听第一列变动
    firstColumnController.addListener(() {
      if (firstColumnController.offset != thirdColumnController.offset) {
        thirdColumnController.jumpTo(firstColumnController.offset);
      }
    });

    //监听第三列变动
    thirdColumnController.addListener(() {
      if (firstColumnController.offset != thirdColumnController.offset) {
        firstColumnController.jumpTo(thirdColumnController.offset);
      }
    });

    //监听第一行变动
    firstRowController.addListener(() {
      if (firstRowController.offset != secondedRowController.offset) {
        secondedRowController.jumpTo(firstRowController.offset);
      }
    });

    //监听第二行变动
    secondedRowController.addListener(() {
      if (firstRowController.offset != secondedRowController.offset) {
        firstRowController.jumpTo(secondedRowController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表格2'),
      ), //SingleChildScrollView(
      body: NotificationListener(
        //表格
        child: Container(
          padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 0),
          margin: EdgeInsets.all(10),
          height: 209,
          width: kWidth,
          color: Colors.lightGreen,
          child: Row(
            children: [
              //前两列
              Container(
                width: 100,
                height: 200,
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 0.33, color: Colors.black),
                                  right: BorderSide(
                                      width: 0.33, color: Colors.black),
                                  left: BorderSide(
                                      width: 0.33, color: Colors.black),
                                ),
                              ),
                              child: SizedBox(
                                height: 47,
                                child: Center(
                                  child:
                                      Text('职责', textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                            Container(
                              // width:100,
                              decoration: BoxDecoration(
                                border: Border(
                                  // bottom: BorderSide(width: 0.33, color:Colors.black),
                                  top: BorderSide(
                                      width: 0.33, color: Colors.black),
                                  right: BorderSide(
                                      width: 0.33, color: Colors.black),
                                  left: BorderSide(
                                      width: 0.33, color: Colors.black),
                                ),
                              ),
                              // child: SizedBox(
                              //   height: 47,
                              //   child: Center(
                              //     child:
                              //         Text('重点工作', textAlign: TextAlign.center),
                              //   ),
                              // ),
                            )
                          ],
                        ),
                      ],
                    ),
                    //SingleChildScrollView(
                    Expanded(
                      child: ListView(
                        controller: firstColumnController,
                        children: [
                          Table(children: _buildTableColumnOne()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //其余列
              Expanded(
                child: Container(
                  width: 500,
                  child: Column(children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal, //horizontal
                        controller: firstRowController,
                        child: Container(
                          child: Table(children: _buildTableOneRow()),
                          width: numRowWidth * 6, //设置列的行宽
                        )),
                    Expanded(
                      child: ListView(
                        controller: thirdColumnController,
                        children: [
                          SingleChildScrollView(
                            controller: secondedRowController,
                            scrollDirection: Axis.horizontal, //horizontal
                            child: Row(
                              children: [
                                Container(
                                  child: Table(children: _buildTableRow()),
                                  width: numRowWidth * 6, //设置列的行宽
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
