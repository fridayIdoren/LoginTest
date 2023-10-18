import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class LoginService {
  static var client = http.Client();

  static Future<User> Authenticate({String? email , String? password}) async {
    var response = await client.post(Uri.parse("https://test.renecv.com/authenticate"),
        body:{
            "user":email,
            "password":password
          });
    var jsonString = response.body;
    print("Response String $jsonString");
    if (response.statusCode == 200) {
      return userFromJson(jsonString);
    } else {
      int? errorCode = userFromJson(jsonString).errorCode;
      String? errorMsg = userFromJson(jsonString).errorMsg;
      //if ther is error
      return User(errorCode: errorCode, errorMsg: errorMsg);
      //if ther is error
    }
  }
}
