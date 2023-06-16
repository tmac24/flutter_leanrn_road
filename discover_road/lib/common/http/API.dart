import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:discover_road/pages/home_page/radios/radioSquareModel.dart';
import 'package:flutter/material.dart';

class API {
  ///新闻
  // static const String News =
  //     'http://apis.juhe.cn/fapig/douyin/billboard?type=hot_video&size=50&key=9eb8ac7020d9bea6048db1f4c6b6d028';

  // var _request = HttpRequest(API.News);

  // Future<dynamic> _query(String url, String value) async {
  //   final result = await _request
  //       .get('$url');
  //   return result;
  // }

  /// 网络请求
  static Future<Map<String, dynamic>> getNews() async {
    var response = await Dio().get(
        "http://apis.juhe.cn/fapig/douyin/billboard?type=hot_video&size=50&key=9eb8ac7020d9bea6048db1f4c6b6d028");
    return jsonDecode(response.toString());
  }

  //喜马拉雅广播写法1
  static Future<Map<String, dynamic>> getRadios() async {
    var response =
        await Dio().get("http://live.ximalaya.com/live-web/v5/homepage");
    return jsonDecode(response.toString());
  }

  //喜马拉雅广播写法2
  static Future<RadioSquare> getXMRadios() async {
    var response =
        await Dio().get("http://live.ximalaya.com/live-web/v5/homepage");
    return radioSquareFromJson(response.toString());
  }
}
