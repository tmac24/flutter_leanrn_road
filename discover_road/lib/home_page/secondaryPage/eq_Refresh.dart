import 'dart:async';

import 'package:flutter/material.dart';

class EgRefreshPage extends StatefulWidget {
  const EgRefreshPage({super.key});

  @override
  State<EgRefreshPage> createState() => _EgRefreshPageState();
}

class _EgRefreshPageState extends State<EgRefreshPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorkey =
      GlobalKey<RefreshIndicatorState>();

  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add('下拉添加新数据');
  }

  Future _getData() {
    final Completer completer = Completer();
    // 启动一下 [Timer] 在3秒后，在list里面添加一条数据，关完成这个刷新
    Timer(const Duration(seconds: 2), () {
      // 添加数据，更新界面
      setState(() {
        list.add("新加数据${list.length}");
      });

      // 完成刷新
      completer.complete(null);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 去掉导航栏下面的阴影
        elevation: 0.0,
        title: const Text('下拉刷新'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // 点击按钮开始下拉刷新
              _refreshIndicatorkey.currentState?.show();
            },
            child: Container(
                alignment: Alignment.center, child: const Text('点击下拉 ')),
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorkey,
        onRefresh: _getData, // onRefresh 参数是一个 Future<Null> 的回调
        child: ListView.builder(
          // 这句是在list里面的内容不足一屏时，list可能会滑不动，加上就一直都可以滑动
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (_, int index) => _createItem(list[index]),
        ),
      ),
    );
  }

  _createItem(String title) {
    return Column(
      children: <Widget>[
        Container(
          height: 24.0,
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Text(title),
        ),
        const Divider(
          height: 0.5,
        )
      ],
    );
  }
}
