import 'dart:ui';

import 'package:discover_road/macro/define.dart';
import 'package:discover_road/mine_page/mine_model.dart';
import 'package:flutter/material.dart';

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
    return Container(
      constraints: const BoxConstraints.expand(
        height: 50.0,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      padding: const EdgeInsets.fromLTRB(11, 2, 11, 2),
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
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(
            width: 150,
            child: Expanded(
              child: Text(
                model.subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
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
    return Container(
      height: 80,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
      color: Colors.blue,
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
    );
  }
}
