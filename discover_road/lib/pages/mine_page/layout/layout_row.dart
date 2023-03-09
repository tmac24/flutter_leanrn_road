import 'package:flutter/material.dart';

class MylayouRowAndColum extends StatefulWidget {
  @override
  _MylayouRowAndColumState createState() => _MylayouRowAndColumState();
}

class _MylayouRowAndColumState extends State<MylayouRowAndColum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RowAndColum'),
      ),
      body: testCenter1(),
      // body: Container(
      //   decoration: BoxDecoration(color: Colors.white),
      //   child: Container(
      //     child: Row(
      //       children: <Widget>[
      //         MyLayout.column(),
      //         Padding(padding: EdgeInsets.fromLTRB(13, 0, 0, 0)),
      //         MyLayout.row(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class MyLayout {
  static row() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _getImage('assets/pic1.jpg'),
          _getImage('assets/pic2.jpg'),
          _getImage('assets/pic3.jpg'),
        ],
      ),
    );
  }

  static column() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getImage('assets/pic1.jpg'),
          _getImage('assets/pic2.jpg'),
          _getImage('assets/pic3.jpg'),
        ],
      ),
    );
  }

  static _getImage(imageStr) {
    return new Image.asset(
      imageStr,
      width: 100.0,
    );
  }

  static test1() {
    return Center(
      child: Container(
          child: ClipOval(
        child: Image.network(
          "https://www.itying.com/images/201905/thumb_img/1101_thumb_G_1557845381862.jpg",
          width: 150.0,
          height: 150.0,
        ),
      )),
    );
  }
}

Center testCenter1() {
  return Center(
    child: Container(
      child: Image.network(
        "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg",
        alignment: Alignment.topLeft,
        color: Colors.red,
        colorBlendMode: BlendMode.colorDodge, // repeat: ImageRepeat.repeatX,
        fit: BoxFit.cover,
      ),
      width: 300.0,
      height: 400.0,
      decoration: BoxDecoration(color: Colors.yellow),
    ),
  );
}
