# flutter

## 11月26号

### dart语法

##### 字典：

```dart
const Map<String, String> _bottomNames = {'all': '主页'};
```

##### 数组:

```dart
final List<int> _numbers = <int>[1, 2, 3];
```

### flutter

##### 界面跳转

```dart
Navigator.push(context, MaterialPageRoute(builder: (context) => mydrawer()));
```

##### 网路请求+JSON解析

```dart
  /// 网络请求
  static Future<Map<String, dynamic>> getNews() async {
    var response = await Dio().get(
       "http://apis.juhe.cn/fapig/douyin/billboardtype=hot_video&size=50&key=9eb8ac7020d9bea6048db1f4c6b6d028");
    return jsonDecode(response.toString());
  }
```

