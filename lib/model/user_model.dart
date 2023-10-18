import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? errorCode;
  String? errorMsg;
  String? message;
  Result? result;


  User({
    this.errorCode,
    this.errorMsg,
    this.message,
    this.result,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMsg": errorMsg,
    "message": message,
    "result": result!.toJson(),
  };
}

class Result {
  int contactId;
  String firstName;
  String lastName;

  Result({
    required this.contactId,
    required this.firstName,
    required this.lastName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    contactId: json["contactId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "contactId": contactId,
    "firstName": firstName,
    "lastName": lastName,
  };
}
