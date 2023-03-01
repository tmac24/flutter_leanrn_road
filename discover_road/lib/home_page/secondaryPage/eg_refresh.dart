import 'dart:async';

import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../http/API.dart';
import '../radios/radios_model.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});
  @override
  _RefreshPageState createState() {
    return _RefreshPageState();
  }
}

class _RefreshPageState extends State<RefreshPage> {
  late EasyRefreshController _controller;

  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EasyRefresh"),
        ),
        body: EasyRefresh.custom(
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          controller: _controller,
          header: ClassicalHeader(),
          footer: ClassicalFooter(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('onRefresh');
              setState(() {
                _count = 20;
              });
              _controller.resetLoadState();
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('onLoad');
              setState(() {
                _count += 10;
              });
              _controller.finishLoad(noMore: _count >= 40);
            });
          },
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    width: 60.0,
                    height: 60.0,
                    color:
                        index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                    child: Center(
                      child: Text('$index'),
                    ),
                  );
                },
                childCount: _count,
              ),
            ),
          ],
        ),
        persistentFooterButtons: <Widget>[
          FButton(
            onPressed: () {
              _controller.callRefresh();
            },
            color: Colors.blue,
            highlightColor: Colors.blue,
            text: 'Refresh',
          ),
          FButton(
            onPressed: () {
              _controller.callLoad();
            },
            highlightColor: Colors.white,
            text: 'Load more',
          ),
        ]);
  }

  //广播数据
  List<RadioModel> radioList = [];

  ///数据请求 字典数组转model数组
  void getRadioList() async {
    try {
      Map<String, dynamic> map = await API.getRadios();
      if (map["ret"] != 0) {
        return;
      }
      List list = map["data"]["categories"];
      radioList = List<RadioModel>.from(
          list.map((jsonMap) => RadioModel.fromJson(jsonMap)));
    } finally {}
  }
}
