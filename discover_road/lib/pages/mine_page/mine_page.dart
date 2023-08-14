import 'dart:ui';

import 'package:discover_road/common/define.dart';
import 'package:discover_road/pages/difference/differencePage.dart';
import 'package:discover_road/pages/mine_page/layout/layout_expand.dart';
import 'package:discover_road/pages/mine_page/layout/layout_row.dart';
import 'package:discover_road/pages/mine_page/mine_model.dart';
import 'package:discover_road/pages/mine_page/universal/card_page.dart';
import 'package:discover_road/pages/mine_page/universal/gride_page.dart';
import 'package:discover_road/pages/mine_page/universal/list_page.dart';
import 'package:discover_road/pages/mine_page/universal/stack_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layout/layout_cake.dart';
import 'layout/layoutbuild_demo.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  //字典数据转模型数组
  List<MineDateModel> modelList =
      List<MineDateModel>.from(Minedatas.map((e) => MineDateModel.fromMap(e)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '个人中心',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.to(const DifferencePage());
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => mydrawer()));
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: modelList.length,
          itemBuilder: (context, index) {
            MineDateModel model = modelList[index];
            if (index == 0) {
              return MyHeadAndName(model: model);
            } else {
              return MineItem(model: model);
            }
          },
        ),
      ),
    );
  }
}

///每一项
class MineItem extends StatelessWidget {
  final MineDateModel model;
  const MineItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => listItemClick(context, model.name),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        padding: const EdgeInsets.fromLTRB(11, 2, 11, 2),
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 245, 228),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  model.icon,
                  width: 27,
                  height: 27,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  model.name,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w800),
                )
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text(
                model.subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}

///头像 昵称
class MyHeadAndName extends StatelessWidget {
  final MineDateModel model;
  const MyHeadAndName({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        listItemClick(context, model.name);
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
        color: Color.fromARGB(255, 163, 188, 208),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  model.icon,
                  // width: 60,
                  // height: 60,
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 11, 0, 11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        model.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(model.subTitle),
                    ],
                  ),
                ),
              ],
            ),
            Container(),
            Image.asset(
              'assets/yjt@2x.png',
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

void listItemClick(context, String name) {
  // ignore: avoid_print
  print('个人中心页面：点击了$name');
  if (name == 'layout（Row、Column）') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MylayouRowAndColum()),
    );
  } else if (name == 'layout（Expanded）') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyLayoutExpand()),
    );
  } else if (name == 'CakeDemo') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyLayoutCakeDemo()),
    );
  } else if (name == 'GridView') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyGrideDemo()),
    );
  } else if (name == 'ListView') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyListView()),
    );
  } else if (name == 'Stack') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyStack()),
    );
  } else if (name == 'Material_Card') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyCard()),
    );
  } else if (name == 'layoutBuildDemo') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MylayoutBuild()),
    );
  }
}
