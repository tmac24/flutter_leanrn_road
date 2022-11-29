import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MylayoutBuild extends StatefulWidget {
  @override
  _MylayoutBuildState createState() => _MylayoutBuildState();
}

class _MylayoutBuildState extends State<MylayoutBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('layoutBuildDemo'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'assets/pic1.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
            /**1 */
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /**2 */
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            )
          ],
        )),
        /**3 */
        Icon(
          Icons.star,
          color: Colors.red,
        ),
        Text('42'),
      ],
    ),
  );

  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(Colors.blueGrey, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.blueGrey, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.blueGrey, Icons.share, 'SHARE'),
      ],
    ),
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}

/**1.将 Column 元素放到 Expanded widget 中可以拉伸该列，以利用该行中所有剩余的闲置空间。
   设置 crossAxisAlignment 属性值为 CrossAxisAlignment.start，这会将该列放置在行的起始位置。 */
/**2.将第一行文本放入 Container 容器中使得你可以增加内间距。列中的第二个子元素，同样为文本，显示为灰色。 */
/**3.标题行中的最后两项是一个红色星形图标，和文字”41”。整行都在一个 Container 容器布局中，而且每条边都有 32 像素的内间距 */
