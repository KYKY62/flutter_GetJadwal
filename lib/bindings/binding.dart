import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
