import 'dart:convert';

import 'package:flutter_getjadwal/config/api.dart';
import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddScheduleService {
  final loginC = Get.put(LoginController());
  Future<Map> addSchedule({
    required String course,
    required String day,
  }) async {
    Uri url = Uri.parse("${Api.schedule}${loginC.getData.email}");
    Map body = {
      "title": course,
      "day": day,
    };
    var headers = {"Content-Type": "application/json"};
    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );
    Map responseData = jsonDecode(response.body);
    print(responseData);
    return responseData;
  }
}
