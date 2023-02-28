import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class GetXPage extends StatelessWidget {
  @override
  Widget build(context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

      // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: _pressFun,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  bool isDarkMode = true;
  void _pressFun() {
    Get.to(First());
    // Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    // Get.changeTheme(isDarkMode ? ThemeData.light() : ThemeData.dark());
    // isDarkMode = !isDarkMode;
  }
}

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // Get.snackbar("hi", "i am a modern snackbar");
            Get.defaultDialog(
                onConfirm: () => print("Ok"),
                middleText: "Dialog made in 3 lines of code");
            // Get.bottomSheet(Container(
            //   child: Wrap(
            //     children: <Widget>[
            //       ListTile(
            //           leading: Icon(Icons.music_note),
            //           title: Text('Music'),
            //           onTap: () {}),
            //       ListTile(
            //         leading: Icon(Icons.videocam),
            //         title: Text('Video'),
            //         onTap: () {},
            //       ),
            //     ],
            //   ),
            // ));
          },
        ),
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Get.toNamed("/second");
          },
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("hi", "i am a modern snackbar");
          },
        ),
        title: Text('second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Get.toNamed("/third");
          },
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
