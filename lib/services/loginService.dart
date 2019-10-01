import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:animaciones_basicas/models/user.dart';
import 'package:http/http.dart' as http;

class LoginService {

    Future getAuthUser(String email, String password) async {
    var client = new http.Client();
    try {
      var data = { "email": email, "password": password };
      var url = 'https://bogo-ambiental-api.herokuapp.com/api/v1/auth/sign_in';
      final response = await client.post(url, body: data);
      if(response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      }

    } finally {
      client.close();
    }
}
}