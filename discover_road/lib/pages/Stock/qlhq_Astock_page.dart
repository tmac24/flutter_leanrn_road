import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_list_view/group_list_view.dart';

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
            color: Color.fromARGB(255, 236, 236, 236),
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
