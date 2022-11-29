import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('card'),
      ),
      body: _buildCard(),
    );
  }

  Widget _buildCard() => SizedBox(
        height: 210,
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  '1625 Main Stree',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text('My City, CA 99984'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text('(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text(
                  'costa@example.com',
                ),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
                trailing: Icon(Icons.access_alarm),
              ),
            ],
          ),
        ),
      );
}
/**
 Material 库 中的 Card 包含相关有价值的信息，几乎可以由任何 widget 组成，但是通常和 ListTile 一起使用。 Card 只有一个子项，这个子项可以是列、行、列表、网格或者其他支持多个子项的 widget。默认情况下，Card 的大小是 0x0 像素。你可以使用 SizedBox 控制 card 的大小。

在 Flutter 中，Card 有轻微的圆角和阴影来使它具有 3D 效果。改变 Card 的 elevation 属性可以控制阴影效果。例如，把 elevation 设置为 24，可以从视觉上更多的把 Card 抬离表面，使阴影变得更加分散。关于支持的 elevation 的值的列表，可以查看 Material guidelines 中的 Elevation。使用不支持的值则会使阴影无效。

摘要 (Card)
实现一个 Material card

用于呈现相关有价值的信息

接收单个子项，但是子项可以是 Row、Column 或者其他可以包含列表子项的 widget

显示圆角和阴影

Card 的内容无法滚动

来自 Material 库

 */
