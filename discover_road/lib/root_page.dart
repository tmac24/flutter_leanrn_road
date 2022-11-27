import 'package:discover_road/mine_page/mine_page.dart';
import 'package:discover_road/shoplist_page/shoplist_page.dart';
import 'package:flutter/material.dart';

import 'home_page/home_page.dart';
import 'new_page/new_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

const Map<String, String> _bottomNames = {
  'all': '主页',
  'favorites': '新闻',
  'play': '',
  'pic': '小视频',
  'integral': '我的'
};

class _MainPageState extends State<MainPage> {
  //当前选中索引
  int _currentIndex = 0;

  //页面集合
  final List<Widget> _pages = <Widget>[
    HomePage(),
    NewsPage(),
    Container(),
    RandomWords(),
    MinePage()
  ];

  //底部item数组
  final List<BottomNavigationBarItem> _bottomNavBarList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bottomNames.forEach((key, value) {
      _bottomNavBarList.add(_bottomNavigationBarItem(key, value));
    });
  }

  //每一项baritem
  BottomNavigationBarItem _bottomNavigationBarItem(String key, String value) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/$key.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/$key-fill.png',
        width: 24,
        height: 24,
      ),
      label: value,
      tooltip: '',
    );
  }

  //底部切换
  void _onTabClick(int value) {
    if (value == 2) {
      return _onCreateMedia();
    }
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      drawer: mydrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarList,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: _creatMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //发布按钮
  Widget _creatMediaButton() {
    return Container(
      width: 44,
      height: 44,
      margin: EdgeInsets.only(top: 56),
      child: FloatingActionButton(
        onPressed: _onCreateMedia,
        child: Image.asset(
          'assets/images/icons/play.png',
        ),
      ),
    );
  }

  void _onCreateMedia() {
    print('_onCreateMedia');
  }
}

//滑动抽屉
class mydrawer extends StatefulWidget {
  // const mydrawer({Key key, ScaffoldState state}) : super(key: key);

  @override
  _mydrawerState createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _openDrawer() {
  //   _scaffoldKey.currentState.openDrawer();
  // }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _scaffoldKey,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

/**
 * Scaffold(
      // appBar: AppBar(
      //   title: Text('主页面'),
      // ),
      drawer: mydrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              title: Text(
                '主页',
                style: TextStyle(fontSize: 14),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 20,
              ),
              title: Text('喜欢')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.music_video,
                size: 20,
              ),
              title: Text('我的')),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          return Text(_currentIndex.toString());
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
    );
 */
