# flutter

学习网站： https://book.flutterchina.club/chapter4/constraints.html#_4-2-6-unconstrainedbox 

## JSON转model

#### 格式化工具：

使用 [json_serializable](https://pub.dartlang.org/packages/json_serializable)库：https://caijinglong.github.io/json2dart/index_ch.html

命令行：

- flutter packages pub run build_runner build (该指令是一次性生成JSON序列化的代码)
- flutter packages pub run build_runner watch (持续生成指令)

#### 三方：json_model

1. 在工程根目录下创建一个名为 "jsons" 的目录;
2. 创建或拷贝Json文件到"jsons" 目录中 ;
3. 运行 *** pub run json_model ** (Dart VM工程)or *** flutter packages pub run json_model**(Flutter中) 命令生成Dart model类，生成的文件默认在"lib/models"目录下

#### 其他方案

JSON转模型 https://app.quicktype.io （Null Safety,Make all properties optional都要勾选）

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
  highlightColor: Colors.blue,
  onPressed: () {},
)
```

## dart语法

#### 字典：

```dart
const Map<String, String> _bottomNames = {'all': '主页'};
```

#### 数组:

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

---

## 常出现的问题

#### flutter 运行报command not found: flutter

- 打开终端，在命令行输入 sudo vi ~/.bash_profile,输入你的电脑开机密码，然后在里面按i添加,添加一下内容

  - ```jsx
    export PATH=/Users/XXX/flutter/bin:$PATH
    export PUB_HOSTED_URL=https://pub.flutter-io.cn
    export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    注 需要注意的是把/Users/XXX/flutter这个路径，更换为自己的flutter的路径。
    ```

- 指向source： source ~/.bash_profile
- flutter doctor,检查是否生效