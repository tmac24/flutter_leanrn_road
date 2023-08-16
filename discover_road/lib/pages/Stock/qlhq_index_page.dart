/*
 * @Author: T-Mac
 * @Date: 2023-08-14 11:16:27
 * @Description: 行情指数页面
 */

import 'package:discover_road/common/define.dart';
import 'package:discover_road/pages/Stock/Common/qlhq_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class QLHqIndexPage extends StatelessWidget {
  const QLHqIndexPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 18,
        child: Container(
          color: Colors.white,
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            padding: const EdgeInsets.only(left: 8, right: 8),
            itemCount: hqSortData.length,
            itemBuilder: (context, index) {
              return _getGridViewItemUI(context, hqSortData, index);
            },
            staggeredTileBuilder: (int index) {
              String title = hqSortData[index]['title'];
              if (isheader(title)) {
                return const StaggeredTile.count(3, 0.35);
              } else {
                return const StaggeredTile.count(1, 0.8);
              }
            },
          ),
        ),
      ),
      Expanded(
        child: Container(
          width: kWidth,
          color: const Color.fromARGB(255, 224, 224, 224),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('港股最少延迟15分钟 ',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text('免责声明',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red)),
            ],
          ),
        ),
      )
    ]);
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
          // padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 130, 129, 129), width: 0.2),
          ),
          alignment: Alignment.center,
          child: HQIndexItemStock(title, "3208.45", "52.23", "-1.59"),
        ),
      );
    }
  }

  bool isheader(String title) {
    List headerList = ['国内指数', '香港指数', '国际指数'];
    if (headerList.contains(title)) {
      return true;
    } else {
      return false;
    }
  }
}

List hqSortData = [
  {'title': '国内指数'},
  {'title': '上证指数', 'market': 20, 'type': 10},
  {'title': '深证成指', 'market': 3, 'type': 1},
  {'title': '创业板指', 'market': 10, 'type': 1},
  {'title': '上证50', 'market': 201, 'type': 0},
  {'title': '沪深300', 'market': 201, 'type': 0},
  {'title': '北证50', 'market': 105, 'type': 2},
  {'title': '香港指数'},
  {'title': '恒生指数', 'market': 2, 'type': 2},
  {'title': '国企指数', 'market': 20, 'type': 79},
  {'title': '创业指数', 'market': 1, 'type': 22},
  {'title': '红筹指数', 'market': 1, 'type': 22},
  {'title': '中华120', 'market': 1, 'type': 22},
  {'title': '中华A80', 'market': 1, 'type': 22},
  {'title': '国际指数'},
  {'title': '道琼斯工业指数', 'market': 1, 'type': 22},
  {'title': '标普500指数', 'market': 1, 'type': 22},
  {'title': '霍特中概股指数', 'market': 1, 'type': 22},
  {'title': '日经225指数', 'market': 1, 'type': 22},
  {'title': '伦敦金融时报指数', 'market': 1, 'type': 22},
  {'title': '美元指数', 'market': 1, 'type': 22}
];
