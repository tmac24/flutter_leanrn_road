/*
 * @Author: T-Mac
 * @Date: 2023-08-18 15:56:32
 * @Description: 
 */
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../common/define.dart';

class StockTimeSharePage extends StatefulWidget {
  const StockTimeSharePage({super.key});

  @override
  State<StockTimeSharePage> createState() => _StockTimeSharePageState();
}

class _StockTimeSharePageState extends State<StockTimeSharePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Column(
              children: [
                _getStockInfo(),
                _getStockStated(),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: Color.fromARGB(255, 144, 145, 144),
                    ),
                    items: [
                      DropdownMenuItem(
                        enabled: false,
                        value: 3,
                        child: Container(
                          width: kWidth,
                          height: 200,
                          color: Colors.red,
                        ),
                      ),
                    ],
                    dropdownStyleData: DropdownStyleData(
                      width: kWidth + 10,
                      elevation: 0,
                      useRootNavigator: true,
                      // padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color.fromARGB(255, 33, 149, 243),
                      ),
                      offset: const Offset(0, 8),
                    ),
                    menuItemStyleData: MenuItemStyleData(customHeights: [200]),
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  width: kWidth,
                  height: 50,
                  color: Colors.orange,
                ),
                // Dropdownf
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> stockInfoView() {
    List<Widget> view = [];
    for (Map stock in stockInfoData) {
      view.add(_getStockInfoItem(stock));
    }
    return view;
  }

  Widget _getStockInfoItem(Map stock) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          stock.keys.first,
          style: TextStyle(
              fontSize: 16, color: const Color.fromARGB(255, 74, 74, 74)),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          stock.values.first,
          style: TextStyle(
              fontSize: 16, color: _getFontColorWithTitle(stock.keys.first)),
        ),
      ],
    );
  }

  Widget _getStockStated() {
    return Row(
      children: const [
        SizedBox(
          width: 10,
        ),
        Text(
          '交易状态',
          style: TextStyle(
              fontSize: 13, color: Color.fromARGB(255, 125, 126, 125)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '连续竞价',
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
      ],
    );
  }

  Widget _getStockInfo() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
          width: 100,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '8.99',
                style: TextStyle(fontSize: 21, color: Colors.green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "-0.07",
                    style: TextStyle(fontSize: 13, color: Colors.green),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "-0.45%",
                    style: TextStyle(fontSize: 13, color: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          // color: Colors.orange,
          width: kWidth - 100,
          height: 60,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(), // 设置禁止滚动
            childAspectRatio: 3, //宽高比
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            children: stockInfoView(),
          ),
        ),
      ],
    );
  }

  Color _getFontColorWithTitle(String title) {
    if (title == "高") {
      return Colors.red;
    } else if (title == "开" || title == "低") {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }
}

List stockInfoData = [
  {"高": "9.14"},
  {"开": "9.03"},
  {"量": "15.48万"},
  {"低": "8.96"},
  {"换": "0.14%"},
  {"额": "1.4亿"},
];
