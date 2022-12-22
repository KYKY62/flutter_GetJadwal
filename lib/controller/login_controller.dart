import 'package:flutter/cupertino.dart';
import 'package:flutter_getjadwal/config/session.dart';
import 'package:flutter_getjadwal/models/user_login.dart';
import 'package:flutter_getjadwal/routes/route_name.dart';
import 'package:flutter_getjadwal/service/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // todo Untuk Menyimpan data User yang Login
  final _data = UserLogin().obs;
  UserLogin get getData => _data.value;
  setData(newUser) => _data.value = newUser;

  var isErrorEmail = false.obs;

  Future<void> loginWithEmail(String email) async {
    try {
      var response = await AuthService.login(email: emailC.text);
      if (response['message'] == 'Success') {
        if (GetUtils.isEmail(emailC.text)) {
          isErrorEmail.value = false;
          Map<String, dynamic> mapUser = response['data'];
          Session.saveUser(UserLogin.fromJson(mapUser));
          await Future.delayed(const Duration(milliseconds: 1800));
          Get.offNamed(RouteName.home);
          emailC.clear();
        }
      } else {
        isErrorEmail.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    super.dispose();
  }
}
