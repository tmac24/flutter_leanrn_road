class MineDateModel {
  late String icon;
  late String name;
  late String subTitle;

  MineDateModel.fromMap(Map<String, dynamic> json) {
    icon = json["icon"];
    name = json["name"];
    subTitle = json["subTitle"];
  }
}

List Minedatas = [
  {"icon": "assets/tom@2x.png", "name": "神奈川丶解夏", "subTitle": "1466734654"},
  {
    "icon": "assets/其他问题@3x.png",
    "name": "CakeDemo",
    "subTitle": "我是详情，我是详情,详情就是我"
  },
  {"icon": "assets/账户问题@2x.png", "name": "listView", "subTitle": "切换豪华版、经典版"},
  {
    "icon": "assets/商品选中@3x.png",
    "name": "XXGrideViewPage",
    "subTitle": "我是详情，我是详情,详情就是我"
  },
  {
    "icon": "assets/商品选中@3x.png",
    "name": "XXGrideViewPage",
    "subTitle": "我是详情，我是详情,详情就是我"
  },
  {
    "icon": "assets/商品选中@3x.png",
    "name": "XXGrideViewPage",
    "subTitle": "我是详情，我是详情,详情就是我"
  },
];
