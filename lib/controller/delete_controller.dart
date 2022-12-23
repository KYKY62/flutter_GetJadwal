import 'package:flutter_getjadwal/service/delete_service.dart';

class DeleteController {
  deleteSchedule(String id) async {
    try {
      await DeleteService().deleteSchedule(id: id);
    } catch (e) {
      return e;
    }
  }
}
