import 'package:get/get.dart';

import '../models/LoginResponse.dart';
import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  // login
  Future<LoginResponse> login(String username, String password) async {
    var formData = {'username': username, 'password': password};
    var response = await post('login', formData);

    print(response.body);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return loginResponseFromJson(response.bodyString.toString());
    }
  }

  Future<String> register(
    String username,
    String nama,
    String email,
    String telp,
    String perusahaan,
    String password,
    int idrole,
  ) async {
    var formData = {
      'username': username,
      'nama': nama,
      'email': email,
      'telp': telp,
      'perusahaan': perusahaan,
      'password': password,
      'idrole': idrole,
    };
    var response = await post('register', formData);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body['message'];
    }
  }
}
