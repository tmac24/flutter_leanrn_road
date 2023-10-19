import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';

class PaginatedDataTablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginatedPageState();
}

class _PaginatedPageState extends State<PaginatedDataTablePage> {
  final SourceData _sourceData = SourceData();
  var _rowsPerPage = 8;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PaginatedDataTable Page')),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          source: _sourceData,
          headingRowHeight: 50.0,
          rowsPerPage: _rowsPerPage,
          onPageChanged: (i) => print('onPageChanged -> $i'),
          availableRowsPerPage: [8, 16, 20],
          onRowsPerPageChanged: (value) =>
              setState(() => _rowsPerPage = value!),
          sortColumnIndex: 1,
          showCheckboxColumn: false,
          // sortAscending: _sortAscending,
          columns: [
            DataColumn(
                label: Text('ID'),
                onSort: (index, sortAscending) {
                  print('sortsortsort');
                }),
            DataColumn(label: Text('Name')),
            DataColumn(
                label: Row(children: [
              Text('Price'),
              SizedBox(width: 5.0),
              Icon(Icons.airplanemode_active)
            ])),
            DataColumn(label: Text('No.')),
            DataColumn(label: Text('Address'))
          ],
        ),
      ),
    );
  }
}

class SourceData extends DataTableSource {
  final int _selectCount = 0; //当前选中的行数
  final List _sourceData = jsonlist;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _sourceData.length;

  @override
  int get selectedRowCount => _selectCount;

  @override
  DataRow getRow(int index) => DataRow.byIndex(
        index: index,
        cells: [
          DataCell(Text(_sourceData[index]['code'])),
          DataCell(Text(_sourceData[index]['stockname'])),
          DataCell(Text(_sourceData[index]['now'].toString())),
          DataCell(Text(_sourceData[index]['now'].toString())),
          DataCell(Text(_sourceData[index]['now'].toString()))
        ],
      );
}

List jsonlist = [
  {
    "code": "600000",
    "stocktype": 2,
    "market": 1,
    "unitanddot": {"pricedot": 2, "unit": 100},
    "newDot": 100,
    "stockname": "浦发银行",
    "inVolume": 10246017,
    "now": 715,
    "zf": -14,
    "zd": -1,
    "hsl": 7,
    "volume": 21886050,
    "curvol": 259730,
    "open": 717,
    "high": 719,
    "low": 712,
    "amount": 15652040200,
    "zfFiveMinutes": -13,
    "zhenfu": 97,
    "yesterday": 716
  },
  {
    "code": "600004",
    "stocktype": 2,
    "market": 1,
    "unitanddot": {"pricedot": 2, "unit": 100},
    "newDot": 100,
    "stockname": "白云机场",
    "inVolume": 11510255,
    "now": 1118,
    "zf": -253,
    "zd": -29,
    "hsl": 80,
    "volume": 18913217,
    "curvol": 121500,
    "open": 1147,
    "high": 1149,
    "low": 1114,
    "amount": 21296586200,
    "zfFiveMinutes": -8,
    "zhenfu": 305,
    "yesterday": 1147
  },
  {
    "code": "600006",
    "stocktype": 2,
    "market": 1,
    "unitanddot": {"pricedot": 2, "unit": 100},
    "newDot": 100,
    "stockname": "东风汽车",
    "inVolume": 5482650,
    "now": 550,
    "zf": -108,
    "zd": -6,
    "hsl": 42,
    "volume": 8428331,
    "curvol": 148800,
    "open": 555,
    "high": 557,
    "low": 549,
    "amount": 4652423400,
    "zfFiveMinutes": 0,
    "zhenfu": 143,
    "yesterday": 556
  }
];

List<HqListModel> hqListModelFromJson(String str) => List<HqListModel>.from(
    json.decode(str).map((x) => HqListModel.fromJson(x)));

String hqListModelToJson(List<HqListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HqListModel {
  int market;
  String code;
  int? stocktype;
  int? now;
  int? zf;
  int? zd;
  int? volume;
  int? curvol;
  int? hsl;
  int? open;
  int? high;
  int? low;
  int? amount;
  int? zfFiveMinutes;
  int? zhenfu;
  int? yesterday;
  Unitanddot? unitanddot;
  int? newDot;
  String stockname;
  int? zllx;
  int? lb;

  HqListModel({
    required this.market,
    required this.code,
    this.stocktype,
    this.now,
    this.zf,
    this.zd,
    this.volume,
    this.curvol,
    this.hsl,
    this.open,
    this.high,
    this.low,
    this.amount,
    this.zfFiveMinutes,
    this.zhenfu,
    this.yesterday,
    this.unitanddot,
    this.newDot,
    required this.stockname,
    this.zllx,
    this.lb,
  });

  factory HqListModel.fromJson(Map<String, dynamic> json) {
    var name = json["stockname"];
    if (name == null) {
      if (json['nameLong'] != null) {
        name = json['nameLong'];
      } else if (json['nameQq'] != null) {
        name = json['nameQq'];
      }
    }
    return HqListModel(
      market: json["market"],
      code: json["code"],
      stocktype: json["stocktype"],
      now: json["now"],
      zf: json["zf"],
      zd: json["zd"],
      volume: json["volume"],
      curvol: json["curvol"],
      hsl: json["hsl"],
      open: json["open"],
      high: json["high"],
      low: json["low"],
      amount: json["amount"],
      zfFiveMinutes: json["zfFiveMinutes"],
      zhenfu: json["zhenfu"],
      yesterday: json["yesterday"],
      unitanddot: Unitanddot.fromJson(json["unitanddot"]),
      newDot: json["newDot"],
      stockname: name,
      zllx: json["zllx"],
      lb: json["lb"],
    );
  }

  Map<String, dynamic> toJson() => {
        "market": market,
        "code": code,
        "stocktype": stocktype,
        "stockname": stockname,
        "now": now,
        "zf": zf,
        "zd": zd,
        "volume": volume,
        "curvol": curvol,
        "hsl": hsl,
        "open": open,
        "high": high,
        "low": low,
        "amount": amount,
        "zfFiveMinutes": zfFiveMinutes,
        "zhenfu": zhenfu,
        "yesterday": yesterday,
        "unitanddot": unitanddot?.toJson(),
        "newDot": newDot,
        "zllx": zllx,
        "lb": lb,
      };
}

class Unitanddot {
  int? pricedot;
  int? unit;

  Unitanddot({
    this.pricedot,
    this.unit,
  });

  factory Unitanddot.fromJson(Map<String, dynamic> json) => Unitanddot(
        pricedot: json["pricedot"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "pricedot": pricedot,
        "unit": unit,
      };
}
