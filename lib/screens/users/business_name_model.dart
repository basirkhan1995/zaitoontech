// To parse this JSON data, do
//
//     final cTypeModel = cTypeModelFromJson(jsonString);

import 'dart:convert';

CTypeModel cTypeModelFromJson(String str) => CTypeModel.fromJson(json.decode(str));

String cTypeModelToJson(CTypeModel data) => json.encode(data.toJson());

class CTypeModel {
  CTypeModel({
    required this.ctpId,
    required this.ctpName,
    required this.ctpLogo,
    required this.ctpStatus,
  });

  String ctpId;
  String ctpName;
  String ctpLogo;
  String ctpStatus;

  factory CTypeModel.fromJson(Map<String, dynamic> json) => CTypeModel(
    ctpId: json["ctpID"],
    ctpName: json["ctpName"],
    ctpLogo: json["ctpLogo"],
    ctpStatus: json["ctpStatus"],
  );

  Map<String, dynamic> toJson() => {
    "ctpID": ctpId,
    "ctpName": ctpName,
    "ctpLogo": ctpLogo,
    "ctpStatus": ctpStatus,
  };
}
