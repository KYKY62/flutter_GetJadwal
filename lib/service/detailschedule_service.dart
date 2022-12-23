import 'dart:convert';

import 'package:flutter_getjadwal/config/api.dart';
import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailScheduleService {
  final loginC = Get.put(LoginController());
  Future<List> getDetailSchedule(String day) async {
    List detailSchedule = [];

    try {
      var response = await http.get(
        Uri.parse("${Api.schedule}${loginC.getData.email}&day=$day"),
        headers: {
          "Content-Type": "application/json",
        },
      );

      Map<String, dynamic> obj = jsonDecode(response.body);

      if (obj['status'] == 'Bad Request') {
        throw obj['status'];
      }

      detailSchedule = obj['data'];
      return detailSchedule;
    } catch (e) {
      rethrow;
    }
  }
}
