# flutter

## GetX

GetX 是 Flutter 上的一个轻量且强大的解决方案：高性能的状态管理、智能的依赖注入和便捷的路由管理

地址：https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md

- ##### 状态管理

- ##### 路由管理

- ##### 依赖管理

```dart
//创建你的业务逻辑类，并将所有的变量，方法和控制器放在里面
class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
final Controller c = Get.put(Controller());

// 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
Get.to(FirstPage());

// 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
final Controller c = Get.find();

```

喜马拉雅广播接口：http://live.ximalaya.com/live-web/v5/homepage

## flutter_easyrefresh

EasyRefresh很容易就能在Flutter应用上实现下拉刷新以及上拉加载操作,EasyRefresh中集成了多种风格的Header和Footer

```dart
EasyRefresh.custom(
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          controller: _controller,
          header: ClassicalHeader(),
          footer: ClassicalFooter(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('onRefresh');
              setState(() {
                _count = 20;
              });
              _controller.resetLoadState();
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('onLoad');
              setState(() {
                _count += 10;
              });
              _controller.finishLoad(noMore: _count >= 40);
            });
          },
          slivers: <Widget>[]
          ),
) 
```



## FButton

从此开发者只用掌握一种 **Button** 组件，就够了。

支持圆角、边框、图标、特效、Loading 模式、高质感的 Neumorphism 风格

地址：https://github.com/Fliggy-Mobile/fbutton/blob/master/README_CN.md

```dart
// FButton #1
FButton(
  height: 40,
  alignment: Alignment.center,
  text: "FButton #1",
  style: TextStyle(color: Colors.white),
  color: Color(0xffffab91),
  onPressed: () {},
)
```

## dart语法

##### 字典：

```dart
const Map<String, String> _bottomNames = {'all': '主页'};
```

##### 数组:

```dart
final List<int> _numbers = <int>[1, 2, 3];
```

## 界面跳转

```dart
Navigator.push(context, MaterialPageRoute(builder: (context) => mydrawer()));
```

## 网路请求+JSON解析

```dart
  /// 网络请求
  static Future<Map<String, dynamic>> getNews() async {
    var response = await Dio().get(
       "http://apis.juhe.cn/fapig/douyin/billboardtype=hot_video&size=50&key=9eb8ac7020d9bea6048db1f4c6b6d028");
    return jsonDecode(response.toString());
  }
```

-----

