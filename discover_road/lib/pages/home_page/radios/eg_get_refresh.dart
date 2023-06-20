import 'package:discover_road/pages/home_page/radios/radioSquareModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:discover_road/common/http/API.dart';

import '../secondaryPage/eg_refresh.dart';

/// 逻辑层
class MusicController extends GetxController {
  //数据个数
  // var count = 0.obs;

  late final EasyRefreshController _controller = EasyRefreshController();

  //广播数据
  List<Category> musicList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getMusicList();
    super.onInit();
  }

  ///数据请求 字典数组转model数组
  void getMusicList() async {
    try {
      RadioSquare radioSquare = await API.getXMRadios();
      if (radioSquare.ret != 0) {
        return;
      }
      musicList = radioSquare.data.categories;
      update();
    } finally {
      update();
    }
  }
}

// class MusicPage extends GetView<StatelessWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final vc = Get.put(MusicController());
//     return Scaffold(
//       appBar: AppBar(title: const Text('MusicPage')),
//       body: GetBuilder<MusicController>(
//         builder: (controller) {
//           return Text("${vc.musicList.length}");
//         },
//       ),
//     );
//   }
// }

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  late EasyRefreshController _refreshController;
  // int _count = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    final vc = Get.put(MusicController());
    return Scaffold(
      appBar: AppBar(title: const Text('MusicPage2')),
      body: GetBuilder<MusicController>(builder: (controller) {
        return EasyRefresh.custom(
          // enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          controller: _refreshController,
          header: ClassicalHeader(),
          // footer: ClassicalFooter(),
          onRefresh: () async {
            // await Future.delayed(Duration(seconds: 2), () {
            vc.getMusicList();
            // _count = vc.musicList.length;
            _refreshController.resetLoadState();
            // });
          },
          // onLoad: () async {
          //   await Future.delayed(Duration(seconds: 2), () {
          //     print('onLoad');
          //     setState(() {
          //       _count += 10;
          //     });
          //     _refreshController.finishLoad(noMore: _count >= 60);
          //   });
          // },
          slivers: [liverList(vc.musicList)],
        );
      }),
    );
  }

  Widget liverList(List list) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            width: 60.0,
            height: 60.0,
            color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
            child: Center(
              child: Text('$index'),
            ),
          );
        },
        childCount: list.length,
      ),
    );
  }
}
