import 'package:flutter/material.dart';

class MyStack extends StatefulWidget {
  @override
  _MyStackState createState() => _MyStackState();
}

class _MyStackState extends State<MyStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stack'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildStack(),
            Text(
                '可以使用 Stack 在基础 widget（通常是图片）上排列 widget， widget 可以完全或者部分覆盖基础 widget。\n\n摘要 (Stack)\n\n用于覆盖另一个 widget\n\n子列表中的第一个 widget 是基础 widget；后面的子项覆盖在基础 widget 的顶部\n\nStack 的内容是无法滚动的\n\n你可以剪切掉超出渲染框的子项示例 (Stack)'),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() => Stack(
        alignment: const Alignment(0.6, 0.6),
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/pic0.jpg'),
            radius: 100,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'James KT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
}

/**Stack

可以使用 Stack 在基础 widget（通常是图片）上排列 widget， widget 可以完全或者部分覆盖基础 widget。

摘要 (Stack)
用于覆盖另一个 widget

子列表中的第一个 widget 是基础 widget；后面的子项覆盖在基础 widget 的顶部

Stack 的内容是无法滚动的

你可以剪切掉超出渲染框的子项

示例 (Stack)

 */
