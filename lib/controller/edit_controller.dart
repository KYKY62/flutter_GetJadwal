import 'package:flutter/cupertino.dart';
import 'package:flutter_getjadwal/service/edit_service.dart';
import 'package:get/state_manager.dart';

class EditController extends GetxController {
  TextEditingController titleUpdate = TextEditingController();
  editSchedule(String id) async {
    try {
      await EditService().editSchedule(id: id);
    } catch (e) {
      return e;
    }
  }
}
