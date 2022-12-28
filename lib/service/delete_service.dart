// ignore_for_file: unused_local_variable

import 'package:flutter_getjadwal/config/api.dart';
import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteService {
  final loginC = Get.put(LoginController());
  Future deleteSchedule({
    required String id,
  }) async {
    var response = await http.delete(
      headers: {
        "Content-Type": "application/json",
      },
      Uri.parse("${Api.schedule}${loginC.getData.email}&id=$id"),
    );
  }
}
