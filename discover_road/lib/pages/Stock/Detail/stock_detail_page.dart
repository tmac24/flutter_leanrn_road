/*
 * @Author: T-Mac
 * @Date: 2023-08-18 15:35:01
 * @Description: 个股详情页面
 */

import 'package:discover_road/pages/Stock/Detail/stock_timeshare_page.dart';
import 'package:flutter/material.dart';

class QLStockDetailPage extends StatelessWidget {
  const QLStockDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _appBarCustom(),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: StockTimeSharePage(),
            ),
            Center(
              child: Text('指标'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBarCustom() {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: const Icon(Icons.arrow_left),
              iconSize: 40,
              onPressed: () {}),
          Column(
            children: const [
              Text(
                '白云机场',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '600002',
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ],
          ),
          IconButton(
              icon: const Icon(Icons.arrow_right),
              iconSize: 40,
              onPressed: () {}),
        ],
      ),
    );
  }
}
