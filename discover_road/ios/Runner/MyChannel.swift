//
//  MyChannel.swift
//  Runner
//
//  Created by cdql10103 on 2023/10/19.
//

import UIKit
import Flutter

class MyChannel: NSObject {
    static let sharedInstance = MyChannel()
    
    private var flutterViewController = FlutterViewController()
    private var methodChannel: FlutterMethodChannel?
    private var flutterResult: FlutterResult?

    private let channelName_wikifxsaveLaunage = "com.wikifx.BXTestChannel"
    private let method_BXTestChannel = "method_BXTestChannel"
    private let method_BXTestChannel_from_ios = "method_BXTestChannel_from_ios"


    func initWithFlutterViewController(binaryMessenger:FlutterBinaryMessenger) {
        MyChannel.sharedInstance.methodChannel = FlutterMethodChannel(name: "com.wikifx.BXTestChannel", binaryMessenger: binaryMessenger)
        //接收flutter消息
        MyChannel.sharedInstance.methodChannel?.setMethodCallHandler({ call, result in
            if(self.method_BXTestChannel == call.method) {
                let param = call.arguments
                print(param ?? "")

                let str = "\(param ?? "")iosString"
                result(str)
                
                //延迟两秒
                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    self.sendMsgToFlutter()
                }
                
            }else {
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    //ios给flutter发消息
    func sendMsgToFlutter() {
        let dic = ["key1":"hello1","key2":"hello2","ios":"ios给flutter发消息"]
        MyChannel.sharedInstance.methodChannel?.invokeMethod(method_BXTestChannel_from_ios, arguments: dic)
    }
        
}
