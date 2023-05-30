import 'package:discover_road/pages/home_page/radios/radios_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:discover_road/common/http/API.dart';

/// 逻辑层
class MusicController extends GetxController {
  //数据个数
  var count = 0.obs;

  late final EasyRefreshController _controller = EasyRefreshController();

  //广播数据
  List<RadioModel> MusicList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getMusicList();
    super.onInit();
  }

  ///数据请求 字典数组转model数组
  void getMusicList() async {
    try {
      Map<String, dynamic> map = await API.getRadios();
      if (map["ret"] != 0) {
        return;
      }
      List list = map["data"]["categories"];
      MusicList = List<RadioModel>.from(
          list.map((jsonMap) => RadioModel.fromJson(jsonMap)));
      update();
    } finally {
      update();
    }
  }
}

class MusicPage extends GetView<StatelessWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MusicController());
    return Scaffold(
      appBar: AppBar(title: Text('MusicPage')),
      body: GetBuilder<MusicController>(
        builder: (controller) {
          return Text("${controller.MusicList.length}");
        },
      ),
    );
  }
}
