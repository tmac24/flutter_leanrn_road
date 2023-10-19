/*
 * @Author: T-Mac
 * @Date: 2023-10-19 11:08:10
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String channelName_wikifxsaveLaunage = 'com.wikifx.BXTestChannel';
const String method_BXTestChannel = 'method_BXTestChannel';
const String method_BXTestChannel_from_ios = 'method_BXTestChannel_from_ios';

class BXTestChannel {
  static final BXTestChannel shared = BXTestChannel._();
  BXTestChannel._();
  factory BXTestChannel() => shared;
  static const _channel = MethodChannel(channelName_wikifxsaveLaunage);

  ///flutter调ios
  Future<String> getIosString() async {
    var a = await _channel.invokeMethod(method_BXTestChannel, {
      "test": "bx",
    });
    return a;
  }

  ///ios调flutter
  initEventChannel(BuildContext context) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == method_BXTestChannel_from_ios) {
        Map payResult = Map<String, dynamic>.from(call.arguments);
        print("收到ios消息:${payResult.toString()}");
      }
      return null;
    });
  }
}
