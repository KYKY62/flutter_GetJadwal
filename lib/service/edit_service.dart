import 'dart:convert';

import 'package:flutter_getjadwal/config/api.dart';
import 'package:flutter_getjadwal/controller/add_controller.dart';
import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditService {
  final loginC = Get.put(LoginController());
  final cAdd = Get.put(AddController());

  Future editSchedule({
    required String id,
  }) async {
    var url = Uri.parse("${Api.schedule}${loginC.getData.email}&id=$id");
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.patch(
      url,
      headers: headers,
      body: jsonEncode({"title": cAdd.course.text}),
    );

    Map obj = jsonDecode(response.body);
    return obj;
  }
}
