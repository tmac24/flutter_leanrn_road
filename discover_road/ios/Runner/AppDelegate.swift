import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
            GeneratedPluginRegistrant.register(with: self)
        
              weak var registrar = self.registrar(forPlugin: "plugin-name")
        
              let factory = FLNativeViewFactory(messenger: registrar!.messenger())
              self.registrar(forPlugin: "<plugin-name>")!.register(
                  factory,
                  withId: "<platform-view-type>")
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        // flutter调用iOS的代码，在这里写。 ----- BEGIN
        if let controller = window.rootViewController as? FlutterBinaryMessenger {
            let channel = FlutterMethodChannel.init(name: "test.flutter.io/testAction1", binaryMessenger: controller);
            channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) -> Void in
//                NSLog(@"%@---%@",call.method,call.arguments);
                print(call.method);
                print(call.arguments ?? "");
                if (call.method == "testAction1") {
                    
                    result("ios假数据"); // 根据需求，调用具体方法返回特定数据.
                }
                result(FlutterMethodNotImplemented);
            }
        }
        
        // flutter调用iOS的代码，在这里写。 ----- END
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
