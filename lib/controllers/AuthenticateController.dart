import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:interview_oct/model/user_model.dart';

import '../services/LoginService.dart';

class AuthencateController extends GetxController {


  Future<User> AuthenticateUser({String? email , String? password})async{
    try {
      return LoginService.Authenticate(email:email,password:password);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return LoginService.Authenticate();
    }
  }

}
