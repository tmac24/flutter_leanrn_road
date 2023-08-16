/*
 * @Author: T-Mac
 * @Date: 2023-08-11 14:23:08
 * @Description: 
 */

import 'package:discover_road/pages/Stock/qlhq_Astock_page.dart';
import 'package:discover_road/pages/Stock/qlhq_index_page.dart';
import 'package:discover_road/pages/Stock/qlhq_sort_page.dart';
import 'package:flutter/material.dart';

class QLHqPage extends StatelessWidget {
  const QLHqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 18),
            tabs: <Widget>[
              Tab(
                text: 'A股',
              ),
              Tab(
                text: '指数',
              ),
              Tab(
                text: '分类',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: HQAStockPage(),
              // child: NewsPage(),
            ),
            Center(
              child: QLHqIndexPage(),
            ),
            Center(
              // child: Text("It's sunny here"),
              child: QLHqSortPage(),
            ),
          ],
        ),
      ),
    );
  }
}
