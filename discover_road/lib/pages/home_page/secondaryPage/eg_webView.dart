import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // 1
  late WebViewController controller;

  @override
  void initState() {
    // 2
    controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse('https://flutter.cn'));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webView'),
      ),
      body: Column(
        children: [
          // 3
          Expanded(child: WebViewWidget(controller: controller))
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          var title = await controller.getTitle();
          print(title);
        },
        child: const Text('获取 title'),
      ),
    );
  }
}

// class WebViewPage extends StatelessWidget {
//   const WebViewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WebView'),
//       ),
//       body: WebViewWidget(
//         controller: getWebView(),
//       ),
//     );
//   }

//   WebViewController getWebView() {
//     final controller = WebViewController();
//     controller.setJavaScriptMode(JavaScriptMode.unrestricted);
//     controller.setBackgroundColor(Colors.white);
//     controller.setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//         },
//         onPageStarted: (String url) {},
//         onPageFinished: (String url) {},
//         onWebResourceError: (WebResourceError error) {},
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//     controller.loadRequest(Uri.parse('https://flutter.cn'));
//     return controller;
//   }
// }
