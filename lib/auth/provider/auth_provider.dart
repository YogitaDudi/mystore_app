
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mystore/auth/model/user_model.dart';
import 'package:mystore/auth/service/auth_service.dart';
class AuthProvider extends ChangeNotifier {
  final AuthService authSrvc;

  AuthProvider(this.authSrvc);

  Future<String?> login(UserAdmin user) async {
    try {
      String token = await authSrvc.login(user);
      return token;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  Future<String> signUp(UserAdmin user) async {
    try {
      String response = await authSrvc.signUp(user);
      notifyListeners();
      return response;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return "Sign up failed";
    }
  }
}


