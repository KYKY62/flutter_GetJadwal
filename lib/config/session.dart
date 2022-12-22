import 'dart:convert';

import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:flutter_getjadwal/models/user_login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> saveUser(UserLogin userLogin) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = userLogin.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', stringUser);
    if (success) {
      final cLogin = Get.put(LoginController());
      cLogin.setData(userLogin);
    }
    return success;
  }

  static Future<UserLogin> getUser() async {
    UserLogin userLogin = UserLogin(); //nilai default
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      userLogin = UserLogin.fromJson(mapUser);
    }
    final cLogin = Get.put(LoginController());
    cLogin.setData(userLogin);
    return userLogin;
  }

  static Future<bool> deleteUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cLogin = Get.put(LoginController());
    cLogin.setData(UserLogin());
    return success;
  }
}
