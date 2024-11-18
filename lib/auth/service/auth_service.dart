// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mystore/auth/model/user_model.dart';
//
//
// class AuthService {
//   final String mockUsername = 'abc';
//   final String mockPassword = '123';
//   final String baseUrl = "https://e-commerce-server-zc33.onrender.com/api/users";
//
//
//   Future<Map<String, dynamic>> signUp(UserModel user) async {
//     final url = Uri.parse("$baseUrl/register");
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(user.toJson()),
//       );
//
//       if ( response.statusCode == 201) {
//
//         return jsonDecode(response.body);
//       } else {
//         throw 'Unable to create user';
//       }
//     } catch (e) {
//       throw " $e";
//     }
//   }
//
//
//   Future<Map<String, dynamic>> loginUser(UserModel user) async {
//     final url = Uri.parse("$baseUrl/login");
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(user.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//
//         return jsonDecode(response.body);
//       } else {
//         throw Exception("Failed to login user: ${response.body}");
//       }
//     } catch (e) {
//       throw Exception("Error during login: $e");
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mystore/auth/comman/api_point.dart';
import 'package:mystore/auth/model/user_model.dart';

class AuthService {
  Future<String> login(UserAdmin user) async {
    String url = ApiEndpoint.LoginUrl;
    String strUser = jsonEncode(user.toMap());
    final response = await http.post(
      Uri.parse(url),
      body: strUser,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final map = jsonDecode(response.body);
      return map['token'];
    } else {
      throw "Inccorect Username password";
    }
  }

  Future<String> signUp(UserAdmin user) async {
    String url = ApiEndpoint.signUpUrl;
    String strUser = jsonEncode(user.toMap());
    final response = await http.post(
      Uri.parse(url),
      body: strUser,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return "Account Created Successfully";
    } else {
      throw ("Unable to create account");
    }
  }
}