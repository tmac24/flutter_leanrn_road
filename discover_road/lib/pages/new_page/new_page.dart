import 'package:discover_road/common/http/API.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'new_model.dart';

void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {}
}

/// 逻辑层
class NewsController extends GetxController {
  /// 是否在加载中，显示加载的loading
  bool isLoading = true;

  /// 新闻模型列表
  List<NewsModel> newsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getNewsList();
    super.onInit();
  }

  /// 数据请求与处理
  void getNewsList() async {
    try {
      Map<String, dynamic> map = await API.getNews();
      if (map["resultcode"] == "112") {
        return;
      }
      List list = map["result"];
      newsList = List<NewsModel>.from(
          list.map((jsonMap) => NewsModel.fromMap(jsonMap)));
      newsList.removeAt(0);
      update();
    } finally {
      isLoading = false;
      update();
    }
  }
}

/// 视图层
class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counter = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("新闻列表"),
      ),
      body: GetBuilder<NewsController>(
        builder: (counter) {
          if (counter.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: counter.newsList.length,
              itemBuilder: (_, index) {
                NewsModel newsModel = counter.newsList[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        newsModel.itemCover,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          newsModel.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
