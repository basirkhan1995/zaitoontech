// To parse this JSON data, do
//
//     final shippingModel = shippingModelFromJson(jsonString);

import 'dart:convert';

ShippingModel shippingModelFromJson(String str) => ShippingModel.fromJson(json.decode(str));

String shippingModelToJson(ShippingModel data) => json.encode(data.toJson());

class ShippingModel {
  ShippingModel({
    required this.shpId,
    required this.shpCompany,
    required this.shpConsignmentNo,
    required this.shpContainerNo,
    required this.shpFrom,
    required this.shpMoveDate,
    required this.shpTo,
    required this.shpArriveDate,
    required this.shpRemarks,
  });

  String shpId;
  String shpCompany;
  String shpConsignmentNo;
  String shpContainerNo;
  String shpFrom;
  String shpMoveDate;
  String shpTo;
  String shpArriveDate;
  String shpRemarks;

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
    shpId: json["shpID"],
    shpCompany: json["shpCompany"],
    shpConsignmentNo: json["shpConsignmentNo"],
    shpContainerNo: json["shpContainerNo"],
    shpFrom: json["shpFrom"],
    shpMoveDate: json["shpMoveDate"],
    shpTo: json["shpTo"],
    shpArriveDate: json["shpArriveDate"],
    shpRemarks: json["shpRemarks"],
  );

  Map<String, dynamic> toJson() => {
    "shpID": shpId,
    "shpCompany": shpCompany,
    "shpConsignmentNo": shpConsignmentNo,
    "shpContainerNo": shpContainerNo,
    "shpFrom": shpFrom,
    "shpMoveDate": shpMoveDate,
    "shpTo": shpTo,
    "shpArriveDate": shpArriveDate,
    "shpRemarks": shpRemarks,
  };
}
