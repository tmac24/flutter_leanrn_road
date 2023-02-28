// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GetxToolPage extends StatelessWidget {
//   const GetxToolPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('GetxToolPage')),
//         body: const SafeArea(child: Text('GetxToolController')));
//   }
// }

import 'dart:convert';

import 'package:get/get_connect/connect.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class Api extends GetConnect {
// Get request
  Future<Response> getUser(int id) => get('http://youapi/users/id');
// Post request
  Map data = {};
  // Future<Response> postUser(Map data) =>
  //     post('http://youapi/users', query: data);
// Post request with File
  Future<Response<CasesModel>> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }

  GetSocket userMessages() {
    return socket('https://yourapi/users/socket');
  }
}

class CasesModel {}
