import 'dart:convert';
import 'package:dio/dio.dart';
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
}
