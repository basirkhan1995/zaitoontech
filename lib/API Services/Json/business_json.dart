
class CompanyTypes {

  String ctpId;
  String ctpName;
  String ctpLogo;
  String ctpStatus;

  CompanyTypes({
    required this.ctpId,
    required this.ctpName,
    required this.ctpLogo,
    required this.ctpStatus,
  });

  factory CompanyTypes.fromJson(Map<String, dynamic> json) => CompanyTypes(
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

