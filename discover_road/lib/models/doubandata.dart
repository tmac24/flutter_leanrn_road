import 'package:json_annotation/json_annotation.dart';

part 'doubandata.g.dart';

@JsonSerializable()
class Doubandata {
  Doubandata();

  late num count;
  late num start;
  late num total;
  late List verify_users;
  
  factory Doubandata.fromJson(Map<String,dynamic> json) => _$DoubandataFromJson(json);
  Map<String, dynamic> toJson() => _$DoubandataToJson(this);
}
