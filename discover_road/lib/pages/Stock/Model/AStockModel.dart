/*
 * @Author: T-Mac
 * @Date: 2023-08-15 13:40:38
 * @Description: 
 */

// To parse this JSON data, do
//
//     final aStockSort = aStockSortFromJson(jsonString);

import 'dart:convert';

List<AStockSort> aStockSortFromJson(String str) =>
    List<AStockSort>.from(json.decode(str).map((x) => AStockSort.fromJson(x)));

String aStockSortToJson(List<AStockSort> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AStockSort {
  String header;
  bool isShow;
  List<Stock> stock;

  AStockSort({
    required this.header,
    required this.isShow,
    required this.stock,
  });

  factory AStockSort.fromJson(Map<String, dynamic> json) => AStockSort(
        header: json["header"],
        isShow: json["isShow"],
        stock: List<Stock>.from(json["stock"].map((x) => Stock.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": header,
        "isShow": isShow,
        "stock": List<dynamic>.from(stock.map((x) => x.toJson())),
      };
}

class Stock {
  String name;
  String code;
  double price;
  String rise;

  Stock({
    required this.name,
    required this.code,
    required this.price,
    required this.rise,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        name: json["name"],
        code: json["code"],
        price: json["price"]?.toDouble(),
        rise: json["rise"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "price": price,
        "rise": rise,
      };
}
