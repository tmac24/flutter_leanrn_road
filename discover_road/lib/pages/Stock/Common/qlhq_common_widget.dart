/*
 * @Author: T-Mac
 * @Date: 2023-08-15 16:48:55
 * @Description: 行情模块公共的widget
 */

import 'package:flutter/material.dart';

//行情指数个股UI
Widget HQIndexItemStock(String name, String price, String rise, String rate) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        name,
        style: name.length > 7
            ? const TextStyle(fontSize: 14, color: Colors.black)
            : const TextStyle(fontSize: 17, color: Colors.black),
      ),
      Text(
        price,
        style: const TextStyle(
            fontSize: 18, color: Color.fromARGB(255, 1, 163, 7)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            rise,
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 1, 171, 7)),
          ),
          Text(
            rate,
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 2, 173, 8)),
          ),
        ],
      )
    ],
  );
}
