/*
 * @Author: T-Mac ctrl+cmd+i
 * @Date: 2023-08-11 14:58:22
 * @Description: 行情分类页面 
 */

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class QLHqSortPage extends StatelessWidget {
  const QLHqSortPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 11.0,
        crossAxisSpacing: 11.0,
        itemCount: hqSortData.length,
        itemBuilder: (context, index) {
          return _getGridViewItemUI(context, hqSortData, index);
        },
        staggeredTileBuilder: (int index) {
          String title = hqSortData[index]['title'];
          if (isheader(title)) {
            return const StaggeredTile.count(4, 0.55);
          } else {
            return const StaggeredTile.count(1, 0.6);
          }
        },
      ),
    );
  }

  Widget _getGridViewItemUI(BuildContext context, List data, int index) {
    String title = hqSortData[index]['title'];
    if (isheader(title)) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Color.fromARGB(110, 88, 87, 87)),
            bottom:
                BorderSide(width: 0.5, color: Color.fromARGB(110, 88, 87, 87)),
          ),
          // color: Color.fromARGB(255, 243, 243, 243),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 102, 101, 101)),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          // Navigator.of(context).pop(index);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 130, 129, 129), width: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      );
    }
  }

  bool isheader(String title) {
    List headerList = [
      '指数',
      '沪深京市场',
      '基金',
      '债券',
      '港股市场',
      '美股市场',
      '股份转让',
      '金融期货'
    ];
    if (headerList.contains(title)) {
      return true;
    } else {
      return false;
    }
  }
}

List hqSortData = [
  {'title': '指数'},
  {'title': '沪深京指', 'market': 20, 'type': 10},
  {'title': '香港指数', 'market': 3, 'type': 1},
  {'title': '国际指数', 'market': 10, 'type': 1},
  {'title': '债券指数', 'market': 201, 'type': 0},
  {'title': '沪深京市场'},
  {'title': '全部A股', 'market': 105, 'type': 2},
  {'title': '上证A股', 'market': 1, 'type': 2},
  {'title': '深证A股', 'market': 2, 'type': 2},
  {'title': '北证A股', 'market': 20, 'type': 79},
  {'title': '科创板', 'market': 1, 'type': 22},
  {'title': '创业板', 'market': 1, 'type': 22},
  {'title': '风险警示', 'market': 1, 'type': 22},
  {'title': '退市整理', 'market': 1, 'type': 22},
  {'title': '沪深B股', 'market': 1, 'type': 22},
  {'title': '上证B股', 'market': 1, 'type': 22},
  {'title': '沪B转H', 'market': 1, 'type': 22},
  {'title': '深证B股', 'market': 1, 'type': 22},
  {'title': '深B转H', 'market': 1, 'type': 22},
  {'title': '上证其他', 'market': 1, 'type': 22},
  {'title': '深证其他', 'market': 1, 'type': 22},
  {'title': '全部板块', 'market': 1, 'type': 22},
  {'title': '行业板块', 'market': 1, 'type': 22},
  {'title': '概念板块', 'market': 1, 'type': 22},
  {'title': '地域板块', 'market': 1, 'type': 22},
  {'title': '基金'},
  {'title': '上证基金', 'market': 1, 'type': 22},
  {'title': '深圳基金', 'market': 1, 'type': 22},
  {'title': '沪REITs', 'market': 1, 'type': 22},
  {'title': '深REITs', 'market': 1, 'type': 22},
  {'title': '债券'},
  {'title': '沪深债券', 'market': 1, 'type': 22},
  {'title': '上证债券', 'market': 1, 'type': 22},
  {'title': '深证债券', 'market': 1, 'type': 22},
  {'title': '北证转债', 'market': 1, 'type': 22},
  {'title': '债券现券', 'market': 1, 'type': 22},
  {'title': '债券回购', 'market': 1, 'type': 22},
  {'title': '预发行与分销', 'market': 1, 'type': 22},
  {'title': '专业投资者', 'market': 1, 'type': 22},
  {'title': '专业机构', 'market': 1, 'type': 22},
  {'title': '其他债券', 'market': 1, 'type': 22}
];
