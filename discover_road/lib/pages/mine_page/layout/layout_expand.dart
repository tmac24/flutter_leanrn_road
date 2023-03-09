import 'package:flutter/material.dart';

class MyLayoutExpand extends StatefulWidget {
  @override
  _MyLayoutExpandState createState() => _MyLayoutExpandState();
}

class _MyLayoutExpandState extends State<MyLayoutExpand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expanded'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ExpandDemo.row(),
            ExpandDemo.widgets(),
          ],
        ),
      ),
    );
  }
}

class ExpandDemo {
  static row() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/pic1.jpg',
              width: 200,
              height: 200,
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/pic2.jpg',
              width: 300,
              height: 200,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/pic3.jpg',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  static widgets() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min, //紧密组合
        children: [
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
      ),
    );
  }
}
