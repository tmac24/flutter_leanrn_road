import 'package:discover_road/pages/home_page/radios/radioSquareModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:discover_road/common/http/API.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 逻辑层
class MusicController extends GetxController {
  //广播数据
  List<Category> musicList = [];

  @override
  void onInit() {
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
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    final vc = Get.put(MusicController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('MusicPage2'),
        actions: [
          // ignore: unnecessary_new
          new IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg:
                      "This is Center Short Toast This is Center Short Toast This is Center Short ToastThis is Center Short ToastThis is Center Short ToastThis is Center Short Toast",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            icon: const Icon(Icons.face),
          )
        ],
      ),
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
