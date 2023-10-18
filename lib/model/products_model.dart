import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  int errorCode;
  dynamic errorMsg;
  dynamic message;
  dynamic result;
  List<ResultList> resultList;

  Products({
    required this.errorCode,
    required this.errorMsg,
    required this.message,
    required this.result,
    required this.resultList,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
    message: json["message"],
    result: json["result"],
    resultList: List<ResultList>.from(json["resultList"].map((x) => ResultList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMsg": errorMsg,
    "message": message,
    "result": result,
    "resultList": List<dynamic>.from(resultList.map((x) => x.toJson())),
  };
}

class ResultList {
  String accountType;
  bool signedUp;

  ResultList({
    required this.accountType,
    required this.signedUp,
  });

  factory ResultList.fromJson(Map<String, dynamic> json) => ResultList(
    accountType: json["accountType"],
    signedUp: json["signedUp"],
  );

  Map<String, dynamic> toJson() => {
    "accountType": accountType,
    "signedUp": signedUp,
  };
}
