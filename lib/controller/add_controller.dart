import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/service/add_service.dart';
import 'package:get/state_manager.dart';

class AddController extends GetxController {
  TextEditingController course = TextEditingController();
  var selectedValue = "".obs;

  // Logic jika Kosong
  var isEmpty = false.obs;

  postAddSchedule(String courses, String day) async {
    try {
      await AddScheduleService().addSchedule(course: courses, day: day);
      course.clear();
    } catch (e) {
      return e;
    }
  }
}
