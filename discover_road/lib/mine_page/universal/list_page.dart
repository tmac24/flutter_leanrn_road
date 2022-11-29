import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Center(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() => ListView(
        children: <Widget>[
          _listTile('潇洒范1', '哈不发不发二xcvzzvzx号入网然后求', Icons.theaters),
          _listTile('潇洒范2', '哈不发不发sgfdsd二号入网然后求', Icons.thumb_down),
          _listTile('潇洒范4', '哈不发不发二dg号入网然后求', Icons.theaters),
          _listTile('潇洒范2', '哈不发不发二号入网然后求', Icons.timelapse),
          _listTile('潇洒范dg', '哈不发不发awfasdfsda二号入网然后求', Icons.texture),
          _listTile('潇洒范5', '哈不发不发二号sfsaf入网然后求', Icons.textsms),
          _listTile('潇洒范13', '哈不发不发二号入网然后求', Icons.theaters),
          _listTile('潇洒范tre', '哈不发不发二号入网然后求', Icons.theaters),
        ],
      );

  ListTile _listTile(String title, String subTitle, IconData icon) => ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text(subTitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}

/**
 ListView，一个和列很相似的 widget，当内容长于自己的渲染盒时，就会自动支持滚动。

摘要 (ListView)
一个用来组织盒子中列表的专用 Column

可以水平或者垂直布局

当监测到空间不足时，会提供滚动

比 Column 的配置少，使用更容易，并且支持滚动 
 */
