import 'package:discover_road/common/define.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:group_list_view/group_list_view.dart';

import 'Common/qlhq_common_widget.dart';
import 'Model/AStockModel.dart';
import 'dart:convert' as convert;

class AStockController extends GetxController {
  List aStockList = aStockSortFromJson(convert.jsonEncode(AStockDatas));
  void showOrClose(int index) {
    AStockSort aStockSort = aStockList[index];
    aStockSort.isShow = !aStockSort.isShow;
    update();
  }
}

class HQAStockPage extends StatelessWidget {
  const HQAStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: _getHeadList(),
        ),
        Expanded(
          flex: 2,
          child: _getRiseOrFallView(),
        ),
        Expanded(flex: 2, child: _getNewStockCalendarView()),
        Expanded(
          flex: 25,
          child: _getBodyList(),
        ),
      ],
    );
  }

  //新股日历
  Widget _getNewStockCalendarView() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Color.fromARGB(255, 167, 166, 166),
          ),
          bottom: BorderSide(
            width: 0.5,
            color: Color.fromARGB(255, 167, 166, 166),
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '新股日历',
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          Text(
            '今日：1上市',
            style: TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 148, 148, 148)),
          ),
        ],
      ),
    );
  }

  //涨跌统计
  Widget _getRiseOrFallView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '涨789家  ',
          style: TextStyle(fontSize: 14, color: Colors.red),
        ),
        SizedBox(
          width: kWidth - K_FitWidth(170),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.red,
                  height: 4,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.green,
                  height: 4,
                ),
              ),
            ],
          ),
        ),
        const Text(
          '  跌4250家',
          style: TextStyle(fontSize: 14, color: Colors.green),
        ),
      ],
    );
  }

  Widget _getHeadList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                  width: 0.5, color: Color.fromARGB(255, 230, 230, 230)),
            ),
            color: Colors.white,
          ),
          width: kWidth / 3,
          height: 100,
          child: InkWell(
            onTap: () {
              // Navigator.of(context).pop(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 130, 129, 129),
                    width: 0.2),
              ),
              alignment: Alignment.center,
              child: HQIndexItemStock("上证指数", "3209.54", "-45.02", "-1.38%"),
            ),
          ),
        );
      },
    );
  }

  Widget _getBodyList() {
    final AStockController controller = Get.put(AStockController());
    return GetBuilder<AStockController>(
      builder: (_) => GroupListView(
        sectionsCount: controller.aStockList.length,
        countOfItemInSection: (int section) {
          AStockSort aStockSort = controller.aStockList[section];
          return aStockSort.isShow ? 0 : aStockSort.stock.length;
        },
        itemBuilder: (BuildContext context, IndexPath index) {
          AStockSort aStockSort = controller.aStockList[index.section];
          Stock stock = aStockSort.stock[index.index];
          return _getStockRow(stock);
        },
        groupHeaderBuilder: (BuildContext context, int section) {
          AStockSort aStockSort = controller.aStockList[section];
          return Container(
            color: const Color.fromARGB(255, 236, 236, 236),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GestureDetector(
              onTap: () {
                controller.showOrClose(section);
              },
              child: Text(
                aStockSort.header,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
      ),
    );
  }

  Widget _getStockRow(Stock stock) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom:
              BorderSide(width: 0.5, color: Color.fromARGB(110, 88, 87, 87)),
        ),
        // color: Color.fromARGB(255, 243, 243, 243),
      ),
      margin: const EdgeInsets.fromLTRB(11, 0, 11, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                stock.name,
                style: const TextStyle(color: Colors.black, fontSize: 19),
              ),
              Text(
                stock.code,
                style: const TextStyle(
                    color: Color.fromARGB(255, 119, 119, 119), fontSize: 17),
              ),
            ],
          ),
          Text(
            '${stock.price}',
            style: const TextStyle(color: Colors.black, fontSize: 19),
          ),
          Text(
            stock.rise,
            style: const TextStyle(color: Colors.black, fontSize: 19),
          ),
        ],
      ),
    );
  }
}

final List AStockDatas = [
  {
    "header": "涨幅榜",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  },
  {
    "header": "跌幅榜",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  },
  {
    "header": "5分钟涨幅榜",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  },
  {
    "header": "主力流入",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  },
  {
    "header": "换手率",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  },
  {
    "header": "量比",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  },
  {
    "header": "成交额",
    "isShow": true,
    "stock": [
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "白云机场", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "华人健康", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"},
      {"name": "广康文化", "code": "60000", "price": 104.38, "rise": "131.96%"}
    ]
  }
];