import 'package:discover_road/common/git.dart';
import 'package:discover_road/common/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/index.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  static const loadingTag = "##loading##"; //表尾标记
  var _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: _buildBody(), //构建主页面
    );
  }

  Widget _buildBody() {
    // UserModel userModel = Provider.of<UserModel>(context);
    return Container();
  }
}

void requestData() async {
  var data = await Git().getRepos(
    queryParameters: {
      'page': 1,
      'page_size': 20,
    },
  );
}
