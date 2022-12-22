import 'dart:convert';

import 'package:flutter_getjadwal/config/api.dart';
import 'package:flutter_getjadwal/models/schedule.dart';
import 'package:http/http.dart' as http;

class ScheduleService {
  Future<Schedule> getScheduleService({
    required String email,
  }) async {
    Schedule scheduleData;

    try {
      var response = await http.get(
        Uri.parse("${Api.schedule}$email"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var obj = jsonDecode(response.body);

      if (obj['status'] == 'Bad Request') {
        throw obj['status'];
      }

      scheduleData = Schedule.fromJson(obj);
      return scheduleData;
    } catch (e) {
      rethrow;
    }
  }
}
