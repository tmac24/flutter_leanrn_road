import 'package:discover_road/home_page/radios/eg_get_refresh.dart';
import 'package:discover_road/home_page/radios/radios_categories.dart';
import 'package:discover_road/home_page/secondaryPage/eg_getx.dart';
import 'package:discover_road/home_page/secondaryPage/eg_getx_tool.dart';
import 'package:discover_road/home_page/secondaryPage/eg_refresh.dart';
import 'package:discover_road/home_page/secondaryPage/eg_route.dart';
import 'package:discover_road/home_page/secondaryPage/eq_listview.dart';
import 'package:discover_road/home_page/home_model/home_model.dart';
import 'package:discover_road/home_page/homedetail_page.dart';
import 'package:discover_road/home_page/secondaryPage/eq_loadmore.dart';
import 'package:discover_road/macro/define.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'secondaryPage/eq_Refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => mydrawer()));
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          // ignore: unnecessary_new
          new IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeDetailPage()));
            },
            icon: const Icon(Icons.face),
          )
        ],
        title: const Text('主页'),
      ),
      body: const XXGrideViewPage2Content(),
    );
  }
}

// .builder方式
class XXGrideViewPage2Content extends StatelessWidget {
  const XXGrideViewPage2Content({super.key});
  Widget _getListData(context, index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1),
      ),
      child: GestureDetector(
        child: Column(
          children: [
            Image.network(homeData[index]['imageUrl']),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: kWidth / 2 - 20,
              child: Text(
                homeData[index]['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),
        onTap: () => _tapItem(index, homeData[index]['title'], context),
      ),
    );
  }

  _tapItem(index, name, context) {
    // ignore: avoid_print
    print('点击了第$index个，name是：$name');
    if (name == 'ListView') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListViewEg4()),
      );
    } else if (name == '下拉刷新') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EgRefreshPage()),
      );
    } else if (name == '上拉加载更多') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoadMorePage()),
      );
    } else if (name == '页面传值') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const RoutePage(
                  title: '路由',
                )),
      );
    } else if (name == 'GetX') {
      Get.to(GetXPage());
    } else if (name == 'RadioPage') {
      // Get.to(GetxToolPage());
      Get.to(RadioPage());
    } else {
      // Get.to(GetxToolPage());
      // Get.to(RefreshPage());
      Get.to(MusicPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //注意
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10.0, //水平子 Widget 之间间距
        crossAxisSpacing: 10.0, //垂直子 Widget 之间间距
        crossAxisCount: 2, //一行的 Widget 数量
      ),
      itemCount: homeData.length,
      itemBuilder: _getListData,
    );
  }
}
