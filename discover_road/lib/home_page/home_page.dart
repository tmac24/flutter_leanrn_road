import 'package:discover_road/home_page/home_model/home_model.dart';
import 'package:discover_road/macro/define.dart';
import 'package:flutter/material.dart';

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
        title: Text('主页'),
      ),
      body: XXGrideViewPage2Content(),
    );
  }
}

// .builder方式
class XXGrideViewPage2Content extends StatelessWidget {
  const XXGrideViewPage2Content({super.key});
  Widget _getListData(context, index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1),
      ),
      child: GestureDetector(
        child: Column(
          children: [
            Image.network(homeData[index]['imageUrl']),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: width / 2 - 20,
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
    print('点击了第$index个，name是：$name');
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
